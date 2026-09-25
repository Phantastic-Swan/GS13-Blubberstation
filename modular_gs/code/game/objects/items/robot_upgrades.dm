/obj/item/borg/upgrade/weight_analyzer
	name = "borg weight analyzer module"
	desc = "A module that allows cyborgs to view and scan the weight of organic beings."
	icon_state = "module_general"

	items_to_add = list(/obj/item/portable_weight_scanner)
	custom_materials = list(/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT, /datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT)

/obj/item/borg/upgrade/weight_analyzer/action(mob/living/silicon/robot/borg, mob/living/user)
	. = ..()
	ADD_TRAIT(src, TRAIT_FAT_SCANNER, "borg_module")

/obj/item/borg/upgrade/fatoray
	name = "borg fatoray module"
	desc = "This module allows the cyborg to shoot fattening projectiles. Harmless if you ignore the damage done to waistlines."
	icon_state = "module_peace"

	items_to_add = list(/obj/item/gun/energy/fatoray/weak/cyborg)
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 0.4,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 0.3,
		/datum/material/calorite = SHEET_MATERIAL_AMOUNT * 0.5
		)
