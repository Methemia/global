local mType = Game.createMonsterType("Plagueroot")
local monster = {}

monster.description = "a Plagueroot"
monster.experience = 55000
monster.outfit = {
	lookType = 1121,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 220000
monster.maxHealth = 220000
monster.race = "venom"
monster.corpse = 34660
monster.speed = 170
monster.manaCost = 0
monster.maxSummons = 6

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
	{name = "plant attendant", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "Piggy Bank", chance = 100000},
	{name = "Mysterious Remains", chance = 1000},
	{name = "Energy Bar", chance = 100000},
	{name = "Silver Token", chance = 100000, maxCount = 3},
	{name = "Gold Token", chance = 22000, maxCount = 2},
	{name = "Supreme Health Potion", chance = 23550},
	{name = "Ultimate Mana Potion", chance = 25550},
	{name = "Huge Chunk of Crude Iron", chance = 80},
	{name = "Royal Star", chance = 1570, maxCount = 100},
	{name = "Green Gem", chance = 12800, maxCount = 2},
	{name = "Yellow Gem", chance = 1200, maxCount = 2},
	{name = "Red Gem", chance = 12700, maxCount = 2},
	{name = "Bullseye Potion", chance = 2500, maxCount = 10},
	{name = "Pomegranate", chance = 30},
	{name = "Crystal Coin", chance = 7700, maxCount = 2},
	{name = "Skull Staff", chance = 7650},
	{name = "Chaos Mace", chance = 200},
	{name = "Gold Ingot", chance = 180},
	{id = 26199, chance = 250},
	{id = 7632, chance = 260},
	{name = "Blue Gem", chance = 2500},
	{name = "Violet Gem", chance = 2300, maxCount = 2},
	{name = "Living Armor", chance = 30},
	{name = "Magic Sulphur", chance = 100},
	{name = "Mastermind Potion", chance = 200, maxCount = 10},
	{id = 26185, chance = 80},
	{name = "Ring of the Sky", chance = 80},
	{name = "Living Vine Bow", chance = 30},
	{name = "Abyss Hammer", chance = 40},
	{id = 26187, chance = 40},
	{name = "Plagueroot Offshoot", chance = 40},
	{name = "Turquoise Tendril Lantern", chance = 30}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1800},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="plaguerootplants", interval = 1000, chance = 13, minDamage = -1000, maxDamage = -1500, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -1200, radius = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true}
}

monster.defenses = {
	defense = 150,
	armor = 165,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 500, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 200, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 220},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.heals = {
	{type = COMBAT_EARTHDAMAGE, percent = 500}
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
