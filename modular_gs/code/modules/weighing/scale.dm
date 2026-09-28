/obj/structure/scale
	name = "weighing scale"
	desc = "You can weigh yourself with this."
	icon = 'modular_gs/icons/obj/scale.dmi'
	icon_state = "scale"
	anchored = TRUE
	resistance_flags = NONE
	max_integrity = 250
	integrity_failure = 25
	layer = OBJ_LAYER
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3)
	/// Component responsible for scale behavior
	var/datum/component/weight_scale/scale_component

/obj/structure/scale/wrench_act_secondary(mob/living/user, obj/item/tool)
	..()
	tool.play_tool_sound(src)
	deconstruct(disassembled = TRUE)
	return TRUE

/obj/structure/scale/atom_deconstruct(disassembled)
	for(var/datum/material/mat as anything in custom_materials)
		new mat.sheet_type(loc, FLOOR(custom_materials[mat] / SHEET_MATERIAL_AMOUNT, 1))

/obj/structure/scale/Initialize(mapload)
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(scale_break_check),
		COMSIG_ATOM_EXITED = PROC_REF(on_scale_leave),
	)
	scale_component = AddComponent(/datum/component/weight_scale)
	AddComponent(/datum/component/connect_loc_behalf, src, loc_connections)

/obj/structure/scale/Destroy(force)
	if(scale_component)
		QDEL_NULL(scale_component)

	return ..()

/obj/structure/scale/examine(mob/user)
	. = ..()
	. += span_notice("It's held together by a couple of <b>bolts</b>.")

/obj/structure/scale/ui_interact(mob/user)
	scale_component.ui_interact(user)

/obj/structure/scale/proc/scale_break_check(datum/source, mob/living/carbon/fatty)
	SIGNAL_HANDLER

	var/scale_breakage = 1000

	if (fatty.calculate_weight_in_pounds() > scale_breakage)
		playsound(loc, 'sound/effects/heavy_drop2.ogg', 50, 1)
		fatty.visible_message(
		span_notice("The scale shatters under the shear weight of [fatty]!"),
		span_notice("As you step on the [src], it shatters, unable to hold your fatass!")
		)
		deconstruct()

	RegisterSignal(fatty, COMSIG_FATNESS_CHANGED, PROC_REF(standing_weight_changed))

/obj/structure/scale/proc/on_scale_leave(datum/source, mob/living/carbon/fatty)
	SIGNAL_HANDLER
	if (!isnull(fatty))
		UnregisterSignal(fatty, COMSIG_FATNESS_CHANGED)

/obj/structure/scale/proc/standing_weight_changed(mob/living/carbon/fatty, fatness)
	SIGNAL_HANDLER

	var/scale_breakage = 1000

	if (fatty.calculate_weight_in_pounds() > scale_breakage)
		playsound(loc, 'sound/effects/heavy_drop2.ogg', 50, 1)
		fatty.visible_message(
		span_notice("The scale shatters under the shear weight of [fatty]!"),
		span_notice("You've grown to heavy for the scale, it breaks under your weight!")
		)
		deconstruct()
