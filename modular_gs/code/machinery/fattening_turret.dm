
/obj/machinery/porta_turret/syndicate/fattening
	name = "Fatoray Turret"
	integrity_failure = 0
	max_integrity = 150
	always_up = 1
	use_power = NO_POWER_USE
	has_cover = 0
	scan_range = 10
	shot_delay = 10
	reqpower = 0
	lethal_projectile = /obj/projectile/beam/fattening
	lethal_projectile_sound = 'sound/items/weapons/laser.ogg'
	stun_projectile = /obj/projectile/beam/fattening
	stun_projectile_sound = 'sound/items/weapons/laser.ogg'
	icon_state = "turretCover"
	base_icon_state = "standard"
	faction = list(FACTION_TURRET)
	req_access = list(ACCESS_SYNDICATE)
	desc = "A laser turret with calorite focusing lens."

/obj/machinery/porta_turret/syndicate/fattening/heavy
	name = "Heavy Fatoray Turret"
	lethal_projectile = /obj/projectile/beam/fattening/cannon
	shot_delay = 30
	max_integrity = 200

/obj/machinery/porta_turret/syndicate/fattening/setup()
	return

// /obj/machinery/porta_turret/syndicate/fattening/assess_perp(mob/living/carbon/human/perp)
// 	return 10 //fattening turrets shoot everything except the syndicate
