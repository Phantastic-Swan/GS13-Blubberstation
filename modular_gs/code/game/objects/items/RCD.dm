GLOBAL_LIST_INIT(pizza_rcd_designs, list(
	//1ST ROOT CATEGORY
	"Construction" = list( //Stuff you use to make & decorate areas
		//Walls & Windows
		"Structures" = list(
			list(RCD_DESIGN_MODE = RCD_TURF, RCD_DESIGN_PATH = /turf/open/floor/plating/rcd),
			list(RCD_DESIGN_MODE = RCD_WINDOWGRILLE, RCD_DESIGN_PATH = /obj/structure/window),
			list(RCD_DESIGN_MODE = RCD_WINDOWGRILLE, RCD_DESIGN_PATH = /obj/structure/window/reinforced),
			list(RCD_DESIGN_MODE = RCD_WINDOWGRILLE, RCD_DESIGN_PATH = /obj/structure/window/fulltile),
			list(RCD_DESIGN_MODE = RCD_WINDOWGRILLE, RCD_DESIGN_PATH = /obj/structure/window/reinforced/fulltile),
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/reflector/wrenched),
			list(RCD_DESIGN_MODE = RCD_TURF, RCD_DESIGN_PATH = /obj/structure/lattice/catwalk),
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/girder),
		),

		//Interior Design[construction_mode = RCD_FURNISHING is implied]
		"Furniture" = list(
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/chair),
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/chair/stool),
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/chair/stool/bar),
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/table),
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/table/glass),
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/rack),
			list(RCD_DESIGN_MODE = RCD_STRUCTURE, RCD_DESIGN_PATH = /obj/structure/bed),
		),
	),

	//2ND ROOT CATEGORY[construction_mode = RCD_AIRLOCK is implied,"icon=closed"]
	"Airlocks" = list( //used to seal/close areas
		//Glass Airlocks[airlock_glass = TRUE is implied,do fill_closed overlay]
		"Glass Airlocks" = list(
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/public/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/engineering/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/atmos/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/security/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/command/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/medical/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/research/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/hydroponics/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/virology/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/mining/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/maintenance/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/external/glass),
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/maintenance/external/glass),
		),

		//Solid Airlocks[airlock_glass = FALSE is implied,no fill_closed overlay]
		"Solid Airlocks" = list(
			list(RCD_DESIGN_MODE = RCD_AIRLOCK, RCD_DESIGN_PATH = /obj/machinery/door/airlock/material/pizza),
		),
	),

	//3RD CATEGORY Airlock access,empty list cause airlock_electronics UI will be displayed  when this tab is selected
	"Airlock Access" = list()
))

/obj/item/construction/rcd/pizza
	name = "rapid-pizza-delivery-device (RPDD)"
	desc = "A device used to rapidly deploy and undeploy pizza. The latter function rarely seems to come into play however, especially in these parts of space..."
	req_access = list()
	construction_upgrades = RCD_ALL_UPGRADES & ~RCD_UPGRADE_SILO_LINK & ~RCD_UPGRADE_FRAMES
	max_matter = 160
	matter = 160

/obj/item/construction/rcd/pizza/ui_static_data(mob/user)
	var/list/data = ..()

	var/list/electronics_data = airlock_electronics.ui_static_data(user)
	for(var/key in electronics_data)
		data[key] = electronics_data[key]

	data["root_categories"] = list()
	for(var/category in GLOB.pizza_rcd_designs)
		data["root_categories"] += category
	data["selected_root"] = root_category

	data["categories"] = list()
	for(var/sub_category in GLOB.pizza_rcd_designs[root_category])
		var/list/target_category =  GLOB.pizza_rcd_designs[root_category][sub_category]
		if(!length(target_category))
			continue

		//skip category if upgrades were not installed for these
		if(sub_category == "Furniture" && !(construction_upgrades & RCD_UPGRADE_FURNISHING))
			continue

		var/list/designs = list() //initialize all designs under this category
		for(var/list/design as anything in target_category)
			var/atom/movable/design_path = design[RCD_DESIGN_PATH]

			var/design_name = initial(design_path.name)

			designs += list(list("title" = design_name, "icon" = sanitize_css_class_name(design_name)))
		data["categories"] += list(list("cat_name" = sub_category, "designs" = designs))

	return data
