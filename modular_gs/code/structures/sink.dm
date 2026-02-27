// chugging water (or whatever else is there) from the sink
/obj/structure/sink
	var/mob/living/attached

/obj/structure/sink/mouse_drop_receive(atom/dropped, mob/user, params)
	if (!iscarbon(dropped))
		return
	
	if (attached)
		visible_message("<span class='warning'>[attached] is detached from [src].</span>")
		attached = null
		return
	
	usr.visible_message("<span class='warning'>[usr] attaches [dropped] to [src].</span>", "<span class='notice'>You attach [dropped] to [src].</span>")
	add_fingerprint(usr)
	attached = dropped
	START_PROCESSING(SSobj, src)

/obj/structure/sink/process()
	. = ..()
	if(isnull(attached))
		return .
	if(!(get_dist(src, attached) <= 1 && isturf(attached.loc)))
		visible_message(span_notice("[attached] is ripped from the sink!"))
		attached = null
		return .
	if(attached)
		playsound(attached, 'modular_zubbers/sound/vore/sunesound/pred/swallow_02.ogg', rand(10,50), 1)
		reagents.trans_to(attached, 5)
		return null
	else
		return .

/obj/structure/sink/attack_hand(mob/living/user)
	. = ..()
	if(attached)
		visible_message("[attached] is detached from [src]")
		attached = null
		return
