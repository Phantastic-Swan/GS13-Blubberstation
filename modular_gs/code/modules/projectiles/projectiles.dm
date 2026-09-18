///The base projectile used by the fatoray
/obj/projectile/beam/fattening
	name = "fat energy"
	icon = 'modular_gs/icons/obj/weapons/fatoray.dmi'
	icon_state = "ray"
	ricochets_max = 50
	ricochet_chance = 80
	damage = 0
	eyeblur = 0
	damage_type = STAMINA
	light_range = 2
	light_color = LIGHT_COLOR_ORANGE
	fat_added = 200

/// variant that actually does stamina damage
/obj/projectile/beam/fattening/stun
	fat_added = 100
	damage = 25

/obj/projectile/beam/fattening/weak
	fat_added = 100

/obj/projectile/beam/fattening/cannon
	icon_state = "cannon_ray"
	fat_added = 800

/obj/projectile/beam/fattening/cannon/weak
	fat_added = 400