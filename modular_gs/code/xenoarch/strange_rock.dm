/obj/item/strangerock
	icon = 'modular_gs/code/xenoarch/fossil_and_artifact.dmi'
	name = "strange rock"
	desc = "This is a strange rock, it appears to have a relic encased."
	icon_state = "strange"
	item_state = "strange"

	var/chosenitem = null
	var/itemsafedepth = null
	var/itembasedepth = null
	var/itemactualdepth = null
	var/dugdepth = null

	var/tryagain = null

/obj/item/strangerock/Initialize()
	icon_state = pick("strange","strange0","strange1","strange2","strange3")
	var/randomnumber = rand(1,100)
	switch(randomnumber)
		if(1 to 69)
			chosenitem = pickweight(GLOB.bas_artifact)
			itembasedepth = rand(30,40)
			itemsafedepth = rand(3,6)
			itemactualdepth = rand(itembasedepth - itemsafedepth,itembasedepth)
		if(70 to 99)
			chosenitem = pickweight(GLOB.adv_artifact)
			itembasedepth = rand(40,60)
			itemsafedepth = rand(6,12)
			itemactualdepth = rand(itembasedepth - itemsafedepth,itembasedepth)
		if(100)
			chosenitem = pickweight(GLOB.ult_artifact)
			itembasedepth = rand(70,100)
			itemsafedepth = rand(12,14)
			itemactualdepth = rand(itembasedepth - itemsafedepth,itembasedepth)
	..()

/obj/item/strangerock/attackby(obj/item/W, mob/user, params)
	if(istype(W,/obj/item/xenoarch/clean/hammer))
		if(tryagain)
			to_chat(user,"You are already mining this.")
			return
		tryagain = TRUE
		var/obj/item/xenoarch/clean/hammer/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,HM.cleanspeed,target = src))
			to_chat(user,"You must stand still to clean.")
			tryagain = FALSE
			return
		dugdepth += HM.cleandepth
		playsound(loc, HM.usesound, 50, 1, -1)
		if(dugdepth > itemactualdepth)
			to_chat(user,"The strange rock crumbles, destroying anything that could have been recovered.")
			qdel(src)
			return
		tryagain = FALSE
	if(istype(W,/obj/item/xenoarch/clean/brush))
		if(tryagain)
			to_chat(user,"You are already mining this.")
			return
		tryagain = TRUE
		var/obj/item/xenoarch/clean/brush/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,HM.brushspeed,target = src))
			to_chat(user,"You must stand still to clean.")
			tryagain = FALSE
			return
		if(dugdepth < itemactualdepth)
			dugdepth++
			playsound(loc, HM.usesound, 50, 1, -1)
			to_chat(user,"You brush away 1cm of debris.")
			tryagain = FALSE
			return
		if(dugdepth > itemactualdepth)
			to_chat(user,"You somehow managed to destroy a strange rock with a brush... good job?")
			qdel(src)
			return
		if(dugdepth == itemactualdepth)
			new chosenitem(get_turf(src))
			playsound(loc, HM.usesound, 50, 1, -1)
			to_chat(user,"You uncover an artifact!")
			qdel(src)
			return
	if(istype(W,/obj/item/xenoarch/help/scanner))
		var/obj/item/xenoarch/help/scanner/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,30,target = src))
			to_chat(user,"You must stand still to scan.")
			return
		playsound(loc, HM.usesound, 50, 1, -1)
		to_chat(user,"Base Depth: [itembasedepth] centimeters.")
		to_chat(user,"Safe Depth: [itemsafedepth] centimeters.")
	if(istype(W,/obj/item/xenoarch/help/scanneradv))
		var/obj/item/xenoarch/help/scanneradv/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,10,target = src))
			to_chat(user,"You must stand still to scan.")
			return
		playsound(loc, HM.usesound, 50, 1, -1)
		to_chat(user,"Item Depth: [itemactualdepth] centimeters.")
	if(istype(W,/obj/item/xenoarch/help/measuring))
		var/obj/item/xenoarch/help/measuring/HM = W
		playsound(loc, HM.usesound, 50, 1, -1)
		if(!do_after(user,10,target = src))
			to_chat(user,"You must stand still to measure.")
			return
		if(!dugdepth)
			to_chat(user,"This rock has not been touched.")
			playsound(loc, HM.usesound, 50, 1, -1)
			return
		to_chat(user,"Current depth dug: [dugdepth] centimeters.")
		playsound(loc, HM.usesound, 50, 1, -1)
//
/turf/closed/mineral/random/volcanic/strangerock
	mineralChance = 10
	mineralSpawnChanceList = list(
		/obj/item/stack/ore/uranium = 5, /obj/item/stack/ore/diamond = 1, /obj/item/stack/ore/gold = 10, /obj/item/stack/ore/titanium = 11,
		/obj/item/stack/ore/silver = 12, /obj/item/stack/ore/plasma = 20, /obj/item/stack/ore/iron = 40,
		/turf/closed/mineral/gibtonite/volcanic = 4, /obj/item/stack/ore/bluespace_crystal = 1, /obj/item/strangerock = 30, /obj/item/stack/ore/calorite = 1,) //GS13 EDIT
