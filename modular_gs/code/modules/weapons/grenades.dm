//GS13 - fattening grenade presets

/obj/item/grenade/chem_grenade/lipoifier
	name = "lipoifier grenade"
	desc = "For slowing down your enemies while you make your getaway. That is you don't get caught up in the cloud."
	stage = GRENADE_READY

//lipoifier grenade
/obj/item/grenade/chem_grenade/lipoifier/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/beaker_one = new(src)
	var/obj/item/reagent_containers/cup/beaker/beaker_two = new(src)

	beaker_one.reagents.add_reagent(/datum/reagent/consumable/lipoifier, 30)
	beaker_one.reagents.add_reagent(/datum/reagent/potassium, 20)
	beaker_two.reagents.add_reagent(/datum/reagent/phosphorus, 20)
	beaker_two.reagents.add_reagent(/datum/reagent/consumable/sugar, 20)

	beakers += beaker_one
	beakers += beaker_two

//galbanic grenade
/obj/item/grenade/chem_grenade/galbanic
	name = "galbanic grenade"
	desc = "For slowing down your enemies while you make your getaway. That is you don't get caught up in the cloud."
	stage = GRENADE_READY

/obj/item/grenade/chem_grenade/galbanic/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/beaker_one = new(src)
	var/obj/item/reagent_containers/cup/beaker/beaker_two = new(src)

	beaker_one.reagents.add_reagent(/datum/reagent/fermi_fat, 30)
	beaker_one.reagents.add_reagent(/datum/reagent/potassium, 20)
	beaker_two.reagents.add_reagent(/datum/reagent/phosphorus, 20)
	beaker_two.reagents.add_reagent(/datum/reagent/consumable/sugar, 20)

	beakers += beaker_one
	beakers += beaker_two


//grenade with mixed fatty chems
/obj/item/grenade/chem_grenade/fatmix
	name = "the fattonator grenade"
	desc = "Smaller smoke size, but more intense effects."
	stage = GRENADE_READY

/obj/item/grenade/chem_grenade/fatmix/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/beaker/beaker_one = new(src)
	var/obj/item/reagent_containers/cup/beaker/beaker_two = new(src)

	beaker_one.reagents.add_reagent(/datum/reagent/consumable/lipoifier, 10)
	beaker_one.reagents.add_reagent(/datum/reagent/fermi_fat, 25)
	beaker_one.reagents.add_reagent(/datum/reagent/potassium, 15)
	beaker_two.reagents.add_reagent(/datum/reagent/phosphorus, 15)
	beaker_two.reagents.add_reagent(/datum/reagent/micro_calorite, 20)
	beaker_two.reagents.add_reagent(/datum/reagent/consumable/sugar, 15)

	beakers += beaker_one
	beakers += beaker_two
