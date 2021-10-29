local Event = require 'utils.event' ---@dep utils.event
local Roles = require 'expcore.roles' --- @dep expcore.roles

Event.add(defines.events.on_player_joined_game, function (event)
	local player = game.get_player(event.player_index)
	if not Roles.player_has_role(player, "Regular") then
		Roles.assign_player(player, "Jail")
		player.print({'player-join.jail'})
	end
end)

Event.add(Roles.events.on_role_assigned, function(event)
	for _, role in pairs(event.roles) do
		if role == "Regular" then
			Roles.unassign_player(game.get_player(event.player_index), "Jail")
		end
	end
end)