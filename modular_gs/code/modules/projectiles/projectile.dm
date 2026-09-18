// allow EVERY projectile to be fattening. Only good things can come from this
/obj/projectile
	/// How much fat is added onto the target?
	var/fat_added = 0

/obj/projectile/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()

	if (. == BULLET_ACT_BLOCK)
		return .

	if (iscarbon(target))
		var/mob/living/carbon/carbon_target = target
		carbon_target.adjust_fatness(fat_added, FATTENING_TYPE_WEAPON)

	return .

/obj/projectile/beam/fattening/on_hit(atom/target, blocked, pierce_hit)
	. = ..()

	if (. == BULLET_ACT_BLOCK)
		return .

	if (iscarbon(target))
		var/mob/living/carbon/carbon_target = target
		if (carbon_target.micro_calorite_poisoning >= 1)
			if (carbon_target.adjust_calorite_poisoning(-0.01 * fat_added))
				carbon_target.adjust_perma(1 * fat_added, FATTENING_TYPE_WEAPON, TRUE)

	return .
