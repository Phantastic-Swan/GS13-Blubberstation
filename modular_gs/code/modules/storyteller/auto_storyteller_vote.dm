/datum/vote/storyteller/instant
	name = "Instant Storyteller"
	default_message = "Vote for the storyteller! This vote will change the storyteller instantly."

/datum/vote/storyteller/instant/can_be_initiated(mob/by_who, forced = FALSE)
	. = ..()
	if(forced)
		return TRUE

	return VOTE_AVAILABLE

/datum/vote/storyteller/instant/finalize_vote(winning_option)
	..()
	/// Find the winner
	var/datum/storyteller/voted_storyteller
	for(var/storyteller_type in SSgamemode.storytellers)
		var/datum/storyteller/storyboy = SSgamemode.storytellers[storyteller_type]
		if(storyboy.name == winning_option)
			voted_storyteller = storyteller_type
			break
	
	if (voted_storyteller == null)
		return

	SSgamemode.set_storyteller(voted_storyteller)
	SSgamemode.cap_storyteller_thresholds()
