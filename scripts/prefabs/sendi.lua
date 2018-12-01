
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

--레벨업 함수 시작 
inst.level = 0
--레벨업 함수 시작 

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

	-------------------------------------------성장 ----------------------------------------
	
	
local function applyupgrades(inst)

 local max_upgrades = 15   -------- 업그레이드 최대 횟수
 local upgrades = math.min(inst.level, max_upgrades)  ----------- 업그레이드 남은 횟수

 local hunger_percent = inst.components.hunger:GetPercent()
 local health_percent = inst.components.health:GetPercent()
 local sanity_percent = inst.components.sanity:GetPercent()

 inst.components.hunger.max = math.ceil(TUNING.WX78_MIN_HUNGER + upgrades* (TUNING.WX78_MAX_HUNGER - TUNING.WX78_MIN_HUNGER)/max_upgrades)

----------- 최대 배고픔 증가

 inst.components.health.maxhealth = math.ceil(TUNING.WX78_MIN_HEALTH + upgrades* (TUNING.WX78_MAX_HEALTH - TUNING.WX78_MIN_HEALTH)/max_upgrades)

----------- 최대 체력 증가

 inst.components.sanity.max = math.ceil(TUNING.WX78_MIN_SANITY + upgrades* (TUNING.WX78_MAX_SANITY - TUNING.WX78_MIN_SANITY)/max_upgrades)

----------- 최대 정신력 증가

 inst.components.hunger:SetPercent(hunger_percent)
 inst.components.health:SetPercent(health_percent)
 inst.components.sanity:SetPercent(sanity_percent)
 
end

-----------------------------------

local function oneat(inst, food)
 
 if food and food.components.edible and food.components.edible.foodtype == "GEARS" then
  --give an upgrade!
  inst.level = inst.level + 1
  applyupgrades(inst) 
  inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
  inst.HUD.controls.status.heart:PulseGreen()
  inst.HUD.controls.status.stomach:PulseGreen()
  inst.HUD.controls.status.brain:PulseGreen()
  
  inst.HUD.controls.status.brain:ScaleTo(1.3,1,.7)
  inst.HUD.controls.status.heart:ScaleTo(1.3,1,.7)
  inst.HUD.controls.status.stomach:ScaleTo(1.3,1,.7)
 end
end
------------------------

table.insert(inst.components.eater.foodprefs, "GEARS")
 table.insert(inst.components.eater.ablefoods, "GEARS")
 inst.components.eater:SetOnEatFn(oneat)
 applyupgrades(inst)
 
 
 
 local function onsave(inst, data)
 data.level = inst.level  --- 게임을 세이브할때 레벨을 저장합니다
end


----------------------  

local function onload(inst, data)
 if data then
  if data.level then
   inst.level = data.level
   applyupgrades(inst) -- 게임 로드시 레벨을 다시 불러와 저장합니다.

   if data.health and data.health.health then inst.components.health.currenthealth = data.health.health end
   if data.hunger and data.hunger.hunger then inst.components.hunger.current = data.hunger.hunger end
   if data.sanity and data.sanity.current then inst.components.sanity.current = data.sanity.current end
   inst.components.health:DoDelta(0)
   inst.components.hunger:DoDelta(0)
   inst.components.sanity:DoDelta(0)
  end
 end

end



--레벨업 함수 끝
inst.OnSave = onsave
inst.OnLoad = onload
--레벨업 함수 끝


--------------------------

   
end

----------------------------------
 


return MakePlayerCharacter("sendi", prefabs, assets, fn, start_inv)