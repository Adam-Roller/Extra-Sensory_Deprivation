local mod = get_mod("Extra-Sensory Deprivation")

-- Everything here is optional. You can remove unused parts.
return {
	name = "Extra-Sensory Deprivation",                               -- Readable mod name
	description = mod:localize("Removes several forms of Extra-Sensory-Perception provided by the game. Also adds the ability to silence some specials to make them more sneaky."),  -- Mod description
	is_togglable = true,                            -- If the mod can be enabled/disabled
	is_mutator = false,                             -- If the mod is mutator
	mutator_settings = {},                          -- Extra settings, if it's mutator
	options_widgets = {                             -- Widget settings for the mod options menu
		{
			["setting_name"] = "hide_outlines",
			["widget_type"] = "checkbox",
			["text"] = mod:localize("Hide Outlines"),
			["tooltip"] = mod:localize("Hide Outlines") .. "\n" .. mod:localize("Hides both player and item outlines unless at point blank distance"),
			["default_value"] = true
		},
		{
			["setting_name"] = "hide_unitframes",
			["widget_type"] = "checkbox",
			["text"] = mod:localize("Hide Party Frames"),
			["default_value"] = true
		},
		{
			["setting_name"] = "hide_boss_health",
			["widget_type"] = "checkbox",
			["text"] = mod:localize("Hide Boss Healthbars"),
			["default_value"] = true
		},
		{
			["setting_name"] = "hide_waypoints",
			["widget_type"] = "checkbox",
			["text"] = mod:localize("Hide Waypoints"),
			["tooltip"] = mod:localize("Hide Waypoints") .. "\n" .. mod:localize("Hides the floating icons pointing towards objectives, downed teamates, and revives"),
			["default_value"] = true
		},
		{
			["setting_name"] = "hide_pings",
			["widget_type"] = "checkbox",
			["text"] = mod:localize("Hide Pings"),
			["tooltip"] = mod:localize("Hide Pings") .. "\n" .. mod:localize("Hides the outline effect when pinging something (game still recognizes items as pinged)"),
			["default_value"] = true
		},
		{
			["setting_name"] = "silent_specials",
			["widget_type"] = "dropdown",
			["text"] = mod:localize("Silent Specials"),
			["options"] = {
				{--[[1]] text = mod:localize("Default"), value = "default"},
				{--[[2]] text = mod:localize("Custom"), value = "custom"},
				{--[[3]] text = mod:localize("Disabled"), value = "disabled"},
			},
			["default_value"] = "default",
			["sub_widgets"] = {
				{
					["show_widget_condition"] = {2},
					
					["setting_name"] = "silent_unit_spotting",
					["widget_type"] = "checkbox",
					["text"] = mod:localize("Unit Spotting"),
					["tooltip"] = mod:localize("Unit Spotting") .. "\n" .. mod:localize("Mutes the dialogue options when a party member sees or hears a special unit"),
					["default_value"] = true
				},
				{
					["show_widget_condition"] = {2},
					
					["setting_name"] = "silent_item_spotting",
					["widget_type"] = "checkbox",
					["text"] = mod:localize("Item Spotting"),
					["tooltip"] = mod:localize("Item Spotting") .. "\n" .. mod:localize("Mutes the dialogue options when a party member sees a consumable item"),
					["default_value"] = true
				},
				{
					["show_widget_condition"] = {2},
					
					["setting_name"] = "silent_gutterrunner",
					["widget_type"] = "checkbox",
					["text"] = mod:localize("Gutterrunner"),
					["default_value"] = true
				},
				{
					["show_widget_condition"] = {2},
					
					["setting_name"] = "silent_packmaster",
					["widget_type"] = "checkbox",
					["text"] = mod:localize("Packmaster"),
					["default_value"] = true
				},
				{
					["show_widget_condition"] = {2},
					
					["setting_name"] = "silent_globadier",
					["widget_type"] = "checkbox",
					["text"] = mod:localize("Globadier"),
					["default_value"] = true
				},
				{
					["show_widget_condition"] = {2},
					
					["setting_name"] = "silent_warpfire",
					["widget_type"] = "checkbox",
					["text"] = mod:localize("Warpfire Thrower"),
					["default_value"] = true
				},
				{
					["show_widget_condition"] = {2},
					
					["setting_name"] = "silent_corrupter",
					["widget_type"] = "checkbox",
					["text"] = mod:localize("Corrupter"),
					["default_value"] = true
				}
			}
		}																			
	}
}