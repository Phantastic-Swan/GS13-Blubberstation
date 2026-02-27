/datum/preference/numeric/starting_fatness
	category = WG_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "starting_fatness"
	minimum = FATNESS_LEVEL_NONE
	maximum = FATNESS_LEVEL_BLOB

/datum/preference/numeric/starting_fatness/create_default_value()
	return FATNESS_LEVEL_NONE

/datum/preference/numeric/starting_fatness/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.fatness_real = value

/datum/preference/numeric/weight_gain_rate
	category = WG_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "weight_gain_rate"
	minimum = MIN_PREFS_WEIGHT_GAIN_AND_LOSS_RATE
	maximum = MAX_PREFS_WEIGHT_GAIN_AND_LOSS_RATE
	step = 0.01

/datum/preference/numeric/weight_gain_rate/create_default_value()
	return DEFAULT_PREFS_WEIGHT_GAIN_AND_LOSS_RATE

/datum/preference/numeric/weight_gain_rate/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.weight_gain_rate = value

/datum/preference/numeric/weight_loss_rate
	category = WG_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "weight_loss_rate"
	minimum = MIN_PREFS_WEIGHT_GAIN_AND_LOSS_RATE
	maximum = MAX_PREFS_WEIGHT_GAIN_AND_LOSS_RATE
	step = 0.01

/datum/preference/numeric/weight_loss_rate/create_default_value()
	return DEFAULT_PREFS_WEIGHT_GAIN_AND_LOSS_RATE

/datum/preference/numeric/weight_loss_rate/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.weight_loss_rate = value

/datum/preference/numeric/max_weight
	category = WG_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "max_weight"
	minimum = 0
	maximum = INFINITY

/datum/preference/numeric/max_weight/create_default_value()
	return 0

/datum/preference/numeric/max_weight/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.max_weight = value


/datum/preference/toggle/weight_gain_persistent
	category = WG_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "weight_gain_persistent"
	default_value = FALSE

/datum/preference/toggle/weight_gain_persistent/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return

/datum/preference/toggle/weight_gain_permanent
	category = WG_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "weight_gain_permanent"
	default_value = FALSE

/datum/preference/toggle/weight_gain_permanent/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return

/datum/preference/toggle/severe_fatness_penalty
	category = WG_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "severe_fatness_penalty"
	default_value = FALSE

/datum/preference/toggle/severe_fatness_penalty/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return

/datum/preference/toggle/safe_bursting
	category = BLUEBERRY_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "safe_bursting"
	default_value = TRUE

/datum/preference/toggle/safe_bursting/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return

/datum/preference/toggle/see_bursting
	category = BLUEBERRY_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "see_bursting"
	default_value = FALSE

/datum/preference/toggle/see_bursting/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return
