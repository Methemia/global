local mType = Game.createMonsterType("Brain Head")
local monster = {}

monster.description = "Brain Head"
monster.experience = 130000
monster.outfit = {
	lookTypeEx = 37253
}

monster.health = 52000
monster.maxHealth = 52000
monster.race = "blood"
monster.corpse = 37107
monster.speed = 0
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
	{name = "crystal coin", chance = 96080, maxCount = 2},
	{name = "white gem", chance = 52940, maxCount = 2},
	{name = "supreme health potion", chance = 29410, maxCount = 6},
	{name = "berserk potion", chance = 29410, maxCount = 10},
	{name = "berserk potion", chance = 23530, maxCount = 10},
	{name = "death toll", chance = 23530},
	{name = "mastermind potion", chance = 19610, maxCount = 10},
	{name = "moonstone", chance = 19610, maxCount = 1},
	{name = "ultimate mana potion", chance = 29410, maxCount = 6},
	{name = "ultimate spirit potion", chance = 29410, maxCount = 6},
	{name = "ivory comb", chance = 13730},
	{name = "angel figurine", chance = 11760},
	{name = "diamond", chance = 11760},
	{name = "cursed bone", chance = 7840},
	{name = "giant amethyst", chance = 1380},
	{name = "giant topaz", chance = 1330},
	{name = "ghost claw", chance = 1960},
	{name = "silver hand mirror", chance = 1400},
	{id = 37451, chance = 150},
	{id = 37456, chance = 150},
	{name = "Brain Head's Giant Neuron", chance = 990},
	{name = "Brain Head's Right Hemisphere", chance = 950},
	{name = "Brain Head's Left Hemisphere", chance = 950},
	{name = "Pair of Old Bracers", chance = 1120}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1500},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -400, maxDamage = -900, range = 5, effect = CONST_ME_FIREAREA, radius = 5, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -900, length = 5, spread = 3, effect = CONST_ME_ENERGYHIT, target = true}
}

monster.defenses = {
	defense = 40,
	armor = 82,
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 500, maxDamage = 1500, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.reflects = {
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 30}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
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
