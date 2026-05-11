SUBSYSTEM_DEF(auto_storyteller_vote)
	name = "Automatic Storyteller Vote"
	flags = SS_KEEP_TIMING | SS_BACKGROUND
	wait = 1 MINUTES

	var/starttime
	var/targettime
	var/voteinterval

/datum/controller/subsystem/auto_storyteller_vote/Initialize()
	if(!CONFIG_GET(flag/autostoryteller)) //Autotransfer voting disabled.
		can_fire = FALSE
		return SS_INIT_NO_NEED

	var/init_vote = CONFIG_GET(number/vote_autostoryteller_initial)
	starttime = REALTIMEOFDAY
	targettime = starttime + init_vote
	voteinterval = CONFIG_GET(number/vote_autostoryteller_interval)
	return SS_INIT_SUCCESS

/datum/controller/subsystem/auto_storyteller_vote/Recover()
	starttime = SSauto_storyteller_vote.starttime
	voteinterval = SSauto_storyteller_vote.voteinterval

/datum/controller/subsystem/auto_storyteller_vote/fire()
	if(REALTIMEOFDAY < targettime || !SSticker.current_state == GAME_STATE_PLAYING)
		return
	if(!isnull(SSvote.current_vote))
		return

	SSvote.initiate_vote(/datum/vote/storyteller/instant, "automatic storyteller vote", forced = TRUE)
	targettime = targettime + voteinterval
