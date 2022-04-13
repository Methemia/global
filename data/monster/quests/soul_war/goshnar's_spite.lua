local mType = Game.createMonsterType("Goshnar's Spice")
local monster = {}

monster.description = "Goshnars Spite"
monster.experience = 35000
monster.outfit = {
	lookType = 1305
}

monster.health = 400000
monster.maxHealth = 400000
monster.race = "undead"
monster.corpse = 38710
monster.speed = 220
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = true,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.loot = {
	{id = 38787, chance = 5000},-- figurine of spite-->
	{id = 38761, chance = 5000},-- Spites spirit -->
	{id = 38944, chance = 5},-- bag you desire-->				
	{id = 26031, chance = 18500},-- supreme health potion -->				
	{id = 2160, countmax = 4, chance = 40000},-- crystal coin -->	
	{id = 8889, chance = 1100},-- skullcracker armor -->		
	{id = 7418, chance = 1200},-- nightmare blade -->		
	{id = 7589, chance = 7500},-- strong mana potion -->		
	{id = 8910, chance = 5000},-- underworld rod -->		
	{id = 8473, chance = 7777},-- ultimate health potion -->
	{id = 8920, chance = 5000},-- wand of starstorm -->	
	--{id = 38762, chance = 5000}, -- vial of hatred -->		
	{id = 38910, chance = 10},-- the skull of a beast -->	
	{id = 38911, chance = 10},-- bracelet of strenghtening -->	
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 180, attack = 300},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -750, maxDamage = -1850, length = 8, spread = 3, effect = CONST_ME_YELLOWENERGY, target = false},
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -1480, length = 4, spread = 2, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -540, maxDamage = -1280, length = 6, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -1110, maxDamage = -1690, range = 3, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -735, maxDamage = -1515, range = 1, radius = 4, effect = CONST_ME_YELLOWENERGY, target = true},
	{name ="speed", interval = 3000, chance = 22, speedChange = -1900, radius = 6, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 60000},
	{name ="combat", interval = 1000, chance = 23, type = COMBAT_LIFEDRAIN, minDamage = -900, maxDamage = -1700, radius = 8, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -800, maxDamage = -1700, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1610, maxDamage = -2870, range = 3, shootEffect = CONST_ANI_DEATH, target = true},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -910, maxDamage = -1990, range = 7, shootEffect = CONST_ANI_MORTAREA, target = true},
	{name ="combat", interval = 1000, chance = 18, type = COMBAT_FIREDAMAGE, minDamage = -1300, maxDamage = -2200, radius = 7, effect = CONST_ME_EXPLOSIONAREA, target = false},
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 80, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = -30},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}
mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
