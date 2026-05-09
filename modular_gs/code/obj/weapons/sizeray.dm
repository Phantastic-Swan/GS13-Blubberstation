#define CALORAY_DEFAULT_INTENSITY 50
#define MODE_GROW "grow"
#define MODE_SHRINK "shrink"

/obj/item/gun/medbeam/caloray/sizeray
	name = "Sizeray"
	desc = "A specialized beam which allows the user to increase or decrease the size of their target."
	icon = 'modular_gs/icons/obj/weapons/caloray.dmi'
	icon_state = "caloray"

	mode = MODE_GROW
	beam_color = "#c70000"

/obj/item/gun/medbeam/caloray/sizeray/empty_cell/Initialize(mapload)
	. = ..()
	cell = new /obj/item/stock_parts/power_store/cell/high/empty
	update_appearance()

/obj/item/gun/medbeam/caloray/sizeray/charged/Initialize(mapload)
	. = ..()
	cell = new /obj/item/stock_parts/power_store/cell/high
	update_appearance()

/obj/item/gun/medbeam/caloray/sizeray/infinite_cell
	name = "infinite capacity sizeray"

/obj/item/gun/medbeam/caloray/sizeray/infinite_cell/Initialize(mapload)
	. = ..()
	cell = new /obj/item/stock_parts/power_store/cell/infinite
	update_appearance()

/obj/item/gun/medbeam/caloray/sizeray/bluespace_cell
	name = "bluespace cell sizeray"

/obj/item/gun/medbeam/caloray/sizeray/bluespace_cell/Initialize(mapload)
	. = ..()
	cell = new /obj/item/stock_parts/power_store/cell/bluespace
	update_appearance()

/obj/item/gun/medbeam/caloray/sizeray/update_overlays()
	. = ..()
	if(mode == MODE_GROW)
		. += "caloray_fatten"

	if(mode == MODE_SHRINK)
		. += "caloray_thin"

/obj/item/gun/medbeam/caloray/attack_self(mob/user)
	if(opened == FALSE)
		playsound(user, 'sound/items/weapons/gun/general/slide_lock_1.ogg', 60, 1)
		if (mode == MODE_GROW)
			to_chat(user, span_notice("You change the setting on the beam to shrink."))
			beam_color = "#0ce7d8"
			beam_icon_state = "white_beam"
			mode = MODE_SHRINK
		else
			to_chat(user, span_notice("You change the setting on the beam to grow."))
			beam_color = "#c70000"
			beam_icon_state = "white_beam_reverse"
			mode = MODE_GROW

	if(opened == TRUE && cell)
		user.visible_message("[user] removes [cell] from [src]!", span_notice("You remove [cell]."))
		cell.update_icon()
		user.put_in_hands(cell)
		cell = null
		// playsound(user, 'sound/items/weapons/gun/general/ionpulse.ogg', 60, 1)

	else if(opened == TRUE && isnull(cell))
		user.visible_message(span_warning("The Caloray doesn't have a power cell installed."))

	update_appearance()
	LoseTarget()

/obj/item/gun/medbeam/caloray/attackby(obj/item/item, mob/user)
	..()
	if(mode == MODE_GROW)
		beam_color = "#c70000"
		beam_icon_state = "white_beam_reverse"
	if(mode == MODE_SHRINK)
		beam_color = "#0ce7d8"
		beam_icon_state = "white_beam"

	update_appearance()

/obj/item/gun/medbeam/caloray/sizeray/on_beam_tick(mob/living/carbon/target)
	if(mode == MODE_GROW)
		if(cell.charge() > 0 && target.current_size < 2)
			cell.use(power_use * intensity, TRUE)
			// target.adjust_fatness(energy_used / 250, FATTENING_TYPE_ITEM)
			target.update_transform(1.1)
		else
			LoseTarget()
			return

	if(mode == MODE_SHRINK)
		if(cell.charge() < cell.max_charge() && target.current_size > 0.2)
			target.update_transform(1 / 1.1)
			// var/BFI_burned = min(target.fatness_real, intensity)
			// target.adjust_fatness(-BFI_burned, FATTENING_TYPE_ITEM)
			cell.use(power_use * intensity, TRUE)
		else
			LoseTarget()
			return
	update_appearance()

/obj/effect/ebeam/caloray
	name = "caloray beam"

/obj/item/gun/medbeam/caloray/mid_los_check(atom/movable/user, mob/target, pass_args, turf/next_step, obj/dummy)
	return TRUE

//////////////////////////////Mech Version///////////////////////////////
/obj/item/gun/medbeam/caloray/mech
	mounted = TRUE

/obj/item/gun/medbeam/caloray/mech/Initialize(mapload)
	. = ..()
	STOP_PROCESSING(SSobj, src) //Mech mediguns do not process until installed, and are controlled by the holder obj

#undef CALORAY_DEFAULT_INTENSITY
