local mType = Game.createMonsterType("Maxxenius")
local monster = {}

monster.description = "a Maxxenius"
monster.experience = 55000
monster.outfit = {
	lookType = 1142,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 220000
monster.maxHealth = 220000
monster.race = "blood"
monster.corpse = 34789
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
}

monster.loot = {
	{name = "Platinum Coin", chance = 100000, maxCount = 5},
	{name = "Mysterious Remains", chance = 100},
	{name = "Piggy Bank", chance = 100000},
	{name = "Brain in a Jar", chance = 100},
	{name = "Maxxenius Head", chance = 100},
	{name = "Silver Token", chance = 100000, maxCount = 3},
	{name = "Energy Bar", chance = 1000},
	{name = "Crystal Coin", chance = 13790},
	{name = "Gold Ingot", chance = 17240},
	{name = "Bullseye Potion", chance = 24114, maxCount = 10},
	{name = "Mastermind Potion", chance = 17240, maxCount = 10},
	{name = "Royal Star", chance = 100000, maxCount = 100},
	{name = "Supreme Health Potion", chance = 41380, maxCount = 20},
	{name = "Ultimate Spirit Potion", chance = 48280, maxCount = 60},
	{name = "Ultimate Mana Potion", chance = 68970, maxCount = 14},
	{name = "Giant Ruby", chance = 3450},
	{name = "Ornate Locket", chance = 40},
	{name = "Gold Token", chance = 68970, maxCount = 2},
	{id = 7632, chance = 280},
	{name = "Pomegranate", chance = 20},
	{name = "Chaos Mace", chance = 6900},
	{id = 26184, chance = 100},
	{id = 26199, chance = 100},
	{name = "Green Gem", chance = 31030},
	{name = "Yellow Gem", chance = 31030},
	{name = "Violet Gem", chance = 6900},
	{name = "Blue Gem", chance = 10340},
	{name = "Huge Chunk of Crude Iron", chance = 140},
	{id = 26185, chance = 30},
	{name = "Skull Staff", chance = 290},
	{name = "Energized Limb", chance = 30},
	{name = "Purple Tendril Lantern", chance = 30}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2000},
	{name ="energy beam", interval = 2000, chance = 15, minDamage = -500, maxDamage = -1200, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="energy wave", interval = 2000, chance = 18, minDamage = -500, maxDamage = -1200, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 5,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.heals = {
	{type = COMBAT_ENERGYDAMAGE, percent = 500}
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
