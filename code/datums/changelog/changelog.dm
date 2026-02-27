/datum/changelog
	var/static/list/changelog_items = list()

/datum/changelog/ui_state()
	return GLOB.always_state

/datum/changelog/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "BubberChangelog") // BUBBER EDIT CHANGE: Changelog 2: Original: ui = new(user, src, "Changelog")
		ui.open()

/datum/changelog/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	if(action == "get_month")
		var/datum/asset/changelog_item/changelog_item = changelog_items[params["date"]]
		if (!changelog_item)
			changelog_item = new /datum/asset/changelog_item(params["date"])
			changelog_items[params["date"]] = changelog_item
		return ui.send_asset(changelog_item)

// BUBBER EDIT CHANGE BEGIN: Changelog 2
/datum/changelog/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/simple/server_logos)
	)
// BUBBER EDIT CHANGE END: Changelog 2

/datum/changelog/ui_static_data()
	var/list/data = list( "dates" = list() )
	var/regex/ymlRegex = regex(@"\.yml", "g")
	// BUBBER EDIT ADDITION BEGIN: Changelog 2
	var/list/tg_files = flist("html/changelogs/archive/")
	var/list/bubber_files = flist("html/changelogs/bubber_archive/")
	// BUBBER EDIT ADDITION END: Changelog 2
	// GS13 EDIT: Changelogs (3?)
	var/list/gs13_files = flist("html/changelogs/gs13_archive/")
	var/list/files_list = tg_files
	files_list |= gs13_files
	files_list |= bubber_files

	for(var/archive_file in sort_list(files_list)) // BUBBER EDIT CHANGE: Changelog 2: Original: for(var/archive_file in sort_list(flist("html/changelogs/archive/"))) // GS13 EDIT, original: for(var/archive_file in sort_list(tg_files |= bubber_files))
	// GS13 END EDIT
		var/archive_date = ymlRegex.Replace(archive_file, "")
		data["dates"] = list(archive_date) + data["dates"]

	return data
