local mType = Game.createMonsterType("Hulking Carnisylvan")
local monster = {}

monster.description = "a Hulking Carnisylvan"
monster.experience = 4200
monster.outfit = {
	lookType = 1418,
	lookHead = 0,
	lookBody = 98,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}



monster.health = 8600
monster.maxHealth = 8600
monster.race = "blood"
monster.corpse = 40961
monster.speed = 200
monster.manaCost = 0
monster.maxSummons = 0

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
	canPushCreatures = false,
	staticAttackChance = 70,
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
	{text = "Burn, infidel!", yell = false},
	{text = "Only the Wild Sun shall shine down on this world!", yell = false},
	{text = "Praised be Fafnar, the Smiter!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 30000, maxCount = 90},
	{name = "butterfly ring", chance = 292},
	{name = "Wand of Starstorm", chance = 892},
	{name = "carnisylvan bark", chance = 920},
	{name = "carnisylvan finger", chance = 920},
	{name = "green mushroom", chance = 492}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550},
	{name ="firering", interval = 2000, chance = 10, minDamage = -300, maxDamage = -500, target = false},
	{name ="firex", interval = 2000, chance = 15, minDamage = -300, maxDamage = -500, target = false},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -500, radius = 2, effect = CONST_ME_FIREATTACK, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -500, length = 3, spread = 0, effect = CONST_ME_ENERGYHIT, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 89
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
