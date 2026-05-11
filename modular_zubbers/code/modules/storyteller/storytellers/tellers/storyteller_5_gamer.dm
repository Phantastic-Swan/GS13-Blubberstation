/datum/storyteller/gamer
	name = "Gamer (High Chaos)"
	desc = "The Gamer will try to create the most combat focused events, while trying to avoid purely destructive ones. \
	More combat-focused and frequent events than the Default, but stays ordered to avoid creating a hellshift, unlike the Clown."
	welcome_text = "Welcome to the Gamer storyteller. Now with 50% more ahelps!"

	track_data = /datum/storyteller_data/tracks/gamer

	tag_multipliers = list(
		TAG_COMBAT = 1.5,
		TAG_DESTRUCTIVE = 0.7,
		TAG_CHAOTIC = 1.3
	)
	population_min = 15 // GS13 EDIT: 35
	antag_divisor = 5
	storyteller_type = STORYTELLER_TYPE_INTENSE

// GS13 EDIT
// original values: 1200, 1300, 4000, 2000, 4800
/datum/storyteller_data/tracks/gamer
	threshold_mundane = 60
	threshold_moderate = 90
	threshold_major = 150
	threshold_crewset = 240
	threshold_ghostset = 120
// GS13 END EDIT
