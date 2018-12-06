PrefabFiles = {
	"sendi",
	"sendipack", 
	"sendisedmask",
	"sendi_armor_01",
	"sendi_rapier", 
	"sendi_rapier_wood",
	
}

--캐릭터 아이템의 이름을 지정합니다. 
                  --[    아래  ]  이자리엔 지정할 이름이 들어갑니다.
GLOBAL.STRINGS.NAMES.SENDIPACK = "센디의 책가방"
GLOBAL.STRINGS.NAMES.SENDISEDMASK = "센디의 눈물 마스크"
GLOBAL.STRINGS.NAMES.SENDI_ARMOR_01 = "센디의 니트갑옷"
GLOBAL.STRINGS.NAMES.SENDI_RAPIER = "센디의 레이피어"
GLOBAL.STRINGS.NAMES.SENDI_RAPIER_WOOD = "연습용 목재 레이피어"
--캐릭터 아이템의 이름을 지정합니다. 끝 





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
	
	Asset( "IMAGE", "images/avatars/avatar_sendi.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_sendi.xml" ),
	
	
	-----------아이템을 추가 합니다. 
	Asset( "IMAGE", "images/inventoryimages/sendipack.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendipack.xml"),
	------- 센디의 책가방

	Asset( "IMAGE", "images/inventoryimages/sendisedmask.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendisedmask.xml"),
	------- 센디의 눈물 마스크 
	
	Asset( "IMAGE", "images/inventoryimages/sendi_armor_01.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendi_armor_01.xml"),
	-------센디의 니트갑옷 [임의 지정]
	
	Asset( "IMAGE", "images/inventoryimages/sendi_rapier.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendi_rapier.xml"),
	--------센디의 레이피어
	
	Asset( "IMAGE", "images/inventoryimages/sendi_rapier_wood.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendi_rapier_wood.xml"),
	--------연습용 목재 레이피어
	

}

AddMinimapAtlas("images/map_icons/sendi.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
-- 센디가 만들수있는 레시피를 뜻하는듯합니다. 

STRINGS.CHARACTER_TITLES.sendi = "The Sample Character"
STRINGS.CHARACTER_NAMES.sendi = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.sendi = "*Perk 1\n*Perk 2\n*Perk 3"
STRINGS.CHARACTER_QUOTES.sendi = "\"Quote\""

---센디의 커스텀을 만듭니다 시작 
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local resolvefilepath = GLOBAL.resolvefilepath
local Recipe = GLOBAL.Recipe

	GLOBAL.STRINGS.NAMES.SENDISEDMASK = "센디의 눈물 마스크"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDISEDMASK = "이 마스크엔 많은 사연이 있어."
	-- 센디 마스크
	GLOBAL.STRINGS.NAMES.SENDI_ARMOR_01 = "센디의 니트갑옷" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDI_ARMOR_01 = "이 머플러, 사실은 내 옷이야!" --DESCRIBE : 말하게 하는 명령어
	-- 센디 아머 [임의 추가] 
	GLOBAL.STRINGS.NAMES.SENDI_RAPIER = "센디의 레이피어" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDI_RAPIER = "내가 애용하던것과 닮은 레이피어야! 수제지만 예쁘지?" --DESCRIBE : 말하게 하는 명령어
	--센디 레이피어
	GLOBAL.STRINGS.NAMES.SENDI_RAPIER_WOOD = "연습용 목재 레이피어" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDI_RAPIER_WOOD = "연습할때 쓰던걸 본따 만들었어. 그래도 쓸만 하다구!" --DESCRIBE : 말하게 하는 명령어	
	--센디 연습용 목재 레이피어
	GLOBAL.STRINGS.NAMES.SENDIPACK = "센디의 책가방" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDIPACK = "귀여운 가방이야. 냉장고 기능도 있어! 과학은 정말 대단해!" --DESCRIBE : 말하게 하는 명령어	
	--센디팩
-- nil, nil, nil, nil, "sendicraft" 여기서 "sendicraft"는 센디의 전용탭을 뜻한다.

local sendipack_recipe = Recipe( ("sendipack"), {Ingredient("gears", 2), Ingredient("piggyback", 1)}, RECIPETABS.SURVIVAL, TECH.NONE )
	sendipack_recipe.atlas = "images/inventoryimages/sendipack.xml"
	STRINGS.RECIPE_DESC.SENDIPACK = "센디의 하얀 가방 입니다. [냉장고]"

local sendisedmask_recipe = Recipe( ("sendisedmask"), { Ingredient("cutstone", 4), Ingredient("goldnugget", 4)}, RECIPETABS.SURVIVAL, TECH.NONE )
	sendisedmask_recipe.atlas = "images/inventoryimages/sendisedmask.xml"
	STRINGS.RECIPE_DESC.SENDISEDMASK = "슬픈 사연이 담긴 마스크.[방수 25%]"
-- SURVIVAL[생존] DRESS[ 드레스 ]

-- AddRecipe 
local sendi_armor_01_recipe = Recipe( ("sendi_armor_01"), {Ingredient("silk", 6), Ingredient("spidergland", 4), Ingredient("rope", 2)}, RECIPETABS.SURVIVAL, TECH.NONE )
	sendi_armor_01_recipe.atlas = "images/inventoryimages/sendi_armor_01.xml"
	STRINGS.RECIPE_DESC.SENDI_ARMOR_01 = "센디의 갑옷 입니다.[보온+이속]" 

local sendi_rapier_recipe = Recipe( ("sendi_rapier"), {Ingredient("sendi_rapier_wood", 1), Ingredient("hambat", 1), Ingredient("flint", 12)}, RECIPETABS.SURVIVAL, TECH.NONE )
	sendi_rapier_recipe.atlas = "images/inventoryimages/sendi_rapier.xml"
	STRINGS.RECIPE_DESC.SENDI_RAPIER = "센디의 레이피어 입니다."
		
local sendi_rapier_wood_recipe = Recipe( ("sendi_rapier_wood"), {Ingredient("twigs", 2), Ingredient("log", 8), Ingredient("rope", 2)}, RECIPETABS.SURVIVAL, TECH.NONE )
	sendi_rapier_wood_recipe.atlas = "images/inventoryimages/sendi_rapier_wood.xml"
	STRINGS.RECIPE_DESC.SENDI_RAPIER_WOOD = "센디의 연습용 레이피어 입니다."
		
		
		
---센디 아이템 명령 탬플릿

-- AddRecipe("이름", 
--{Ingredient("재료1", 재료1갯수), Ingredient("재료2", 재료2갯수)}, 
--RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "sendicraft", "이미지 xml 경로", "이미지 tex 경로")

---센디의 커스텀을 만듭니다 끝


-- Custom speech strings
STRINGS.CHARACTERS.SENDI = require "speech_sendi" -- 캐릭터의 대사집을 지정합니다

-- The character's name as appears in-game 
STRINGS.NAMES.SENDI = "sendi"

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("sendi", "FEMALE")

