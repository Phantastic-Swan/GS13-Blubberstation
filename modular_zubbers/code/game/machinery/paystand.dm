/obj/machinery/paystand
	name = "Paystand"
	desc = "A large, stationary payment terminal, sending money to the linked ID card."
	icon = 'icons/obj/economy.dmi'
	icon_state = "card_scanner"
	/// ID linked to the holopay
	var/obj/item/card/id/linked_card
	/// The holopay shop icon displayed in the UI
	var/shop_logo = "donate"
	/// Replaces the "pay whatever" functionality with a set amount when non-zero.
	var/force_fee = 0

/obj/machinery/paystand/examine(mob/user)
	. = ..()
	if(force_fee)
		. += span_boldnotice("This holopay forces a payment of <b>[force_fee]</b> [MONEY_NAME_AUTOPURAL(force_fee)] per swipe instead of a variable amount.")

/obj/machinery/paystand/Initialize(mapload)
	. = ..()
	register_context()

/obj/machinery/paystand/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()

	if(isidcard(held_item))
		context[SCREENTIP_CONTEXT_LMB] = "Pay"
		return CONTEXTUAL_SCREENTIP_SET

	else if(istype(held_item, /obj/item/holochip))
		context[SCREENTIP_CONTEXT_LMB] = "Pay"
		return CONTEXTUAL_SCREENTIP_SET

/obj/machinery/paystand/attack_hand(mob/living/user, list/modifiers)
	var/mob/living/user = item_holder
	if(!isliving(user))
		return ..()
	/// Users can pay with an ID to skip the UI
	if(isidcard(held_item))
		if(force_fee && tgui_alert(item_holder, "This holopay has a [force_fee] [MONEY_SYMBOL] fee. Confirm?", "Holopay Fee", list("Pay", "Cancel")) != "Pay")
			return TRUE
		process_payment(user)
		return TRUE
	/// Users can also pay by holochip
	if(istype(held_item, /obj/item/holochip))
		/// Account checks
		var/obj/item/holochip/chip = held_item
		if(!chip.credits)
			balloon_alert(user, "holochip is empty")
			to_chat(user, span_warning("There doesn't seem to be any [MONEY_NAME] here."))
			return FALSE
		/// Charges force fee or uses pay what you want
		var/cash_deposit = force_fee || tgui_input_number(user, "How much? (Max: [chip.credits])", "Patronage", max_value = chip.credits)
		/// Exit sanity checks
		if(!cash_deposit)
			return TRUE
		if(QDELETED(held_item) || QDELETED(user) || QDELETED(src) || !user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
			return FALSE
		if(!chip.spend(cash_deposit, FALSE))
			balloon_alert(user, "insufficient [MONEY_NAME]")
			to_chat(user, span_warning("You don't have enough [MONEY_NAME] to pay with this chip."))
			return FALSE
		/// Success: Alert buyer
		alert_buyer(user, cash_deposit)
		return TRUE
	return ..()

/obj/machinery/paystand/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	if(.)
		return FALSE
	var/mob/living/interactor = user
	if(isliving(interactor) && interactor.combat_mode)
		return FALSE
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HoloPay")
		ui.open()

/obj/machinery/paystand/ui_status(mob/user, datum/ui_state/state)
	. = ..()
	if(!in_range(user, src) && !isobserver(user))
		return UI_CLOSE

/obj/machinery/paystand/ui_static_data(mob/user)
	. = list()
	.["available_logos"] = linked_card.available_logos
	.["description"] = desc
	.["max_fee"] = linked_card.holopay_max_fee
	.["owner"] = linked_card.registered_account?.account_holder || null
	.["shop_logo"] = shop_logo

/obj/machinery/paystand/ui_data(mob/user)
	. = list()
	.["force_fee"] = force_fee
	.["name"] = name
	if(!isliving(user))
		return .
	var/mob/living/card_holder = user
	var/obj/item/card/id/id_card = card_holder.get_idcard(TRUE)
	var/datum/bank_account/account = id_card?.registered_account || null
	if(account)
		.["user"] = list()
		.["user"]["name"] = account.account_holder
		.["user"]["balance"] = account.account_balance

/obj/machinery/paystand/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return FALSE
	switch(action)
		if("done")
			ui.send_full_update()
			return TRUE
		if("fee")
			linked_card.set_holopay_fee(params["amount"])
			force_fee = linked_card.holopay_fee
		if("logo")
			linked_card.set_holopay_logo(params["logo"])
			shop_logo = linked_card.holopay_logo
		if("pay")
			ui.close()
			process_payment(usr)
			return TRUE
		if("rename")
			linked_card.set_holopay_name(params["name"])
			name = linked_card.holopay_name
	return FALSE
