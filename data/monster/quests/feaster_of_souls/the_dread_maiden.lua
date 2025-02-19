local mType = Game.createMonsterType("The Dread Maiden")
local monster = {}

monster.description = "The Dread Maiden"
monster.experience = 99400
monster.outfit = {
	lookType = 1278,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 47000
monster.maxHealth = 47000
monster.race = "undead"
monster.corpse = 37580
monster.speed = 500
monster.manaCost = 0
monster.maxSummons = 0


monster.events = {
	"theDreadMaidenHealth",
}

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
	{name = "amber with a dragonfly", chance = 3920},
	{name = "ghost claw", chance = 1960},
	{name = "dark bell", chance = 1500},
	{name = "pair of nightmare boots", chance = 150},
	{name = "spooky hood", chance = 150}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2000},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -1000, radius = 4, effect = CONST_ME_SMALLCLOUDS, shootEffect = CONST_ANI_SUDDENDEATH, target = true},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -230, maxDamage = -700, length = 7, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -1000, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="thedreadmaidenblood", interval = 2000, chance = 8, minDamage = -300, maxDamage = -800, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 82,
	{name ="summonsthedreadmaiden", interval = 8000, chance = 100, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 60},
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 60},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
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
