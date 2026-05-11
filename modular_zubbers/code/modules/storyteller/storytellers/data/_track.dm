// A point is added every second, adjust new track threshold overrides accordingly

/// Storyteller track data, for easy overriding of tracks without having to copypaste
/// thresholds - Used to show how many points the track has to collect before it triggers, lower means faster
// GS13 EDIT
// original values: 1200, 1800, 7000, 2400, 6000
// For any future coder, the reason why we changed the numbers this way is for easy making of more storytellers
// Using our default configs, the value for these tracks is how many minutes till each track fires
// WARNING: Crewset always starts half full so cut it's time in half
/datum/storyteller_data/tracks
	var/threshold_mundane = 45
	var/threshold_moderate = 75
	var/threshold_major = 300
	var/threshold_crewset = 300
	var/threshold_ghostset = 150
// GS13 END EDIT
