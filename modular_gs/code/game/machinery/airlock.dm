/obj/machinery/door/airlock/material/pizza
	name = "pizza Airlock"

/obj/machinery/door/airlock/material/pizza/Initialize(mapload)
	. = ..()
	var/list/materials = list(/datum/material/pizza = 400)
	set_custom_materials(materials)
	update_appearance()
