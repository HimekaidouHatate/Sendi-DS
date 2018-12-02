
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/sendi.zip" ),
}
local prefabs = {}
local start_inv = {
   -- Custom starting items
}


---------------------------미쉘의 허기불꽃 ----------------------------------------
local function Wharang_HungerFire(inst, data)
--지역 함수 설정 : 화랑 허기불꽃
   if not inst:HasTag("playerghost") then
   --플레이어가 유령이 아니라면
   local Light = inst.entity:AddLight()
   -- 지역변수 설정 - Ligh=inst.entity:AddLight()

      
        if inst.components.hunger:GetPercent() <= .68 then
        -- 허기비율이 68 이하라면
         Light:Enable(false)
         --빛 해제
         inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1)
            --포만도 감소속도를 윌슨의 1배로 설정(기본값)
         elseif inst.components.hunger:GetPercent() > .68 then
         --혹은 포만도가 80% 초과라면
       
       
            inst.entity:AddLight()
            --엔티티에게 빛 추가
            inst.Light:SetRadius(1.5)
            --범위 반경 설정
            inst.Light:SetFalloff(.7)
            --빛의 감퇴량 설정
            inst.Light:SetIntensity(.5)
            --빛의 강도 설정
            inst.Light:SetColour(255/255,111/255,59/255)
            --빛의 색 설정
            inst.Light:Enable(true)
            --inst.Light:Enable값을 true로 설정?
            inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2.4)
            --포만도 감소량 증폭
        end

   end
end
---------------------------미쉘의 허기불꽃 ----------------------------------------

local fn = function(inst)


		inst.components.health:SetMaxHealth(90)
		inst.components.hunger:SetMax(120)
		inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1)
		inst.components.combat.damagemultiplier = 0.8
		inst.components.combat.min_attack_period = 0.02
		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.2)
		inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.45)
 

 ------ 5초에 1.5 회복
		inst.components.health:StartRegen(0.2, 1.5)
	
--위커바컴 책 읽기 제조 추가 
--알아낸 사실: 기존 돈스타브폴더안 book. 루아 같은것을 캐릭터 루아있는곳에붙혀도 된다.. 이건 혁명인걸?

		inst:AddComponent("reader")
		inst.components.eater.stale_hunger = TUNING.WICKERBOTTOM_STALE_FOOD_HUNGER
		inst.components.eater.stale_health = TUNING.WICKERBOTTOM_STALE_FOOD_HEALTH
		inst.components.eater.spoiled_hunger = TUNING.WICKERBOTTOM_SPOILED_FOOD_HUNGER
		inst.components.eater.spoiled_health = TUNING.WICKERBOTTOM_SPOILED_FOOD_HEALTH

local booktab = {str = STRINGS.TABS.BOOKS, sort=999, icon = "tab_book.tex"}
		inst.components.builder:AddRecipeTab(booktab)
		Recipe("book_birds", {Ingredient("papyrus", 2), Ingredient("bird_egg", 2)}, booktab, {SCIENCE = 0, MAGIC = 0, ANCIENT = 0})
		Recipe("book_gardening", {Ingredient("papyrus", 2), Ingredient("seeds", 1), Ingredient("poop", 1)}, booktab, {SCIENCE = 1})
		Recipe("book_sleep", {Ingredient("papyrus", 2), Ingredient("nightmarefuel", 2)}, booktab, {MAGIC = 2})
		Recipe("book_brimstone", {Ingredient("papyrus", 2), Ingredient("redgem", 1)}, booktab, {MAGIC = 3})
		Recipe("book_tentacles", {Ingredient("papyrus", 2), Ingredient("tentaclespots", 1)}, booktab, {SCIENCE = 3})
 
 
   -- choose which sounds this character will play
   inst.soundsname = "willow"

   -- Minimap icon
   inst.MiniMapEntity:SetIcon( "sendi.tex" )
   
   --hungerdelta
   inst:ListenForEvent("hungerdelta", Wharang_HungerFire)
   
    inst:AddComponent("reader")

 


return MakePlayerCharacter("sendi", prefabs, assets, fn, start_inv)