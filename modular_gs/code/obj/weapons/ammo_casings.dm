/obj/item/ammo_casing/energy/fattening
	name = "fattening weapon lens"
	select_name = "fatten"
	projectile_type = /obj/projectile/beam/fattening
	harmful = FALSE

/obj/item/ammo_casing/energy/fattening/weak
	name = "budget fattening weapon lens"
	select_name = "fatten"
	projectile_type = /obj/projectile/beam/fattening/weak

/obj/item/ammo_casing/energy/fattening/cheap
	name = "efficient fattening weapon lens"
	e_cost = LASER_SHOTS(20, STANDARD_CELL_CHARGE)

/obj/item/ammo_casing/energy/fattening/stun
	name = "calorite-disabler weapon lens"
	select_name = "disable-fatten"
	projectile_type = /obj/projectile/beam/fattening/stun

/obj/item/ammo_casing/energy/fattening/cannon
	name = "one-shot fattening weapon lens"
	e_cost = 1000
	projectile_type = /obj/projectile/beam/fattening/cannon

/obj/item/ammo_casing/energy/fattening/cannon/weak
	e_cost = 1600
	projectile_type = /obj/projectile/beam/fattening/cannon/weak
