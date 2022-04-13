local mType = Game.createMonsterType("Goshnar's Greed")
local monster = {}

monster.description = "a Goshnars Greed"
monster.experience = 82500
monster.outfit = {
	lookType = 1304,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 400000	
monster.maxHealth = 400000
monster.race = "fire"
monster.corpse = 5995
monster.speed = 280

monster.changeTarget = {
	interval = 4000,
	chance = 20
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Your soul will be mine!", yell = false},
	{text = "MUHAHAHAHA!", yell = false},
	{text = "CHAMEK ATH UTHUL ARAK!", yell = false},
	{text = "I SMELL FEEEEAAAAAR!", yell = false},
	{text = "Your resistance is futile!", yell = false}
}

monster.loot = {
	{name = "small diamond", chance = 9690, maxCount = 5},
	{id = 38944, chance = 5},-- bag you desire -->
	{name = "cyan crystal fragment", chance = 6630},
	{name = "mercenary sword", chance = 70},
	{name = "platinum coin", chance = 90540, maxCount = 8},
	{name = "gold ingot", chance = 440},
	{name = "red crystal fragment", chance = 6630},
	{name = "giant sword", chance = 1980},
	{name = "green crystal fragment", chance = 6630},	
	{name = "ultimate health potion", chance = 19540, maxCount = 3},
	{name = "blue crystal shard", chance = 3430},
	{name = "magma boots", chance = 1890},
	{name = "war axe", chance = 2170},
	{name = "onyx chip", chance = 18510, maxCount = 3}
}

monster.attacks = {
	{name ="melee", interval = 1000, minDamage = -400, maxDamage = -1350, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -1000, maxDamage = -2720, type = COMBAT_MANADRAIN, range = 7, target = false},
	{name ="combat", interval = 1000, chance = 20, minDamage = -650, maxDamage = -1500, type = COMBAT_FIREDAMAGE, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="firefield", interval = 1000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="speed", interval = 3000, chance = 22, speedChange = -1900, radius = 6, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 60000},
	{name ="combat", interval = 1000, chance = 23, type = COMBAT_LIFEDRAIN, minDamage = -900, maxDamage = -1900, radius = 8, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -1000, maxDamage = -1900, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 1000, chance = 10, minDamage = -650, maxDamage = -1700, type = COMBAT_LIFEDRAIN, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 1000, chance = 10, minDamage = -550, maxDamage = -1900, type = COMBAT_ENERGYDAMAGE, range = 1, radius = 7, shootEffect = CONST_ANI_ENERGY, target = false},	
	{name ="speed", interval = 1000, chance = 15, radius = 1, SpeedChange = -700, Duration = 30000, effect = CONST_ME_MAGIC_RED }
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 320, Duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent =10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},	
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "fire", condition = true},
	{type = "drown", condition = true},
	{type = "invisible", condition = true}
}

monster.summons = {
	{type = "fire elemental", interval = 2000, chance = 10, maxsummons = 1}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)