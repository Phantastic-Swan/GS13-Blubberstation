/datum/controller/subsystem/gamemode/proc/cap_storyteller_thresholds()
	var/list/old_vote_tallies = event_track_points.Copy()
	event_track_points[EVENT_TRACK_MUNDANE] = min(event_track_points[EVENT_TRACK_MUNDANE], point_thresholds[EVENT_TRACK_MUNDANE])
	event_track_points[EVENT_TRACK_MODERATE] = min(event_track_points[EVENT_TRACK_MODERATE], point_thresholds[EVENT_TRACK_MODERATE])
	event_track_points[EVENT_TRACK_MAJOR] = min(event_track_points[EVENT_TRACK_MAJOR], point_thresholds[EVENT_TRACK_MAJOR])
	event_track_points[EVENT_TRACK_CREWSET] = min(event_track_points[EVENT_TRACK_CREWSET], point_thresholds[EVENT_TRACK_CREWSET])
	event_track_points[EVENT_TRACK_GHOSTSET] = min(event_track_points[EVENT_TRACK_GHOSTSET], point_thresholds[EVENT_TRACK_GHOSTSET])
	var/list/log_data = list(
		"points before switch" = old_vote_tallies,
		"points after switch" = event_track_points,
	)
	log_admin("Storyteller changed from the instant storyteller vote.", log_data)
