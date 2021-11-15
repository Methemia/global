local mType = Game.createMonsterType("Ratmiral Blackwhiskers")
local monster = {}

monster.description = "Ratmiral Blackwhiskers"
monster.experience = 20000
monster.outfit = {
	lookType = 1377,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150000
monster.maxHealth = 150000
monster.race = "blood"
monster.corpse = 40681
monster.speed = 320
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 1,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
}

monster.voices = {
	interval = 5000,
	chance = 0
}

monster.loot = {
	{name = "ultimate health potion", chance = 44810, maxCount = 10},
	{name = "berserk potion", chance = 44810, maxCount = 5},
	{name = "berserk potion", chance = 44810},
	{name = "golden skull", chance = 20150, maxCount = 5},
	{name = "small treasure chest", chance = 19420},
	{name = "Ratmiral's Hat", chance = 7810},
	{name = "shark fins", chance = 1750},
	{name = "Jungle Flail", chance = 300},
	{name = "Jungle Bow", chance = 300},
	{name = "Jungle Rod", chance = 300},
	{name = "Jungle Wand", chance = 300},
	{name = "Throwing Axe", chance = 300},
	{name = "Jungle Quiver", chance = 350},
	{name = "Make-Do Boots", chance = 350},
	{name = "Makeshift Boots", chance = 350},
	{name = "Exotic Legs", chance = 300},
	{name = "Scrubbing Brush", chance = 300},
	{name = "Soap", chance = 300},
	{name = "Bast Legs", chance = 250},
	{name = "Exotic Amulet", chance = 250}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1200},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -250, maxDamage = -750, range = 7, radius = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -550, maxDamage = -2000, length = 8, spread = 3, effect = CONST_ME_FIREATTACK, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -350, maxDamage = -450, radius = 4, effect = CONST_ME_SOUND_RED, target = false},
}

monster.defenses = {
	defense = 68,
	armor = 72,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 500, maxDamage = 950, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
