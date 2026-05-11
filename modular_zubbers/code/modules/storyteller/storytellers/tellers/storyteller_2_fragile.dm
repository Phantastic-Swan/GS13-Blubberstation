/datum/storyteller/fragile
	name = "Fragile (Medium-Low Chaos)"
	desc = "The Fragile will limit destructive, combat-focused, and chaotic events. \
	Spawns more events and allows for more combat than the Chill, but remains lower in frequency than Default Andy. It will also repeat events less than the Chill."
	welcome_text = "Handle with care!"

	event_repetition_multiplier = 0.5

	track_data = /datum/storyteller_data/tracks/fragile

	tag_multipliers = list(
		TAG_COMBAT = 0.3,
		TAG_DESTRUCTIVE = 0.2,
		TAG_CHAOTIC = 0.2
	)
	storyteller_type = STORYTELLER_TYPE_ALWAYS_AVAILABLE

// GS13 EDIT
// original values: 1200, 1800, 10000, 3000, 6800
/datum/storyteller_data/tracks/fragile
	threshold_mundane = 60
	threshold_moderate = 120
	threshold_major = 360
	threshold_crewset = 1200
	threshold_ghostset = 600
// GS13 END EDIT
