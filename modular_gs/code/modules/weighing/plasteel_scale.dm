/obj/structure/plasteel_scale
	name = "large scale"
	desc = "You can weigh yourself with this."
	icon = 'modular_gs/icons/obj/megascale.dmi'
	icon_state = "gato_industryscale"
	anchored = TRUE
	resistance_flags = NONE
	max_integrity = 250
	integrity_failure = 25
	layer = OBJ_LAYER
	custom_materials = list(/datum/material/alloy/plasteel = SHEET_MATERIAL_AMOUNT * 3)
	/// Component responsible for scale behavior
	var/datum/component/weight_scale/scale_component
	/// Makes second tile of scale work
	var/obj/structure/plasteel_scale/right/partner

/obj/structure/plasteel_scale/wrench_act_secondary(mob/living/user, obj/item/tool)
	..()
	tool.play_tool_sound(src)
	deconstruct(disassembled = TRUE)
	return TRUE

/obj/structure/plasteel_scale/atom_deconstruct(disassembled)
	for(var/datum/material/mat as anything in custom_materials)
		new mat.sheet_type(loc, FLOOR(custom_materials[mat] / SHEET_MATERIAL_AMOUNT, 1))

/obj/structure/plasteel_scale/Initialize(mapload)
	. = ..()
	scale_component = AddComponent(/datum/component/weight_scale)
	///makes the right tile work
	partner = new /obj/structure/plasteel_scale/right(get_step(src, EAST))
	partner.main = src
	partner.scale_component = scale_component

/obj/structure/plasteel_scale/Destroy(force)
	if(scale_component)
		QDEL_NULL(scale_component)

	return ..()

/obj/structure/plasteel_scale/right
	name = "large scale"
	desc = "You can weigh yourself with this."
	icon = 'modular_gs/icons/obj/megascale.dmi'
	icon_state = "scale"
	anchored = TRUE
	pixel_x = -16
	pixel_y = 0

	var/obj/structure/plasteel_scale/main

/obj/structure/plasteel_scale/right/Initialize(mapload)
	. = ..()
	scale_component = AddComponent(/datum/component/weight_scale)

/obj/structure/plasteel_scale/right/Destroy(force)
	if(main)
		main.partner = null
	return ..()

/obj/structure/plasteel_scale/examine(mob/user)
	. = ..()
	. += span_notice("It's held together by a couple of <b>bolts</b>.")

/obj/structure/plasteel_scale/ui_interact(mob/user)
	scale_component.ui_interact(user)

