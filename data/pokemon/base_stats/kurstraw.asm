	db KURSTRAW ; 240

	db  30, 120,  60,  60, 120, 60

	db GHOST, DARK ; type
	db 90 ; catch rate
	db 98 ; base exp
	db NO_ITEM, SPELL_TAG ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/kurstraw/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HIDDEN_POWER
	; end
