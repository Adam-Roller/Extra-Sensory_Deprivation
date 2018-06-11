return {
	run = function()
		fassert(rawget(_G, "new_mod"), "Extra-Sensory Deprivation must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("Extra-Sensory Deprivation", {
			mod_script       = "scripts/mods/Extra-Sensory Deprivation/Extra-Sensory Deprivation",
			mod_data         = "scripts/mods/Extra-Sensory Deprivation/Extra-Sensory Deprivation_data",
			mod_localization = "scripts/mods/Extra-Sensory Deprivation/Extra-Sensory Deprivation_localization"
		})
	end,
	packages = {
		"resource_packages/Extra-Sensory Deprivation/Extra-Sensory Deprivation"
	}
}
