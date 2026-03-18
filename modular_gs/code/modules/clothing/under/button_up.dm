/obj/item/clothing/under/color/dual_tone/button_up
	name = "Button up"
	modular_icon_location = 'modular_gs/icons/mob/modclothes/button_up.dmi'

/obj/item/clothing/under/color/dual_tone/button_up/add_modular_overlay(mob/living/carbon/U, modular_icon, modular_layer, sprite_color)
	var/list/suit_colors = SSgreyscale.ParseColorString(greyscale_colors)
	var/mutable_appearance/mod_overlay = mutable_appearance(modular_icon_location, modular_icon, -(modular_layer))
	mod_overlays += mod_overlay
	U.overlays_standing[modular_layer] =  mod_overlay
	U.apply_overlay(modular_layer)
	for (var/i = 1, i < 3, i++)
		mod_overlay = mutable_appearance(modular_icon_location, (modular_icon + "-" + num2text(i)), -(modular_layer))
		mod_overlay.color = suit_colors[i]
		mod_overlays += mod_overlay
		U.overlays_standing[modular_layer] =  mod_overlay
		U.apply_overlay(modular_layer)

	// /obj/item/organ/genital/breasts = U.
	var/obj/item/organ/genital/organ
	for (organ in U.organs)
		if(istype(organ, /obj/item/organ/genital/breasts))
			var/obj/item/organ/genital/breasts/breasts = organ
			var/color = breasts.bodypart_overlay.draw_color

			mod_overlay = mutable_appearance(modular_icon_location, (modular_icon + "-4"), -(modular_layer))
			mod_overlay.color = color
			mod_overlays += mod_overlay
			U.overlays_standing[modular_layer] =  mod_overlay
			U.apply_overlay(modular_layer)
