local mType = Game.createMonsterType("Tentugly's Head")
local monster = {}

monster.description = "a Tentugly's Head"
monster.experience = 0
monster.outfit = {
	lookTypeEx = 39940
}

monster.health = 130000
monster.maxHealth = 130000
monster.race = "blood"
monster.corpse = 40435
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 4

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

monster.voices = {
	interval = 5000,
	chance = 0
}

monster.summons = {
	{name = "Servant of Tentugly", chance = 70, interval = 2000}
}

monster.loot = {
	{name = "cheese key", chance = 300},
	{name = "ultimate health potion", chance = 44810, maxCount = 10},
	{name = "berserk potion", chance = 44810, maxCount = 5},
	{name = "berserk potion", chance = 44810},
	{name = "golden skull", chance = 100, maxCount = 5},
	{name = "small treasure chest", chance = 19420},
	{name = "Tentugly's eye", chance = 50},
	{name = "Tentugly's jaws", chance = 50},
	{name = "Tentacle of Tentugly", chance = 40},
	{name = "Plushie of Tentugly", chance = 40}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -800, maxDamage = -1000},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -750, maxDamage = -1650, range = 7, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true}
}

monster.defenses = {
	defense = 68,
	armor = 72,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false}
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

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end


mType:register(monster)
