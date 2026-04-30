	object_const_def
	const ROUTE_31_YOUNGSTER
	const ROUTE_31_BUG_CATCHER
	const ROUTE_31_POKE_BALL1
	const ROUTE_31_POKE_BALL2

Route31_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route31CheckMomCallCallback

Route31CheckMomCallCallback:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse .DoMomCall
	endcallback

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	endcallback

TrainerBugCatcherWade1:
	trainer BUG_CATCHER, WADE1, EVENT_BEAT_BUG_CATCHER_WADE, BugCatcherWade1SeenText, BugCatcherWade1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_WADE
	opentext
	checkflag ENGINE_WADE_HAS_BERRY
	iftrue .TryBerry
	checkflag ENGINE_WADE_READY_FOR_REMATCH
	iftrue .WadeRematch
	checkcellnum PHONE_BUG_CATCHER_WADE
	iftrue .WadeDefeated
	checkevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext BugCatcherWade1AfterText
	promptbutton
	setevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumberSTD
	sjump .Continue

.AskAgain:
	scall .AskAgainSTD
.Continue:
	askforphonenumber PHONE_BUG_CATCHER_WADE
	ifequal PHONE_CONTACTS_FULL, .PhoneFullSTD
	ifequal PHONE_CONTACT_REFUSED, .DeclinedNumberSTD
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	scall .RegisterNumberSTD
	sjump .AcceptedNumberSTD

.WadeRematch:
	scall .RematchSTD
	winlosstext BugCatcherWade1BeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .LoadFight1
	loadtrainer BUG_CATCHER, WADE1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, WADE2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	sjump .AfterRemtach

.LoadFight2:
	loadtrainer BUG_CATCHER, WADE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	sjump .AfterRemtach

.LoadFight3:
	loadtrainer BUG_CATCHER, WADE4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	sjump .AfterRemtach

.LoadFight4:
	loadtrainer BUG_CATCHER, WADE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	sjump .AfterRemtach

.AfterRemtach
	opentext
	checkflag ENGINE_WADE_GAVE_BERRY
	iftrue .Done
.TryBerry:
	scall .ItemSTD
	random 4
	ifequal 0, .oranberry
	ifequal 1, .pechaberry
	ifequal 2, .cheriberry
	ifequal 3, .persimberry

.oranberry:
	setflag ENGINE_WADE_HAS_BERRY
	verbosegiveitem ORAN_BERRY
	iffalse .PackFull
	sjump .Done

.pechaberry:
	setflag ENGINE_WADE_HAS_BERRY
	verbosegiveitem PECHA_BERRY
	iffalse .PackFull
	sjump .Done

.cheriberry:
	setflag ENGINE_WADE_HAS_BERRY
	verbosegiveitem CHERI_BERRY
	iffalse .PackFull
	sjump .Done

.persimberry:
	setflag ENGINE_WADE_HAS_BERRY
	verbosegiveitem PERSIM_BERRY
	iffalse .PackFull

.Done:
	clearflag ENGINE_WADE_HAS_BERRY
	setflag ENGINE_WADE_GAVE_BERRY
	sjump .AcceptedNumberSTD

.PackFull:
	sjump .PackFullSTD

.AskPhoneNumberSTD:
	jumpstd AskNumber1MScript
	end

.AskAgainSTD:
	jumpstd AskNumber2MScript
	end

.RegisterNumberSTD:
	jumpstd RegisteredNumberMScript
	end

.AcceptedNumberSTD:
	jumpstd NumberAcceptedMScript
	end

.DeclinedNumberSTD:
	jumpstd NumberDeclinedMScript
	end

.PhoneFullSTD:
	jumpstd PhoneFullMScript
	end

.RematchSTD:
	jumpstd RematchMScript
	end

.ItemSTD:
	jumpstd GiftMScript
	end

.PackFullSTD:
	jumpstd PackFullMScript
	end

.WadeDefeated:
	writetext BugCatcherWade1AfterText
	promptbutton
	closetext
	end


Route31YoungsterScript:
	jumptextfaceplayer Route31YoungsterText

Route31Sign:
	jumptext Route31SignText

DarkCaveSign:
	jumptext DarkCaveSignText

Route31NoRoomInBag:
	writetext Route29NoRoomInBagText
	waitbutton
	closetext
	end

Route31Potion:
	itemball POTION

Route31PokeBall:
	itemball POKE_BALL

BugCatcherWade1SeenText:
	text "You gonna take"
	line "on the gym? Lets"
	cont "see if your ready!"
	done

BugCatcherWade1BeatenText:
	text "Dang, your"
	line "pretty good!"
	done

BugCatcherWade1AfterText:
	text "Seems if your"
	line "ready for the"
	cont "gym here!"
	done


Route31YoungsterText:
	text "I found a good"
	line "#MON in VERDANT"
	cont "FOREST."

	para "I'm going to use"
	line "it to take on"
	cont "OHPAELIA."
	
	para "She's the leader"
	line "of CHERIS CITY's"
	cont "GYM"
	done

Route31SignText:
	text "ROUTE 3"

	para "CHERIS CITY -"
	line "OUTSKIRTS"
	done

DarkCaveSignText:
	text "CHERIS GYM"
	done

Route31FoundItemText:
	text_far _FoundItemText
	text_end

Route31NoRoomInBagText:
	text_far _CantCarryItemText
	text_end

Route31_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 25, VIOLET_CITY, 3
	warp_event 10, 25, VIOLET_CITY, 4
	warp_event 10,  3, VIOLET_GYM, 1

	def_coord_events

	def_bg_events
	bg_event 11,  6, BGEVENT_READ, Route31Sign
	bg_event 23, 19, BGEVENT_READ, DarkCaveSign
	def_object_events
	object_event 13,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31YoungsterScript, -1
	object_event 13, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherWade1, -1
	object_event  5, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31Potion, EVENT_ROUTE_31_POTION
	object_event 15, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31PokeBall, EVENT_ROUTE_31_POKE_BALL
