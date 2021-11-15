local mType = Game.createMonsterType("Izcandar Champion of Winter")
local monster = {}

monster.description = "Izcandar Champion of Winter"
monster.experience = 69000
monster.outfit = {
	lookType = 1137,
	lookHead = 0,
	lookBody = 19,
	lookLegs = 12,
	lookFeet = 0,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 250
monster.manaCost = 0
monster.maxSummons = 4

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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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

monster.summons = {
	{name = "the cold of winter", chance = 30, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "berserk potion", chance = 100000, maxCount = 10},
	{name = "bullseye potion", chance = 100000, maxCount = 10},
	{name = "crystal coin", chance = 100000},
	{name = "energy bar", chance = 100000},
	{name = "giant sapphire", chance = 100000},
	{name = "skull staff", chance = 12800},
	{name = "gold token", chance = 100000, maxCount = 2},
	{name = "silver token", chance = 100000, maxCount = 2},
	{name = "royal star", chance = 100000, maxCount = 100},
	{name = "green gem", chance = 100000, maxCount = 2},
	{name = "huge chunk of crude iron", chance = 25100},
	{name = "mysterious remains", chance = 25000},
	{name = "piggy bank", chance = 12800},
	{name = "platinum coin", chance = 12000, maxCount = 10},
	{name = "gold ingot", chance = 12000, maxCount = 1},
	{name = "supreme health potion", chance = 12000, maxCount = 10},
	{name = "ultimate mana potion", chance = 12000, maxCount = 20},
	{id = 26165, chance = 10000},
	{id = 2123, chance = 3400},
	{id = 7427, chance = 3400},
	{id = 34582, chance = 9650},
	{id = 34694, chance = 9650},
	{id = 34807, chance = 9650},
	{id = 26185, chance = 12000},
	{id = 26198, chance = 12000},
	{id = 26200, chance = 12000},
	{id = 26189, chance = 12000},
	{id = 34060, chance = 1280}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = 1000},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -1500, length = 4, spread = 3, effect = CONST_ME_GIANTICE, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -1000, length = 8, effect = CONST_ME_ICE, target = false}
}

monster.defenses = {
	defense = 0,
	armor = 76
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 100},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
