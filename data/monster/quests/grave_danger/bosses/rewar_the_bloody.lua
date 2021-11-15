local mType = Game.createMonsterType("Rewar the Bloody")
local monster = {}

monster.description = "Rewar the Bloody"
monster.experience = 0
monster.outfit = {
	lookType = 1221,
	lookHead = 0,
	lookBody = 95,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 220000
monster.maxHealth = 220000
monster.race = "undead"
monster.corpse = 0
monster.speed = 2*190
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 0,
	isHealthHidden = false,
	canwalkonenergy = true,
	canwalkonfire = true,
	canwalkonpoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You will die by the hand of our lich king!", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 4000, chance = 30, minDamage = -300, maxDamage = -500, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_STONES, target = false},
	{name ="combat", interval = 6000, chance = 30, minDamage = -500, maxDamage = -800, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_STONES, target = false},
}

monster.defenses = {
	defense = 65,
	armor = 70,
	{name ="combat", interval = 3000, chance = 35, minDamage = 100, maxDamage = 1000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 55},
	{type = COMBAT_ENERGYDAMAGE, percent = 55},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
