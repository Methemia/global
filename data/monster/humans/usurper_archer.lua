local mType = Game.createMonsterType("Usurper Archer")
local monster = {}

monster.description = "a usurper archer"
monster.experience = 6800
monster.outfit = {
	lookType = 1316,
	lookHead = 57,
	lookBody = 38,
	lookLegs = 21,
	lookFeet = 21,
	lookAddons = 2,
	lookMount = 0
}

monster.raceId = 1973
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Bounac, the Order of the Lion settlement."
	}

monster.health = 7300
monster.maxHealth = 7300
monster.race = "blood"
monster.corpse = 38816
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 0

monster.faction = FACTION_LIONUSURPERS
monster.enemyFactions = {FACTION_LION, FACTION_PLAYER}

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{text = "This town is ours now!", yell = false},
	{text = "You don't deserv Bounac!", yell = false},
	{text = "My power is fueled by a just cause!", yell = false},
	{text = "This will be the last thing you witness!", yell = false},
	{text = "Change of guard! High time ...!", yell = false},
	{text = "Do you really think you can stand?", yell = false},
	{text = "'Holding breath'", yell = false},
	{text = "Die in the flames of true righteousness.", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -430, range = 7, shootEffect = CONST_ANI_BURSTARROW, target = true},
	{name ="combat", interval = 6000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -160, maxDamage = -485, range = 7, shootEffect = CONST_ANI_SMALLHOLY, target = true},
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -160, maxDamage = -545, range = 7, effect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH, target = true},
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -150, maxDamage = -425, radius = 3, effect = CONST_ME_ICEAREA, target = true}
}

monster.defenses = {
	defense = 40,
	armor = 108,
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_HEALING, minDamage = 250, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)