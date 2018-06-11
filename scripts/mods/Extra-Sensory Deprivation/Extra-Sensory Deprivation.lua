local mod = get_mod("Extra-Sensory Deprivation")

--[[
	Tables
--]]

local gutterrunner_sounds = {
	"enemy_gutterrunner_stinger",
	"Play_gutterrunner_breath_vce"
}

local globadier_sounds = {
	"Play_enemy_foley_globadier_boiling_loop",
	"Stop_enemy_foley_globadier_boiling_loop"
}

local warpfire_sounds = {
	"Play_enemy_warpfire_thrower_foreshadowing",
	"Play_enemy_warpfire_thrower_idle"
}

local corruptor_sounds = {
	"chaos_corruptor_spawning"
}

local packmaster_sounds = {
	"enemy_packmaster_foley"
}

local spotted_enemy_sounds = {
	"gameplay_hearing_a",
	"gameplay_seeing_a"
}

local spotted_item_sounds = {
	"gameplay_spots",
	"health_potion"
}

local removed_sounds = {
	"enemy_gutterrunner_stinger",
	"Play_gutterrunner_breath_vce",
	"gameplay_globadier_guck",
	"enemy_packmaster_foley",
	"gameplay_spots",
	"gameplay_hearing_a",
	"gameplay_seeing_a",
	"Play_enemy_warpfire_thrower_foreshadowing",
	"health_potion"
}

local tutorial_templates_removed = {
	TutorialTemplates.core_needs_help,
	TutorialTemplates.core_revive,
	TutorialTemplates.advanced_grenade,
	TutorialTemplates.play_go_tutorial_tooltip,
	TutorialTemplates.elite_cage_respawn,
	TutorialTemplates.objective_pickup,
	TutorialTemplates.objective_socket,
	TutorialTemplates.objective_unit
}

local event_table = {}

--[[
	Functions
--]]

local function has_string (tab, val)
	for index, value in ipairs(tab) do
        if string.find(val, value) then
            return true
        end
    end

    return false
end

local function set_hooks()
	mod:enable_all_hooks()
	if not mod:get("hide_outlines") then
		mod:hook_disable(OutlineSystem, "distance_to_unit")
	end
	if not mod:get("hide_unitframes") then
		mod:hook_disable(UnitFramesHandler, "update")
	end
	if not mod:get("hide_boss_health") then
		mod:hook_disable(BossHealthUI, "event_show_boss_health_bar")
	end
	if not mod:get("hide_waypoints") then
		for index, value in ipairs(tutorial_templates_removed) do
			mod:hook_disable(value, "can_show")
		end
	end
	if mod:get("hide_pings") then
		OutlineSettings.colors.player_attention.channel = {0, 0, 0, 0}
	else
		OutlineSettings.colors.player_attention.channel = {0, 0, 0, 255}
	end
	if mod:get("silent_specials") == "disabled" then
		mod:hook_disable(WwiseWorld, "trigger_event")
	end
end

--[[
	Hooks
--]]

-- Remove teamates' unit frames

mod:hook(UnitFramesHandler, "update", function (func, them, ...)
	for index, unit_frame in ipairs(them._unit_frames) do
		if index ~= 1 then
			unit_frame.widget:set_visible(false)
		end
	end
	local result = func(them, ...)
	return result
end)

-- Limit Outlines

mod:hook(OutlineSystem, "distance_to_unit", function (func, ...)
	local distance = func(...)
	return distance * 7
end)

-- Remove Sounds

mod:hook(WwiseWorld, "trigger_event", function (func, them, event_name, ...)
	if not event_table[event_name] then
		if mod:get("silent_specials") == "default" then
			if has_string(removed_sounds, event_name) then
				return func(them, nil, ...)
			end
		else
			if mod:get("silent_unit_spotting") then
				if has_string(spotted_enemy_sounds, event_name) then
					return func(them, nil, ...)
				end
			end
			if mod:get("silent_item_spotting") then
				if has_string(spotted_item_sounds, event_name) then
					return func(them, nil, ...)
				end
			end
			if mod:get("silent_gutterrunner") then
				if has_string(gutterrunner_sounds, event_name) then
					return func(them, nil, ...)
				end
			end
			if mod:get("silent_packmaster") then
				if has_string(packmaster_sounds, event_name) then
					return func(them, nil, ...)
				end
			end
			if mod:get("silent_globadier") then
				if has_string(globadier_sounds, event_name) then
					return func(them, nil, ...)
				end
			end
			if mod:get("silent_warpfire") then
				if has_string(warpfire_sounds, event_name) then
					return func(them, nil, ...)
				end
			end
			if mod:get("silent_corruptor") then
				if has_string(corruptor_sounds, event_name) then
					return func(them, nil, ...)
				end
			end
		end
		event_table[event_name] = 1
	end
	local result = func(them, event_name, ...)
	return result
end)

-- Remove tutorial waypoints (Floating objective markers)

for index, value in ipairs(tutorial_templates_removed) do
	mod:hook(value, "can_show", function (func, ...)
		local ok, objective_units, objective_units_n = func(...)
		return false, objective_units, objective_units_n
	end)
end

-- Remove boss healthbars

mod:hook(BossHealthUI, "event_show_boss_health_bar", function (func, them, unit, ...)
	return func (them, nil, ...)
end)

--[[
	Callback
--]]

-- Call on every update to mods
mod.update = function(dt)
	return
end

-- Call when all mods are being unloaded
mod.on_unload = function(exit_game)
	return
end

-- Call when game state changes (e.g. StateLoading -> StateIngame)
mod.on_game_state_changed = function(status, state)
	return
end

-- Call when setting is changed in mod settings
mod.on_setting_changed = function(setting_name)
	set_hooks()
	return
end

-- Call when governing settings checkbox is unchecked
mod.on_disabled = function(is_first_call)
	mod:disable_all_hooks()
end

-- Call when governing settings checkbox is checked
mod.on_enabled = function(is_first_call)
	set_hooks()
	Application.set_user_setting("player_outlines", "off")
	Application.set_user_setting("use_subtitles", false)
end


--[[
	Execution
--]]


