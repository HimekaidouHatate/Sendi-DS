PrefabFiles = {
	"sendi",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/sendi.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/sendi.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/sendi.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/sendi.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/sendi_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/sendi_silho.xml" ),

    Asset( "IMAGE", "bigportraits/sendi.tex" ),
    Asset( "ATLAS", "bigportraits/sendi.xml" ),
	
	Asset( "IMAGE", "images/map_icons/sendi.tex" ),
	Asset( "ATLAS", "images/map_icons/sendi.xml" ),

}

local require = GLOBAL.require

-- The character select screen lines
GLOBAL.STRINGS.CHARACTER_TITLES.sendi = "The Sample Character"
GLOBAL.STRINGS.CHARACTER_NAMES.sendi = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.sendi = "*Perk 1\n*Perk 2\n*Perk 3"
GLOBAL.STRINGS.CHARACTER_QUOTES.sendi = "\"Quote\""

-- Custom speech strings
GLOBAL.STRINGS.CHARACTERS.sendi = require "speech_sendi"

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "sendi")


AddMinimapAtlas("images/map_icons/sendi.xml")
AddModCharacter("sendi")

