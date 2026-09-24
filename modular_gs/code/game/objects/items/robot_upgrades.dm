/obj/item/borg/upgrade/weight_analyzer
	name = "borg weight analyzer module"
	desc = "A module that allows cyborgs to view and scan the weight of organic beings."
	icon_state = "module_general"

	items_to_add = list(/obj/item/portable_weight_scanner)
	custom_materials = list(/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT, /datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT)

/obj/item/borg/upgrade/weight_analyzer/action(mob/living/silicon/robot/borg, mob/living/user)
	. = ..()
	ADD_TRAIT(src, TRAIT_FAT_SCANNER)
