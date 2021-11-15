local mType = Game.createMonsterType("The Pale Worm")
local monster = {}

monster.description = "The Pale Worm"
monster.experience = 150000
monster.outfit = {
	lookType = 1272,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 52000
monster.maxHealth = 52000
monster.race = "venom"
monster.corpse = 37572
monster.speed = 300
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
}

monster.loot = {
	{name = "crystal coin", chance = 96080, maxCount = 2},
	{name = "white gem", chance = 52940, maxCount = 2},
	{name = "moonstone", chance = 52940, maxCount = 2},
	{name = "ultimate mana potion", chance = 43140, maxCount = 6},
	{name = "supreme health potion", chance = 29410, maxCount = 6},
	{name = "silver hand mirror", chance = 27450},
	{name = "berserk potion", chance = 23530, maxCount = 10},
	{name = "ultimate spirit potion", chance = 23530, maxCount = 6},
	{name = "bullseye potion", chance = 19610, maxCount = 10},
	{name = "mastermind potion", chance = 19610, maxCount = 10},
	{name = "death toll", chance = 13730, maxCount = 2},
	{name = "ivory comb", chance = 13730},
	{name = "angel figurine", chance = 11760},
	{name = "diamond", chance = 11760},
	{name = "cursed bone", chance = 7840},
	{name = "soulforged lantern", chance = 7840},
	{name = "grimace", chance = 5880},
	{name = "amber", chance = 5880},
	{name = "amber with a dragonfly", chance = 100},
	{name = "Amber with a Bug", chance = 120},
	{name = "the spectral scrap of cloth", chance = 120},
	{name = "Pale Worm's Scalp", chance = 60},
	{name = "Ravenous Circlet", chance = 90},
	{name = "ghost claw", chance = 60},
	{name = "bloody tears", chance = 1500},
	{id = 37463, chance = 80},
	{id = 37454, chance = 80},
	{id = 37455, chance = 80},
	{id = 37465, chance = 80},
	{id = 37451, chance = 80},
	{id = 37456, chance = 80},
	{id = 37453, chance = 80},
	{id = 37452, chance = 80},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -3000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_POISONDAMAGE, minDamage = -600, maxDamage = -1300, range = 5, effect = CONST_ME_POISONAREA, radius = 5, shootEffect = CONST_ANI_POISON, target = true},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="thepalewormringsmoke", interval = 2000, chance = 8, minDamage = -400, maxDamage = -1200, target = false},
}

monster.defenses = {
	defense = 40,
	armor = 82,
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 500, maxDamage = 1500, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
