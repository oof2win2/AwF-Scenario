--- Log decon of players
-- @addon decon-log

local Event = require 'utils.event' --- @dep utils.event
local Global = require 'utils.global' --- @dep utils.global
local Roles = require 'expcore.roles' --- @dep expcore.roles
local Datastore = require 'expcore.datastore' --- @dep expcore.datastore
local Commands = require 'expcore.commands' --- @dep expcore.commands
local config = require 'config.action-log'

local ActionLog = Datastore.connect('ActionLog')
ActionLog:set_serializer(function(rawKey) -- parse player into player name
    return rawKey.name
end)

-- Event.add(defines.events.on_player_mined_entity, function(event)

-- end)

-- every 15s collect position of players
Event.on_nth_tick(15*60, function(event)
	local tick = event.tick
	for _, player in pairs(game.players) do
		local hasBypass = Roles.player_has_flag(player, config.bypass_flag)
		if hasBypass then return end
		
		ActionLog:update(player, function (player_name, data)
			if data == nil then data = {} end

			table.insert(data, {
				tick=tick,
				type="position",
				position=player.position
			})
		end)
	end
end)

Commands.new_command("action-log", "View the log of actions of a player")
:add_param('player', false, 'player-online')
:register(function (player, target)
	local playerData = ActionLog:get(target)
	if not playerData then
		return Commands.error("Player " .. target.name .. " doesn't have any logs")
	end

	for i, log in ipairs(playerData) do
		local previous
		if i > 0 then
			previous = playerData[i - 1]
		end
		-- TODO: check if this works
		if log.type == "position" then
			if previous then
				-- render the path the player took
				rendering.draw_line{
					color={204, 80, 54, 180},
					width=2,
					from=previous,
					to=log.position,
					
				}
			end
		end
	end

end)