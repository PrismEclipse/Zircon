	object_const_def
	const HAUNTED_HOUSE_2F_KURSTRAW

SoulHouse_MapScripts:
	def_scene_scripts
	
	def_callbacks
	
KurstrawScript:
	opentext
	writetext KurstrawText
	cry KURSTRAW
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon KURSTRAW, 15
	startbattle
	disappear HAUNTED_HOUSE_2F_KURSTRAW
	setevent EVENT_HAUNTED_HOUSE_KURSTRAW
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_MEWTWO
.nocatch
	end

KurstrawText:
	text "…!"
	done	


SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 11, VIRIDIAN_FOREST, 4
	warp_event  7, 11, VIRIDIAN_FOREST, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  3, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurstrawScript, -1
