/obj/item/rcd_upgrade/pizza
	name = "RCD advanced upgrade: pizza"
	desc = "It contains the design for... pizza?"
	icon_state = "datadisk9"
	upgrade = RCD_UPGRADE_PIZZA

/obj/item/construction/rcd/pizza
	name = "pizza RCD"
	construction_upgrades = RCD_UPGRADE_PIZZA
	matter = 160

// /turf/closed/wall/material/pizza
// 	name = "pizza wall"

/turf/closed/wall/material/pizza/Initialize(mapload)
	. = ..()
	var/list/materials = list(/datum/material/pizza = 200)
	set_custom_materials(materials)
