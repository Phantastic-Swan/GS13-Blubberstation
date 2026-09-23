Bit of a design doc so I remember what I should do

# JSON config

The thing that stores information about the modular icons. DM typepaths to it should follow `/datum/greyscale_config/modular/GENITAL/object_type`, where `/datum/greyscale_config/modular` and `/datum/greyscale_config/modular/GENITAL` should be abstract types.

The JSON configs themselves should contain:
 - name for the icon states (eg. belly_soft)
 - the max number of sizes for the given genital
 - then as per usual, the number of color layers and colors they use

# rust_g

Actual handling of generating the sprites. We mainly need to modify how it parses JSONs to accept the modified ones above. Because our icons are actually placed almost identically to the ones used normally by iconforge, this means our main task is to make sure rust_g knows which icon states to take and where to place them.

Given our custom json config, it has to check the name of the genital, then loop through sizes from 0 to max, and then loop again for directions (none(sides), north, south) and que the sprites generation.

The generated files gets put into the cache as normal.

# DM

Ideally, all uniforms would use the same `icon_state` for their genital parts, so belly is always "belly", breasts are always "breasts" and so on and so forth. Maybe some variation for "belly_soft" or "belly_round".

Upon needing a modular sprite, it has to check if a file for the given colors exists in the cache, if yes take it, if not ask rust_g to generate it.
