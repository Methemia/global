local mType = Game.createMonsterType("Goshnar's Cruelty")
local monster = {}

monster.description = "a goshnar's cruelty"
monster.experience = 600
monster.outfit = {
	lookType = 1307,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8200
monster.maxHealth = 8200
monster.race = "fire"
monster.corpse = 5995
monster.speed = 240
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
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 30,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
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
	{text = "GROOAAARRR", yell = true},
	{text = "FCHHHHH", yell = true}
}

monster.loot = {
		{name="purple tome", chance = 1180},
		{name="gold coin", maxCount = 100, chance = 60000},
		{name="gold coin", maxCount = 100, chance = 60000},
		{name="small emerald", maxCount = 10, chance = 9690},
		{name="small amethyst", maxCount = 10, chance = 7250},		
		{name="small ruby", maxCount = 10, chance = 7430},		
		{name="small topaz", maxCount = 10, chance = 7470},		
		{name="red gem", chance = 5000},
		{name="demonic essence", chance = 14630},		
		{name="talon", chance = 5000},
		{name="platinum coin", maxCount=8, chance = 90540},
		{name="might ring", chance = 2500},
		{name="stealth ring", chance = 2170},
		{name="platinum amulet", chance = 1500},
		{name="orb", chance = 2854},
		{name="gold ring", chance = 2000},
		{name="ring of healing", chance = 2300},
		{name="double axe", chance = 4750},
		{name="giant sword", chance = 5000},
		{name="ice rapier", chance = 2000},
		{name="golden sickle", chance = 5000},
		{name="fire axe", chance = 6000},
		{name="devil helmet", chance = 2000},
		{name="golden legs", chance = 1200},
		{name="magic plate armor", chance = 650},
		{name="mastermind shield", chance = 600},
		{name="demon shield", chance = 800},
		{name="fire mushroom", maxCount = 6, chance = 19660},
		{name="demon horn", chance = 14920},
		{name="assassin star", maxCount = 10, chance = 12550},
		{name="demonrage sword", chance = 2000},
		{id=7393, chance = 1000},
		{name="great mana potion", maxCount = 3, chance = 22220},
		{name="ultimate health potion", maxCount = 3, chance = 19540},
		{name="great spirit potion", maxCount = 3, chance = 18510}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -140, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -170, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false}
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

mType:register(monster)
