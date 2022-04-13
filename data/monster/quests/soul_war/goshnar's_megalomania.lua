local mType = Game.createMonsterType("Goshnar's Megalomania")
local monster = {}

monster.description = "a goshnar's megalomania"
monster.experience = 85000
monster.outfit = {
	lookType = 1308,
	lookHead = 95,
	lookBody = 114,
	lookLegs = 76,
	lookFeet = 57,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "undead"
monster.corpse = 38724
monster.speed = 220
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 30,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "GROOAAARRR", yell = true},
	{text = "FCHHHHH", yell = true}
}

monster.loot = {
	{id = 2160, countmax = 4, chance = 20000},-- platinum -->
	{id = 2150, countmax = 3, chance = 10000},-- small amethyst -->
	{id = 38944, chance = 5},-- bag you desire -->			
	{id = 6558, chance = 18500},-- strong health potion -->				
	{id = 5022, countmax = 4, chance = 40000},-- white pearl -->	
	{id = 8889, chance = 1100},-- skullcracker armor -->		
	{id = 7418, chance = 1200},-- nightmare blade -->		
	{id = 7589, chance = 7500},-- strong mana potion -->		
	{id = 8910, chance = 5000},-- underworld rod -->		
	{id = 8473, chance = 7777},-- ultimate health potion -->
	{id = 15403, chance = 5000},-- necklace of the deep -->	
	{id = 8920, chance = 50},-- wand of starstorm -->	
	{id = 38910, chance = 10},-- the skull of a beast -->	
	{id = 38911, chance = 10},-- bracelet of strenghtening -->	
	{id = 38760, chance = 50},-- megalomania's skull -->	
	{id = 38763, chance = 50},-- megalomania's essence -->	
}

monster.attacks = {
	{name  = "melee", interval = 2000, chance = 100, skill = 180, attack = 300},
	{name  = "combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -1750, maxDamage = -2850, length = 8, spread = 3, effect = CONST_ME_YELLOWENERGY, target = false},
	{name  = "combat", interval = 1000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -1750, maxDamage = -2880, length = 4, spread = 2, effect = CONST_ME_MORTAREA, target = false},
	{name  = "combat", interval = 1000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -1600, maxDamage = -1280, length = 6, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name  = "combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -1110, maxDamage = -1690, range = 3, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name  = "combat", interval = 1000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -735, maxDamage = -1615, range = 8, radius = 4, effect = CONST_ME_YELLOWENERGY, target = true},
	{name ="speed", interval = 3000, chance = 22, speedChange = -1900, radius = 6, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 60000},
	{name ="combat", interval = 1000, chance = 23, type = COMBAT_LIFEDRAIN, minDamage = -900, maxDamage = -1700, radius = 8, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -800, maxDamage = -1700, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name  = "combat", interval = 1000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -710, maxDamage = -1570, range = 8, shootEffect = CONST_ANI_DEATH, target = true},
	{name  = "combat", interval = 1000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -910, maxDamage = -1990, range = 8, shootEffect = CONST_ANI_MORTAREA, target = true},
	{name  = "combat", interval = 1000, chance = 18, type = COMBAT_FIREDAMAGE, minDamage = -1300, maxDamage = -2200, radius = 7, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name  = "big death wave", interval = 2000, chance = 10, minDamage = -900, maxDamage = -1200, range = 5, target = false},
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 40, maxDamage = 70, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = true}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
