ContestMonsChallenge:
	;   %, species,   min, max

	map_id NATIONAL_PARK_BUG_CONTEST
; NationalPark
	table_width 4
; morning
	db 20, CATERPIE,    9, 20
	db 20, WEEDLE,      9, 20
	db 10, METAPOD,    11, 20
	db 10, KAKUNA,     11, 20
	db  5, BUTTERFREE, 14, 17
	db  5, BEEDRILL,   14, 17
	db 10, VENONAT,    12, 18
	db 10, PARAS,      12, 19
	db  5, SCYTHER,    15, 16
	db  5, PINSIR,     15, 16
; day/eve
	db 20, CATERPIE,    9, 20
	db 20, WEEDLE,      9, 20
	db 10, METAPOD,    11, 20
	db 10, KAKUNA,     11, 20
	db  5, BUTTERFREE, 14, 17
	db  5, BEEDRILL,   14, 17
	db 10, VENONAT,    12, 18
	db 10, PARAS,      12, 19
	db  5, SCYTHER,    15, 16
	db  5, PINSIR,     15, 16
; nite
	db 20, CATERPIE,    9, 20
	db 20, WEEDLE,      9, 20
	db 10, METAPOD,    11, 20
	db 10, KAKUNA,     11, 20
	db  5, BUTTERFREE, 14, 17
	db  5, BEEDRILL,   14, 17
	db 10, VENONAT,    12, 18
	db 10, PARAS,      12, 19
	db  5, SCYTHER,    15, 16
	db  5, PINSIR,     15, 16
	assert_table_length 30

	db -1 ; terminator
	