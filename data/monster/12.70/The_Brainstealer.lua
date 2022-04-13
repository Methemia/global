local mType = Game.createMonsterType("The Brainstealer")
local monster = {}

monster.description = "the brainstealer"
monster.experience = 30000
monster.outfit = {
	lookType = 1412,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 410000
monster.maxHealth = 410000
monster.race = "fire"
monster.corpse = 2916
monster.speed = 530
monster.manaCost = 0
monster.maxSummons = 1

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.summons = {
	{name = "lavaworm", chance = 15, interval = 1000, max = 4}
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
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "COME HERE! FREE ITEMS FOR EVERYONE!", yell = true},
	{text = "BOW TO THE POWER OF THE RUTHLESS SEVEN!", yell = false},
	{text = "Slay your friends and I will spare you!", yell = true},
	{text = "DON'T BE AFRAID! I AM COMING IN PEACE!", yell = true}
}

monster.loot = {
	{id = 7439, chance = 3500},
	{id = 7440, chance = 9000},
	{id = 26030, chance = 15000, maxCount = 15},
	{id = 26031, chance = 1500},
	{id = 34699, chance = 4000},
	{id = 37606, chance = 3500},
	{id = 2153, chance = 2500, maxCount = 15},
	{id = 2152, chance = 1500},
	{id = 38860, chance = 5500},
	{id = 2160, chance = 15500, maxCount = 15},
	{id = 41491, chance = 60},
	{id = 41492, chance = 60},
	{id = 41493, chance = 5},
	{id = 41494, chance = 60},
	{id = 41495, chance = 5},
	{id = 41496, chance = 60},
	{id = 41497, chance = 5},
	{id = 41498, chance = 60},
	{id = 41499, chance = 60},
	{id = 41500, chance = 5},
	{id = 41501, chance = 60},
	{id = 41502, chance = 60},
	{id = 415503, chance = 60},
	{id = 41504, chance = 5},
	{id = 41505, chance = 60},
	{id = 41506, chance = 60},
	{id = 41507, chance = 60},
	{id = 41508, chance = 60},
	{id = 41509, chance = 60},
	{id = 41510, chance = 5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 200, attack = 250},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_MANADRAIN, minDamage = -700, maxDamage = -1800, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 1000, chance = 23, type = COMBAT_LIFEDRAIN, minDamage = -900, maxDamage = -1700, radius = 8, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -800, maxDamage = -1700, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 1000, chance = 22, speedChange = -1900, radius = 6, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 18, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_DEATHDAMAGE, minDamage = -700, maxDamage = -1900, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -950, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{name ="combat", interval = 8000, chance = 15, type = COMBAT_HEALING, minDamage = 500, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 7000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
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
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
