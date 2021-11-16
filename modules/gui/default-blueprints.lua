--- Allows for default blueprints
-- @addon default-blueprints

local Global = require 'utils.global' --- @dep utils.global
local Event = require 'utils.event' --- @dep utils.event
local Roles = require 'expcore.roles' --- @dep expcore.roles
local Gui = require 'expcore.gui'  --- @dep expcore.gui
local config = require 'config.gui.default-blueprints'  --- @dep config.gui.default-blueprints

local bps_per_line = 6

local blueprint_data = {
	inventory=nil
}

Global.register(blueprint_data, function(t)
	blueprint_data = t
end)

local function create_blueprint_rows(container)
	for linei = 1, config.blueprint_count / bps_per_line or 1  do
		--TODO: change this LuaGuiElement.add to the Gui.element{} from the base scenario
		local line = container.add{
			type="flow",
			tags={
				index=linei
			}
		}
		for itemi = 1, bps_per_line do
			local index = (linei-1) * bps_per_line + itemi
			local bp = blueprint_data.inventory and blueprint_data.inventory[index]
			local signal = bp and bp.blueprint_icons and bp.blueprint_icons[1].signal
			local sprite = signal and signal.type .. (signal.name and ("/" .. signal.name)) or ""
			local element = line.add{
				type="sprite-button",
				tooltip="Some Blueprint Tooltip",
				sprite=sprite,
				tags={
					mod="scenario",
					feature="default-blueprint-selector",
					index=index
				}
			}
			element.style.natural_width = 128
			element.style.natural_height = 128
			element.style.maximal_width = 256
			element.style.maximal_height = 256
		end
	end
end

local function redraw_blueprints(container)
	for linei = 1, config.blueprint_count / bps_per_line or 1  do
		local line
		for _, element in ipairs(container.children) do
			if element.tags.index == linei then line = element end
		end
		for itemi = 1, bps_per_line do
			local index = (linei-1) * bps_per_line + itemi
			local bp = blueprint_data.inventory and blueprint_data.inventory[index]
			local signal = bp and bp.blueprint_icons and bp.blueprint_icons[1].signal
			local sprite = signal and signal.type .. (signal.name and ("/" .. signal.name)) or ""
			local element
			for _, e in ipairs(line.children) do
				if e.tags.index == index then
					element = e
					break
				end
			end
			element.sprite = sprite
			element.tooltip = "Some Blueprint Tooltip"
		end
	end
end

Event.add(defines.events.on_player_created, function (event)
	if event.player_index == 1 then
		blueprint_data.inventory = game.create_inventory(config.blueprint_count)
	end
end)

Event.add(defines.events.on_gui_click, function (event)
	-- if it is not a blueprint button then we are done
	if event.element.tags.mod ~= "scenario" or event.element.tags.feature ~= "default-blueprint-selector" then return end

	local player = game.get_player(event.player_index)
	local blueprint_index = event.element.tags.index

	-- if the item is not a BP, BP book, decon or upgrade planner, then ignore the click
	-- also ignore if player has nothing or blueprint is blank
	if not Roles.player_allowed(player, 'gui/default-blueprints') then
		if not player.is_cursor_blueprint() then
			if 	blueprint_data.inventory[blueprint_index].valid_for_read
				and player.clear_cursor()
				then
				player.cursor_stack.set_stack(blueprint_data.inventory[blueprint_index])
			end
			return
		end
		return
	end
	if event.button == defines.mouse_button_type.left then
		if not player.is_cursor_blueprint() then
			if 	blueprint_data.inventory[blueprint_index].valid_for_read
				and player.clear_cursor()
				then
				player.cursor_stack.set_stack(blueprint_data.inventory[blueprint_index])
			end
			return
		end
		blueprint_data.inventory[blueprint_index].set_stack(player.cursor_stack)
	elseif event.button == defines.mouse_button_type.right then
		blueprint_data.inventory[blueprint_index].clear()
	end
	redraw_blueprints(event.element.parent.parent) -- get the scroll_table as it is the parent's parent
end)

local blueprint_container =
Gui.element(function(event_trigger, parent)
    local player = Gui.get_player_from_element(parent)

    -- Draw the internal container
    local container = Gui.container(parent, event_trigger, 200)

    -- Draw the header
    Gui.header(container, {'default-blueprints.main-caption'}, {'default-blueprints.main-tooltip'})

    -- Draw the scroll table for the blueprints
    local scroll_table = Gui.scroll_table(container, 400, 1)
	scroll_table.tags.someData = true
	-- Set the scroll panel to always show the scrollbar (not doing this will result in a changing gui size)
	scroll_table.parent.vertical_scroll_policy = 'always'
	-- Scroll panel has by default padding
	scroll_table.parent.style.padding = 0
	-- Remove the default gap that is added in a table between elements
	scroll_table.style.vertical_spacing = 0
	-- Center the first collumn in the table
	scroll_table.style.column_alignments[1] = 'center'
	
	create_blueprint_rows(scroll_table)

    -- Return the exteral container
    return container.parent
end)
:add_to_left_flow()

Gui.left_toolbar_button('item/blueprint', {'default-blueprints.main-tooltip'}, blueprint_container)