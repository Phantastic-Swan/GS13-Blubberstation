/// mechanics related to this are in [modular_gs/code/mechanics/water_sponge.dm]
/datum/quirk/water_sponge
	name = "Water Sponge"
	desc = "You can hold lots of water in you! Careful with showers!"
	icon = "fa-water"
	value = 0 //ERP quirk
	gain_text = "<span class='notice'>You feel absorbant.</span>"
	lose_text = "<span class='notice'>You don't feel absorbant anymore.</span>"
	medical_record_text = "Patient's seems to absorb water extremely efficiently."
	mob_trait = TRAIT_WATER_SPONGE
