/obj/item/seeds/watermelon/milkmelon
	name = "milkmelon seed pack"
	desc = "These seeds grow into milkmelon plants."
	icon_state = "seed-milkmelon"
	species = "milkmelon"
	plantname = "milk Melon Vines"
	product = /obj/item/food/grown/milkmelon
	mutatelist = null
	reagents_add = list(/datum/reagent/consumable/milk = 0.2)
	rarity = PLANT_MODERATELY_RARE
	icon = 'modular_gs/icons/obj/hydroponics/seeds.dmi'
	icon_state = "seed-milkmelon"
	growing_icon = 'modular_gs/icons/obj/hydroponics/growing.dmi'
	icon_dead = null

/obj/item/food/grown/milkmelon
	seed = /obj/item/seeds/watermelon/milkmelon
	name = "milkmelon"
	desc = "Those are some BIG honkers. A real set of badonkers."
	icon = 'modular_gs/icons/obj/hydroponics/harvest.dmi'
	icon_state = "milkmelon"
	inhand_icon_state = "watermelon"
	wine_power = null
	wine_flavor = 10
	bite_consumption_mod = 2
	w_class = WEIGHT_CLASS_NORMAL
	foodtypes = FRUIT

/obj/item/food/grown/milkmelon/juice_typepath()
	return /datum/reagent/consumable/milk

/obj/item/food/grown/milkmelon/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/milkmelonslice, 5, 20, screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/grown/milkmelon/make_dryable()
	return

/obj/item/food/milkmelonslice
	name = "milkmelon slice"
	desc = "A slice of milky goodness."
	icon = 'modular_gs/icons/obj/hydroponics/harvest.dmi'
	icon_state = "milkmelon_slice"
	food_reagents = list(
		/datum/reagent/consumable/milk = 2,
	)
	tastes = list("milkmelon" = 1)
	foodtypes = FRUIT
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/milkmelonslice/juice_typepath()
	return /datum/reagent/consumable/milk

/datum/crafting_recipe/food/knife/milkmelonslice
	reqs = list(/obj/item/food/grown/milkmelon = 1)
	result = /obj/item/food/milkmelonslice
	category = CAT_SALAD
