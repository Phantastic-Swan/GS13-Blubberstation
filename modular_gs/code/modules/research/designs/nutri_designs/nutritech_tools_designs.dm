/datum/design/bluespace_belt
	name = "Bluespace Belt"
	desc = "A belt made using bluespace technology. The power of space and time, used to hide the fact you are fat."
	id = "bluespace_belt"
	build_type = PROTOLATHE
	construction_time = 100
	materials = list(/datum/material/silver = SHEET_MATERIAL_AMOUNT * 2 / 10, /datum/material/gold = SHEET_MATERIAL_AMOUNT * 2 / 10, /datum/material/bluespace = SHEET_MATERIAL_AMOUNT / 10, )
	build_path = /obj/item/bluespace_belt
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/primitive_bluespace_belt
	name = "Primitive Bluespace Belt"
	desc = "A primitive belt made using bluespace technology. The power of space and time, used to hide the fact you are fat. This one requires cells to continue operating, and may suffer from random failures."
	id = "primitive_bluespace_belt"
	build_type = PROTOLATHE
	construction_time = 100
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2 / 10, /datum/material/silver = SHEET_MATERIAL_AMOUNT / 10, )
	build_path = /obj/item/bluespace_belt/primitive/empty
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE
