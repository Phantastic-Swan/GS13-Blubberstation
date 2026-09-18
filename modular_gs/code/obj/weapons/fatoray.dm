///The base fatoray
/obj/item/gun/energy/fatoray
	name = "Fatoray"
	desc = "An energy gun that fattens up anyone it hits."
	icon = 'modular_gs/icons/obj/weapons/fatoray.dmi'
	lefthand_file = 'modular_gs/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_gs/icons/mob/inhands/guns_righthand.dmi'
	icon_state = "fatoray"
	inhand_icon_state = "fatoray"
	pin = /obj/item/firing_pin
	fire_sound = 'sound/items/weapons/plasma_cutter.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/fattening)

/// cannon variant, strong but can be charged
/obj/item/gun/energy/fatoray/cannon
	name = "Fatoray Cannon"
	desc = "An energy gun that fattens up anyone it hits. This version functions as a glass cannon of some sorts."
	icon_state = "fatoray_cannon"
	recoil = 3
	can_charge = TRUE
	slowdown = 1
	weapon_weight = WEAPON_HEAVY
	ammo_type = list(/obj/item/ammo_casing/energy/fattening/cannon)

/obj/item/gun/energy/fatoray/stunning	// it's STUNNINGLY effective
	name = "\improper GATO EG-1 Salamander"
	desc = "An advanced energy gun that both stuns and fattens up its target."
	icon_state = "immobilizer"
	ammo_type = list(/obj/item/ammo_casing/energy/fattening/stun)

////////////////////////////////////////////////////////////////////
////////FATORAYS THAT CAN BE MADE BY LATHES OR RESEARCHED///////////
////////////////////////////////////////////////////////////////////

///Weaker version of fatoray
/obj/item/gun/energy/fatoray/weak
	name = "Basic Fatoray"
	desc = "An energy gun that fattens up anyone it hits. This version is considerably weaker than its original counterpart, the technology behind it seemingly still not perfected."
	icon_state = "fatoray_weak"
	ammo_type = list(/obj/item/ammo_casing/energy/fattening/weak)
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 0.4,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 0.3,
		/datum/material/calorite = SHEET_MATERIAL_AMOUNT * 0.5
		)

///Single shot glass cannon fatoray
/obj/item/gun/energy/fatoray/cannon/weak
	name = "Basic Fatoray Cannon"
	icon_state = "fatoray_cannon_weak"
	ammo_type = list(/obj/item/ammo_casing/energy/fattening/cannon/weak)
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 0.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 0.4,
		/datum/material/calorite = SHEET_MATERIAL_AMOUNT
		)

/obj/item/gun/energy/e_gun/fattening
	name = "\improper GATO EG-2 Matador"
	desc = "A basic hybrid energy gun with two settings: disable and fatten."
	icon = 'modular_gs/icons/obj/weapons/fatoray.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/fattening)
