--- Allows for default blueprints
-- @addon default-blueprints

local Global = require 'utils.global' --- @dep utils.global
local Event = require 'utils.event' --- @dep utils.event
local Gui = require 'expcore.gui'
local config = require 'config.gui.default-blueprints'

local blueprint_data = {
	inventory=nil
}

local bps_per_line = 6

Global.register(blueprint_data, function(t)
	blueprint_data = t
	if not blueprint_data.inventory then
		blueprint_data.inventory = game.create_inventory(config.blueprint_count / 4 or 1 * 4)
	end
end)

local blueprint_container =
Gui.element(function(event_trigger, parent)
    local player = Gui.get_player_from_element(parent)

    -- Draw the internal container
    local container = Gui.container(parent, event_trigger, 200)

    -- Draw the header
    Gui.header(container, {'default-blueprints.main-caption'}, {'default-blueprints.main-tooltip'})

    -- Draw the scroll table for the blueprints
    local scroll_table = Gui.scroll_table(container, 178, 1)
	-- Set the scroll panel to always show the scrollbar (not doing this will result in a changing gui size)
	scroll_table.parent.vertical_scroll_policy = 'always'
	-- Scroll panel has by default padding
	scroll_table.parent.style.padding = 0
	-- Remove the default gap that is added in a table between elements
	scroll_table.style.vertical_spacing = 0
	-- Center the first collumn in the table
	scroll_table.style.column_alignments[1] = 'center'
	
	for linei = 1, config.blueprint_count / bps_per_line or 1  do
		local line = scroll_table.add{
			type="flow",
		}
		for itemi = 1, bps_per_line do
			line.add{
				type="sprite-button"
			}
		end
	end

    -- Return the exteral container
    return container.parent
end)
:add_to_left_flow()

Gui.left_toolbar_button('item/blueprint', {'default-blueprints.main-tooltip'}, blueprint_container)