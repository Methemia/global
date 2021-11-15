local mType = Game.createMonsterType("King Zelos")
local monster = {}

monster.description = "King Zelos"
monster.experience = 250000
monster.outfit = {
	lookType = 1224,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.events = {
	"king_zelos"
}

monster.health = 250000
monster.maxHealth = 250000
monster.race = "undead"
monster.corpse = 36446
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 85,
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
	{text = "Do you dare challenge the king of the lich knights?! Fine then, die!", yell = false}
}

monster.loot = {
	{name = "silver token", chance = 100000, maxCount = 4},
	{name = "gold token", chance = 100000, maxCount = 3},
	{name = "ultimate mana potion", chance = 61110, maxCount = 20},
	{name = "ultimate spirit potion", chance = 50000, maxCount = 2},
	{name = "yellow gem", chance = 50000},
	{name = "platinum coin", chance = 44440, maxCount = 5},
	{name = "green gem", chance = 38890},
	{name = "supreme health potion", chance = 38890, maxCount = 20},
	{name = "red gem", chance = 33330},
	{name = "mastermind potion", chance = 27780, maxCount = 10},
	{name = "crystal coin", chance = 27780},
	{name = "bullseye potion", chance = 22220, maxCount = 10},
	{id = 26199, chance = 22220},
	{name = "flask of warrior's sweat", chance = 22220},
	{name = "crusader helmet", chance = 16670},
	{name = "berserk potion", chance = 16670},
	{name = "piece of hell steel", chance = 11110, maxCount = 4},
	{name = "terra hood", chance = 11110},
	{name = "blue gem", chance = 11110},
	{id = 26198, chance = 11110},
	{name = "ancient liche bone", chance = 9560},
	{name = "chaos mace", chance = 5560},
	{name = "young lich worm", chance = 6560},
	{name = "giant sapphire", chance = 5560},
	{id = 26189, chance = 5560},
	{id = 26187, chance = 5560},
	{name = "rotten heart", chance = 6000},
	{name = "toga mortis", chance = 100},
	{name = "galea mortis", chance = 100},
	{name = "mortal mace", chance = 100},
	{name = "bow of cataclysm", chance = 100},
	{name = "golden hyena pendant", chance = 500},
	{name = "holy icon", chance = 650},
	{name = "final judgement", chance = 200},
	{name = "shadow cowl", chance = 200}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -700, effect = CONST_ME_DRAWBLOOD},
	{name ="Sudden Death", interval = 3000, chance = 33, minDamage = -600, maxDamage = -800, target = true},
	{name ="zelosexpandingring", interval = 10000, chance = 40, target = false},
	{name ="greathexbeam", interval = 8000, chance = 60, target = false},
}

monster.defenses = {
	defense = 5,
	armor = 4,
	{name ="summonszelos", interval = 6000, chance = 100, target = false},
	{name ="combat", interval = 3000, chance = 35, minDamage = 1000, maxDamage = 5000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = -7},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
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
