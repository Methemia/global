local mType = Game.createMonsterType("Malofur Mangrinder")
local monster = {}

monster.description = "Malofur Mangrinder"
monster.experience = 55000
monster.outfit = {
	lookType = 1120,
	lookHead = 19,
	lookBody = 22,
	lookLegs = 76,
	lookFeet = 22,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 220000
monster.maxHealth = 220000
monster.race = "blood"
monster.corpse = 34655
monster.speed = 250
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "RAAAARGH! I'M MASHING YE TO DUST BOOM!", yell = false},
	{text = "BOOOM!", yell = false},
	{text = "BOOOOM!!!", yell = false},
	{text = "BOOOOOM!!!", yell = false}
}

monster.loot = {
	{name = "Ultimate Spirit Potion", chance = 50000, maxCount = 6},
	{name = "Crystal Coin", chance = 50000},
	{name = "Ultimate Mana Potion", chance = 50000, maxCount = 14},
	{name = "Supreme Health Potion", chance = 50000, maxCount = 6},
	{name = "Gold Token", chance = 5000, maxCount = 2},
	{name = "Silver Token", chance = 10000, maxCount = 2},
	{id = 7632, chance = 10000},
	{name = "Green Gem", chance = 10000},
	{name = "Red Gem", chance = 50000},
	{name = "Blue Gem", chance = 10000},
	{id = 26185, chance = 50000},
	{name = "Platinum Coin", chance = 50000, maxCount = 5},
	{name = "Bullseye Potion", chance = 50000, maxCount = 10},
	{name = "Piggy Bank", chance = 10000},
	{name = "Mysterious Remains", chance = 10000},
	{name = "Energy Bar", chance = 10000},
	{id = 26199, chance = 10000},
	{name = "Ring of the Sky", chance = 1000},
	{name = "Crunor Idol", chance = 20},
	{name = "Resizer", chance = 20},
	{name = "Shoulder Plate", chance = 20},
	{name = "Malofur's Lunchbox", chance = 50},
	{name = "Pomegranate", chance = 30}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -700, maxDamage = -2000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -850, maxDamage = -1800, length = 7, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -900, maxDamage = -1700, range = 5, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -2300, radius = 7, effect = CONST_ME_GROUNDSHAKER, target = true},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_EARTHDAMAGE, minDamage = -560, maxDamage = -1600, range = 5, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_GREEN_ENERGY_SPARK, target = true}
}

monster.defenses = {
	defense = 30,
	armor = 100
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
