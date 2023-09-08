return {
	inventories = {
		{
			inventory = defines.inventory.character_ammo,
			event = defines.events.on_player_ammo_inventory_changed,
			items = {
				["atomic-bomb"] = true
			},
		},
		{
			inventory = defines.inventory.character_armor,
			event = defines.events.on_player_armor_inventory_changed,
			items = {},
		},
		{
			inventory = defines.inventory.character_guns,
			event = defines.events.on_player_gun_inventory_changed,
			items = {},
		},
		{
			inventory = defines.inventory.character_main,
			event = defines.events.on_player_main_inventory_changed,
			items = {
				["atomic-bomb"] = true
			},
		},
	},
	ignore_permisison = "bypass-nukeprotect", -- @setting ignore_permisison The permission that nukeprotect will ignore
	ignore_admins = true,                  -- @setting ignore_admins Ignore admins, true by default. Allows usage outside of the roles module
	disable_nuke_research = false,          -- @setting disable_nuke_research Disable the nuke research, true by default
	disable_nuke_research_names = {
		["atomic-bomb"] = true
	} -- @setting disable_nuke_research_names The names of the researches to disabled
}
