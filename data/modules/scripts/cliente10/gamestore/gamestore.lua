--[[
Items have been updated so that if the offer type is not one of the types: OFFER_TYPE_OUTFIT, OFFER_TYPE_OUTFIT_ADDON,
OFFER_TYPE_MOUNT, OFFER_TYPE_NAMECHANGE, OFFER_TYPE_SEXCHANGE, OFFER_TYPE_PROMOTION, OFFER_TYPE_EXPBOOST,
OFFER_TYPE_PREYSLOT, OFFER_TYPE_PREYBONUS, OFFER_TYPE_TEMPLE, OFFER_TYPE_BLESSINGS, OFFER_TYPE_PREMIUM,
OFFER_TYPE_ALLBLESSINGS
]]
-- Parser
dofile("data/modules/scripts/gamestore/init.lua")
-- Config

HomeBanners = {
    images = { "home/banner_cunninghyaena.png", "home/banner_jousters.png" },
    delay = 10
}

GameStore.Categories = {
    {
        --Premium Time
        icons = {"Category_PremiumTime.png"},
        name = "Extra Services",
        rookgaard = true,
        state = GameStore.States.STATE_NONE,
        offers = {
            {name = "Protect Ring", itemtype = 13826, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 60, icons = {"StarRing.png"}, description = "Arm:1, critical hit chance +2%, critical hit damage +2%."},
            {name = "Small Stamina refill - 2 hours", itemtype = 38763, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 15, icons = {"Bottle_of_Tibian_Wine.png"}, description = "2 hours stamina."},	
            {name = "Stamina refill", itemtype = 38762, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 60, icons = {"38762.png"}, description = "full stamina."},	
            {name = "Loot Backpack", itemtype = 40412, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 150, icons = {"backpack.png"}, description = "100 slots."},	
           		{name = "Gold token", itemtype = 25377, count = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 50, icons = {"goldtoken.png"}, description = "50 Gold token"},
			{name = "Silver token", itemtype = 25172, count = 100, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 50, icons = {"silvertoken.png"}, description = "100 Silver token"},
			{name = "Skull Remover", price = 70, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, itemtype = 9969, count = 1, icons = {"blackskull.png"}, description = "skull remover."},
			{name = "Hexoria Boots", price = 75, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, itemtype = 2358, count = 1, icons = {"Soft boots.png"}, description = "Fast Regeneration."},
			{name = "Addon Doll", price = 60, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, itemtype = 24808, count = 1, icons = {"24807.png"}, description = "1 Addon. - !addondoll name"},
			{name = "Character Name Change", type = GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE, price = 25, icons = {"Name_Change.png"}, description = "Change your name."},
			{name = "Character Sex Change", type = GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE, price = 25, icons = {"Sex_Change.png"}, description = "Change your sex."},
			{name = "XP Boost 50% (1 hora)", type = GameStore.OfferTypes.OFFER_TYPE_EXPBOOST, price = 30, icons = {"XP_Boost.png"}, description = "Bonus experience."},
			{name = "Charm Expansion", type = GameStore.OfferTypes.OFFER_TYPE_CHARMS, price = 100, id = 65005, icons = {"Charm_Expansion_Offer.png"}, description = "charm expansion."},
			{name = "25x Prey Bonus Reroll", count = 25, type = GameStore.OfferTypes.OFFER_TYPE_PREYBONUS, price = 30, icons = {"Prey_Bonus_Reroll.png"}, description = "Prey re roll."},
			{name = "Permanent Prey Slot", id = 65008, type = GameStore.OfferTypes.OFFER_TYPE_PREYSLOT, price = 100, icons = {"Permanent_Prey_Slot.png"}, description = "last Prey slot."},
        }
    },
    {

        icons = {"Category_Consumables.png"},
        name = "Consumibles",
        rookgaard = true,
        subclasses = {"Potions - Runes", "Exercise Training and skill"}
    },
    -- Blessings
    {
        icons = {"Category_Blessings.png"},
        name = "Potions - Runes",
        parent = "Consumibles",
        rookgaard = true,
        state = GameStore.States.STATE_NONE,
        offers = {
            {
                
			name = "Health Potion", itemtype = 7618, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"Product_Potion_HealthPotion.png"}, description = "pronto."},
			{name = "Strong Health Potion", itemtype = 7588, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"Product_Potion_StrongHealthPotion.png"}, description = "pronto."},
			{name = "Great Health Potion", itemtype = 7591, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"ProductPotionGreatHealtPotion.png"}, description = "pronto."},
			{name = "Ultimate Health Potion", itemtype = 8473, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"ProductPotionUltimateHealthPotion.png"}, description = "pronto."},
			{name = "Supreme Health Potion", itemtype = 26031, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"ProductPotionSupremeHealtPotion.png"}, description = "pronto."},
			{name = "Mana Potion", itemtype = 7620, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"Product_Potion_ManaPotion.png"}, description = "pronto."},
		  	  {name = "Strong Mana Potion", itemtype = 7589, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"ProductPotionStrongManaPotion.png"}, description = "pronto."},
		    {name = "Great Mana Potion", itemtype = 7590, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"ProductPotionGreatManaPotion.png"}, description = "pronto."},
			{name = "Ultimate Mana Potion", itemtype = 26029, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"ProductPotionUltimateManaPotion.png"}, description = "pronto."},
			{name = "Great Spirit Potion", itemtype = 8472, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"ProductPotionGreatSpiritPotion.png"}, description = "pronto."},
			{name = "Ultimate Spirit Potion", itemtype = 26030, count = 300, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 10, icons = {"ProductPotionUltimateSpiritPotion.png"}, description = "pronto."},
			{name = "Animate Dead Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2316, count = 300, icons = {"Product_Rune_AnimateDeadRune.png"}, description = "pronto."},
			{name = "Avalanche Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2274, count = 300, icons = {"Product_Rune_AvalancheRune.png"}, description = "pronto."},
			{name = "Chameleon Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2291, count = 300, icons = {"Product_Rune_ChameleonRune.png"}, description = "pronto."},
			{name = "Convince Creature Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2290, count = 300, icons = {"Product_Rune_ConvinceRune.png"}, description = "pronto."},
			{name = "Cure Poison Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2266, count = 300, icons = {"Product_Rune_CurePoisonRune.png"}, description = "pronto."},
			{name = "Disintegrate Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2310, count = 300, icons = {"Product_Rune_DisintegrateRune.png"}, description = "pronto."},
			{name = "Energy Bomb Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2262, count = 300, icons = {"Product_Rune_EnergyBombRune.png"}, description = "pronto."},
			{name = "Energy Field Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2277, count = 300, icons = {"Product_Rune_EnergyFieldRune.png"}, description = "pronto."},
			{name = "Energy Wall Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2279, count = 300, icons = {"Product_Rune_EnergyWallRune.png"}, description = "pronto."},
			{name = "Explosion Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2313, count = 300, icons = {"Product_Rune_ExplosionRune.png"}, description = "pronto."},
			{name = "Fireball Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2302, count = 300, icons = {"Product_Rune_FireballRune.png"}, description = "pronto."},
			{name = "Fire Bomb Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2305, count = 300, icons = {"Product_Rune_FireBombRune.png"}, description = "pronto."},
			{name = "Fire Field Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2301, count = 300, icons = {"Product_Rune_FireFieldRune.png"}, description = "pronto."},
			{name = "Fire Wall Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2303, count = 300, icons = {"Product_Rune_FireWallRune.png"}, description = "pronto."},
			{name = "Great Fireball Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2304, count = 300, icons = {"Product_Rune_GreatFireBallRune.png"}, description = "pronto."},
			{name = "Icicle Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2271, count = 300, icons = {"Product_Rune_IcicleRune.png"}, description = "pronto."},
			{name = "Intense Healing Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2265, count = 300, icons = {"Product_Rune_IntenseHealingRune.png"}, description = "pronto."},
			{name = "Magic Wall Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2293, count = 300, icons = {"Product_Rune_MagicWallRune.png"}, description = "pronto."},
			{name = "Paralyse Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2278, count = 300, icons = {"Product_Rune_ParalyseRune.png"}, description = "pronto."},
			{name = "Poison Bomb Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2286, count = 300, icons = {"Product_Rune_PoisonBombRune.png"}, description = "pronto."},
			{name = "Poison Wall Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2289, count = 300, icons = {"Product_Rune_PoisonWallRune.png"}, description = "pronto."},
			{name = "Soulfire Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2308, count = 300, icons = {"Product_Rune_SoulfireRune.png"}, description = "pronto."},
			{name = "Stone Shower Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2288, count = 300, icons = {"Product_Rune_StoneShowerRune.png"}, description = "pronto."},
			{name = "Sudden Death Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2268, count = 300, icons = {"Product_Rune_SuddenDeathRune.png"}, description = "pronto."},
			{name = "Thunderstorm Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2315, count = 300, icons = {"Product_Rune_ThunderstormRune.png"}, description = "pronto."},
			{name = "Ultimate Healing Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2273, count = 300, icons = {"Product_Rune_UltimateHealingRune.png"}, description = "pronto."},
			{name = "Wild Growth Rune", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2269, count = 300, icons = {"Product_Rune_WildGrowthRune.png"}, description = "pronto."},
		

		---		{name = "Health Keg", itemtype = 28579, count = 500, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 23, icons = {"Product_Potion_HealthPotionKeg.png"}, description = "pronto."},
		---		{name = "Strong Health Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28580, count = 500, icons = {"Strong_Health_Keg.png"}, description = "pronto."},
		---		{name = "Great Health Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28581, count = 500, icons = {"Strong_Health_Keg.png"}, description = "pronto."},
		---		{name = "Ultimate Health Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28582, count = 500, icons = {"Ultimate_Health_Keg.png"}, description = "pronto."},
		---		{name = "Supreme Health Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28583, count = 500,  icons = {"Supreme_Health_Keg.png"}, description = "pronto."},
		---		{name = "Mana Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28584, count = 500, icons = {"Mana_Keg.png"}, description = "pronto."},
		---		{name = "Strong Mana Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28585, count = 500, icons = {"Strong_Mana_Keg.png"}, description = "pronto."},
		---		{name = "Great Mana Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28586, count = 500, icons = {"Great_Mana_Keg.png"}, description = "pronto."},
		---		{name = "Ultimate Mana Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28587, count = 500, icons = {"Ultimate_Mana_Keg.png"}, description = "pronto."},
		---		{name = "Ultimate Spirit Keg", type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 15, itemtype = 28590, count = 500, icons = {"Ultimate_Ultimate_Spirit_Keg.png"}, description = "pronto."},
		---		{name = "Health Cask", itemtype = 28555, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 4, icons = {"Health_Cask.png"}, description = "pronto."},
		---		{name = "Strong Health Cask", itemtype = 28556, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 9, icons = {"Strong_Health_Cask.png"}, description = "pronto."},
		---		{name = "Great Health Cask", itemtype = 28557, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 18, icons = {"Great_Health_Cask.png"}, description = "pronto."},
		---		{name = "Ultimate Health Cask", itemtype = 28558, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 29, icons = {"Ultimate_Health_Cask.png"}, description = "pronto."},
		---		{name = "Supreme Health Cask", itemtype = 28559, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 47, icons = {"Supreme_Health_Cask.png"}, description = "pronto."},
		---		{name = "Mana Cask", itemtype = 28565, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 4, icons = {"Mana_Cask.png"}, description = "pronto."},
		---		{name = "Strong Mana Cask", itemtype = 28566, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 7, icons = {"Strong_Mana_Cask.png"}, description = "pronto."},
		---		{name = "Great Mana Cask", itemtype = 28567, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 11, icons = {"Great_Mana_Cask.png"}, description = "pronto."},
		---		{name = "Ultimate Mana Cask", itemtype = 28568, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 33, icons = {"Ultimate_Mana_Cask.png"}, description = "pronto."},
		---		{name = "Great Spirit Cask", itemtype = 28576, count = 1000, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 18, icons = {"Great_Spirit_Cask.png"}, description = "pronto."},
		}

        
    },
    -- Exercise Weapons
    {
        icons = {"Category_ExerciseWeapons.png"},
        name = "Exercise Training and skill",
        parent = "Consumibles",
        rookgaard = true,
        state = GameStore.States.STATE_NONE,
        offers = {
            {
                name = "Demon Exercise Dummy",
                price = 90,
                itemtype = 32145,
                count = 1,
 		icons = {"Demon_Exercise_Dummy.png"},

                description = "<i>Train your skills more effectively at home than in public on this expert exercise dummy!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{info} can only be used by one character at a time\n{useicon} use one of the exercise weapons on this dummy\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE},
                     
                {name = "Ferumbras Exercise Dummy",
                price = 90,
                itemtype = 32143,
                count = 1,
		icons = {"Ferumbras_Exercise_Dummy.png"},
                description = "<i>Train your skills more effectively at home than in public on this expert exercise dummy!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{info} can only be used by one character at a time\n{useicon} use one of the exercise weapons on this dummy\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE},

               {name = "Monk Exercise Dummy",
                price = 50,
                itemtype = 32147,
                count = 1,
icons = {"Monk_Exercise_Dummy.png"},

                description = "<i>Train your skills more effectively at home than in public on this expert exercise dummy!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{info} can only be used by one character at a time\n- use one of the exercise weapons on this dummy\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE},


		{name = "Exercise Axe",
                price = 7,
                itemtype = 32385,
                charges = 500,
		icons = {"Exercise_Axe.png"},
                description = "<i>Use it to train your axe fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your axe fighting skill\n{info} usable 500 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                        {name = "Exercise Bow",
                price = 7,
                itemtype = 32387,
                CHARGES = 500,
                icons = {"Exercise_Bow.png"},            
	  description = "<i>Use it to train your distance fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your distance fighting skill\n{info} usable 500 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                {name = "Exercise Club",
                price = 7,
                itemtype = 32386,
                CHARGES = 500,
icons = {"Exercise_Club.png"},
                description = "<i>Use it to train your club fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your club fighting skill\n{info} usable 500 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                {name = "Exercise Rod",
                price = 7,
                itemtype = 32388,
                charges = 500,
  icons = {"Exercise_Rod.png"},
                description = "<i>Use it to train your magic level on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your magic level\n{info} usable 500 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                          
                {name = "Exercise Sword",
                price = 7,
                itemtype = 32384,
                charges = 500,
  icons = {"Exercise_Sword.png"},
                description = "<i>Use it to train your sword fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your sword fighting skill\n{info} usable 500 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
           
                {name = "Exercise Wand",
                price = 7,
                itemtype = 32389,
                charges = 500,
   icons = {"Exercise_Wand.png"},
                          
   description = "<i>Use it to train your magic level on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your magic level\n{info} usable 500 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
            
                {name = "Durable Exercise Axe",
                price = 15,
                itemtype = 40115,
                charges = 1800,
   icons = {"Exercise_Axe.png"},
                          
   description = "<i>Use it to train your axe fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your axe fighting skill\n{info} usable 1800 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                           
                {name = "Durable Exercise Bow",
                price = 15,
                itemtype = 40117,
                charges = 1800,
 icons = {"Exercise_Bow.png"},
                description = "<i>Use it to train your distance fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your distance fighting skill\n{info} usable 1800 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
            
                                {name = "Durable Exercise Club",
                price = 15,
                itemtype = 40116,
                charges = 1800,
icons = {"Exercise_Club.png"},

                description = "<i>Use it to train your club fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your club fighting skill\n{info} usable 1800 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                           
                {name = "Durable Exercise Rod",
                price = 15,
                itemtype = 40118,
                charges = 1800,
 icons = {"Exercise_Rod.png"},
                description = "<i>Use it to train your magic level on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your magic level\n{info} usable 1800 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                           
                {name = "Durable Exercise Sword",
                price = 15,
                itemtype = 40114,
                charges = 1800,
 icons = {"Exercise_Sword.png"},
                description = "<i>Use it to train your sword fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your sword fighting skill\n{info} usable 1800 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                           
                {name = "Durable Exercise Wand",
                price = 15,
                itemtype = 40119,
                charges = 1800,
 icons = {"Exercise_Wand.png"},
                description = "<i>Use it to train your magic level on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your magic level\n{info} usable 1800 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                            
                {name = "Lasting Exercise Axe",
                price = 75,
                itemtype = 40121,
                charges = 14400,
icons = {"Exercise_Axe.png"},
                description = "<i>Use it to train your axe fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your axe fighting skill\n{info} usable 14400 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                            
                {name = "Lasting Exercise Bow",
                price = 75,
                itemtype = 40123,
                charges = 14400,
icons = {"Exercise_Bow.png"},
                description = "<i>Use it to train your distance fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your distance fighting skill\n{info} usable 14400 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                            
                {name = "Lasting Exercise Club",
                price = 75,
                itemtype = 40122,
                charges = 14400,
icons = {"Exercise_Club.png"},
                description = "<i>Use it to train your club fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your club fighting skill\n{info} usable 14400 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                     
                {name = "Lasting Exercise Rod",
                price = 75,
                itemtype = 40124,
                charges = 14400,
       icons = {"Exercise_Rod.png"},
                description = "<i>Use it to train your magic level on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your magic level\n{info} usable 14400 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
                            
                {name = "Lasting Exercise Sword",
                price = 75,
                itemtype = 40120,
                charges = 14400,
icons = {"Exercise_Sword.png"},
                description = "<i>Use it to train your sword fighting skill on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your sword fighting skill\n{info} usable 14400 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES},
            
                                {name = "Lasting Exercise Wand",
                price = 75,
                itemtype = 40125,
                charges = 14400,
icons = {"Exercise_Wand.png"},

                description = "<i>Use it to train your magic level on an exercise dummy!</i>\n\n{character}\n{storeinbox}\n{info} use it on an exercise dummy to train your magic level\n{info} usable 14400 times a piece",
                type = GameStore.OfferTypes.OFFER_TYPE_CHARGES
					}
        }
    },
    {
        icons = {"Category_Consumables.png"},
        name = "Equipaments",
        rookgaard = true,
        subclasses = {"Armors - Legs", "Helmets - Shields - Legs", "Weapons Knight", "Weapons Paladin", "Weapons Mage"}
    },
    -- Blessings
    {
        icons = {"Category_Blessings.png"},
        name = "Armors - Legs",
        parent = "Equipaments",
        rookgaard = true,
        state = GameStore.States.STATE_NONE,
        offers = {
            {
                
			name = "Gnome Armor", price = 80, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 30883, count = 1, icons = {"Gnome Armor.png"}, description = "pronto."},
	        	{name = "Demon armor", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2494, count = 1, icons = {"Demon armor.png"}, description = "pronto."},
			{name = "Earthborn titan armor", price = 40, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 8882, count = 1, icons = {"Earthborn titan armor.png"}, description = "pronto."},
			{name = "windborn colossus armor", price = 40, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 8883, count = 1, icons = {"windborn colossus armor.png"}, description = "pronto."},
			{name = "fireborn giant armor", price = 40, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 8881, count = 1, icons = {"fireborn giant armor.png"}, description = "pronto."},
			{name = "master archer's armor", price = 40, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 8888, count = 1, icons = {"master archers armor.png"}, description = "pronto."},
			{name = "royal draken mail", price = 25, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 12642, count = 1, icons = {"royal draken mail.png"}, description = "pronto."},
			{name = "royal scale robe", price = 25, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 12643, count = 1, icons = {"royal scale robe.png"}, description = "pronto."},
			{name = "prismatic armor", price = 20, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18404, count = 1, icons = {"prismatic armor.png"}, description = "pronto."},
			{name = "depth lorica", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 15407, count = 1, icons = {"depth lorica.png"}, description = "pronto."},
			{name = "ornate chestplate", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 15406, count = 1, icons = {"ornate chestplate.png"}, description = "pronto."},
			{name = "Dwarven armor", price = 75, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2503, count = 1, icons = {"dwarven armor.png"}, description = "pronto."},
		    {name = "Gnome Legs", price = 90, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 30884, count = 1, icons = {"Gnome Legs.png"}, description = "pronto."},
	      		  {name = "Demon legs", price = 15, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2495, count = 1, icons = {"Demon legs.png"}, description = "pronto."},
			{name = "Grasshopper legs", price = 25, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 15490, count = 1, icons = {"Grasshopper legs.png"}, description = "pronto."},
			{name = "depth ocrea", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 15409, count = 1, icons = {"depth ocrea.png"}, description = "pronto."},
			{name = "prismatic legs", price = 20, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18405, count = 1, icons = {"prismatic legs.png"}, description = "pronto."},
			{name = "gill legs", price = 40, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18400, count = 1, icons = {"gill legs.png"}, description = "pronto."},
			{name = "ornate legs", price = 30, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 15412, count = 1, icons = {"ornate legs.png"}, description = "pronto."},
			{name = "dwarven legs", price = 75, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2504, count = 1, icons = {"dwarven legs.png"}, description = "pronto."
            
        }
}
    },
    -- Casks
    {
        icons = {"Category_Casks.png"},
        name = "Helmets - Shields - Boots",
        parent = "Equipaments",
        rookgaard = true,
        state = GameStore.States.STATE_NONE,
        offers = {
            {name = "Depth galea", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, itemtype = 15651, count = 1, icons = {"Depth galea.png"}, description = "pronto."},
		{name = "Elite draken helmet", price = 30, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, itemtype = 12645, count = 1, icons = {"Elite draken helmet.png"}, description = "pronto."},
		{name = "Gill gugel", price = 40, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18398, count = 1, icons = {"Gill gugel.png"}, description = "pronto."},
		{name = "Prismatic helmet", price = 25, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18403, count = 1, icons = {"Prismatic helmet.png"}, description = "pronto."},
		{name = "Yalahari mask", price = 25, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 9778, count = 1, icons = {"Yalahari mask.png"}, description = "pronto."},
		{name = "Gnome helmet", price = 95, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 30882, count = 1, icons = {"Gnome Helmet.png"}, description = "pronto."},
		{name = "Dwarven helmet", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2502, count = 1, icons = {"dwarven helmet.png"}, description = "pronto."},
		{name = "Werewolf Helmet", price = 100, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 24718, count = 1, icons = {"dwarven helmet.png"}, description = "pronto."},
	        {name = "Soft boots", price = 15, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 2640, count = 1, icons = {"Soft boots.png"}, description = "pronto."},
		{name = "Depth calcei", price = 15, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 15410, count = 1, icons = {"Soft boots.png"}, description = "pronto."},
	        {name = "Depth scutum", price = 15, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 15411, count = 1, icons = {"Depth scutum.png"}, description = "pronto."},
	        {name = "Shield of corruption", price = 15, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 12644, count = 1, icons = {"Shield of corruption.png"}, description = "pronto."},
	        {name = "Ornate shield", price = 35, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 15413, count = 1, icons = {"Ornate shield.png"}, description = "pronto."},
	        {name = "prismatic shield", price = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18410, count = 1, icons = {"prismatic shield.png"}, description = "pronto."},
	        {name = "spellbook of vigilance", price = 25, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18401, count = 1, icons = {"spellbook of vigilance.png"}, description = "pronto."},
	        {name = "umbral spellbook", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22423, count = 1, icons = {"umbral spellbook.png"}, description = "pronto."},
		  {name = "gnome shield", price = 80, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 30885, count = 1, icons = {"gnome shield.png"}, description = "pronto."
			}
        }
    },
    -- Exercise Weapons
    {
        icons = {"Category_ExerciseWeapons.png"},
        name = "Weapons Knight",
        parent = "Equipaments",
        rookgaard = true,
        state = GameStore.States.STATE_NONE,
        offers = {
            {
                name = "Shiny Blade", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18465, count = 1, icons = {"Shiny Blade.png"}, description = "pronto."},
	        {name = "Crystalline axe", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18451, count = 1, icons = {"Crystalline axe.png"}, description = "pronto."},
	        {name = "Mycological mace", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18452, count = 1, icons = {"Mycological mace.png"}, description = "pronto."},
	        {name = "umbral axe", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22405, count = 1, icons = {"umbral axe.png"}, description = "pronto."},
	        {name = "umbral chopper", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22408, count = 1, icons = {"umbral chopper.png"}, description = "pronto."},
	        {name = "umbral blade", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22399, count = 1, icons = {"umbral blade.png"}, description = "pronto."},
	        {name = "umbral slayer", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22402, count = 1, icons = {"umbral slayer.png"}, description = "pronto."},
	        {name = "umbral mace", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22411, count = 1, icons = {"umbral mace.png"}, description = "pronto."},
	        {name = "umbral hammer", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22414, count = 1, icons = {"umbral hammer.png"}, description = "pronto."},
	        {name = "Gnome shield", price = 80, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 30885, count = 1, icons = {"gnome shield.png"}, description = "pronto."},
   	        {name = "Gnome Sword", price = 80, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 30886, count = 1, icons = {"gnome sword.png"}, description = "pronto."
 }
        }
    },
    -- Kegs
    {
        icons = {"Category_Kegs.png"},
        name = "Weapons Mage",
        parent = "Equipaments",
        rookgaard = true,
        state = GameStore.States.STATE_NONE,
        offers = {
            {
               
		name = "Glacial rod", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18412, count = 1, icons = {"Glacial rod.png"}, description = "pronto."},
	        {name = "Muck rod", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18411, count = 1, icons = {"Muck rod.png"}, description = "pronto."},
	        {name = "Wand of everblazing", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 18409, count = 1, icons = {"Wand of everblazing.png"}, description = "pronto."},
	        {name = "Gnome Legs", price = 90, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, itemtype = 30884, count = 1, icons = {"Gnome Legs.png"}, description = "pronto."},
	        {name = "Gnome helmet", price = 95, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, itemtype = 30882, count = 1, icons = {"Gnome Helmet.png"}, description = "pronto."

 }
        }
    },
    -- Kegs
    {
        icons = {"Category_Kegs.png"},
        name = "Weapons Paladin",
        parent = "Equipaments",
        rookgaard = true,
        state = GameStore.States.STATE_NONE,
        offers = {
            {
               name = "Thorn spitter", price = 35, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 16111, count = 1, icons = {"Thorn spitter.png"}, description = "pronto."},
	        {name = "umbral bow", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22417, count = 1, icons = {"umbral bow.png"}, description = "pronto."},
	        {name = "umbral crossbow", price = 50, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 22420, count = 1, icons = {"umbral crossbow.png"}, description = "pronto."},
		{name = "Gnome Armor", price = 80, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 30883, count = 1, icons = {"Gnome Armor.png"}, description = "pronto."},
   	        {name = "Gnome shield", price = 80, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, itemtype = 30885, count = 1, icons = {"gnome shield.png"}, description = "pronto."},


			}
	},
	{

		name = "Mounts",
		state = GameStore.States.STATE_NONE,
		icons = {"Category_Mounts.png"},
		description = "Buy your character one or more of the fabolous Mounts offered here.",
		rookgaard = true,
		offers = {
			{name = "Armoured War Horse", id = 23, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Armouredwarhorse.png"}, description = "pronto."},
			{name = "Shadow Draptor", id = 24, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"shadowdraptor.png"}, description = "pronto."},
			{name = "Steelbeak", id = 34, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"steelbeak.png"}, description = "pronto."},
			{name = "Blazing Unicorn", id = 113, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"BlazingUnicorn.png"}, description = "pronto."},
			{name = "Artic Unicorn", id = 114, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"ArticUnicorn.png"}, description = "pronto."},
			{name = "Prismatic Unicorn", id = 115, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"PrismaticUnicorn.png"}, description = "pronto."},
			{name = "Crimson Ray", id = 33, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"crimsonray.png"}, description = "pronto."},
			{name = "Jungle Saurian", id = 110, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"junglesaurian.png"}, description = "pronto."},
			{name = "Ember Saurian", id = 111, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"embersaurian.png"}, description = "pronto."},
			{name = "Lagoon Saurian", id = 112, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"lagoonsaurian.png"}, description = "pronto."},
			{name = "Gold Sphinx", id = 107, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"goldsphinx.png"}, description = "pronto."},
			{name = "Emerald Sphinx", id = 108, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"emeraldsphinx.png"}, description = "pronto."},
			{name = "Shadow Sphinx", id = 109, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"shadowsphinx.png"}, description = "pronto."},
			{name = "Tombstinger", id = 36, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Tombstinger.png"}, description = "pronto."},
			{name = "Desert King", id = 41, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"DesertKing.png"}, description = "pronto."},
			{name = "Death Crawler", id = 46, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"DeathCrawler.png"}, description = "pronto."},
			{name = "Flamesteed", id = 47, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Flamesteed.png"}, description = "pronto."},
			{name = "Jade Lion", id = 48, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"JadeLion.png"}, description = "pronto."},
			{name = "Jade Pincer", id = 49, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"JadePincer.png"}, description = "pronto."},
			{name = "Nethersteed", id = 50, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Nethersteed.png"}, description = "pronto."},
			{name = "Tempest", id = 51, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Tempest.png"}, description = "pronto."},
			{name = "Winter King", id = 52, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"WinterKing.png"}, description = "pronto."},
			{name = "Doombringer", id = 53, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Doombringer.png"}, description = "pronto."},
			{name = "Woodland Prince", id = 54, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"WoodlandPrince.png"}, description = "pronto."},
			{name = "Hailtorm Fury", id = 55, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"HailtormFury.png"}, description = "pronto."},
			{name = "Siegebreaker", id = 56, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Siegebreaker.png"}, description = "pronto."},
			{name = "Poisonbane", id = 57, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Poisonbane.png"}, description = "pronto."},
			{name = "Blackpelt", id = 58, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"blackpelt.png"}, description = "pronto."},
			{name = "Golden Dragonfly", id = 59, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"GoldenDragonfly.png"}, description = "pronto."},
			{name = "Steel Bee", id = 60, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"SteelBee.png"}, description = "pronto."},
			{name = "Copper Fly", id = 61, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"CopperFly.png"}, description = "pronto."},
			{name = "Tundra Rambler", id = 62, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"TundraRambler.png"}, description = "pronto."},
			{name = "Highland Yak", id = 63, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"HighlandYak.png"}, description = "pronto."},
			{name = "Glacier Vagabond", id = 64, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"GlacierVagabond.png"}, description = "pronto."},
			{name = "Flying Divan", id = 65, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"FlyingDivan.png"}, description = "pronto."},
			{name = "Magic Carpet", id = 66, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"magic_carpet.png"}, description = "pronto."},
			{name = "Floating Kashmir", id = 67, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"FloatingKashmir.png"}, description = "pronto."},
			{name = "Ringtail Waccoon", id = 68, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"RingtailWaccoon.png"}, description = "pronto."},
			{name = "Night Waccoon", id = 69, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"NightWaccoon.png"}, description = "pronto."},
			{name = "Emerald Waccoon", id = 70, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"EmeraldWaccoon.png"}, description = "pronto."},
			{name = "Shadow Hart", id = 72, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"ShadowHart.png"}, description = "pronto."},
			{name = "Black Stag", id = 73, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"blackstag.png"}, description = "pronto."},
			{name = "Emperor Deer", id = 74, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"EmperorDeer.png"}, description = "pronto."},
			{name = "Flitterkatzen", id = 75, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Flitterkatzen.png"}, description = "pronto."},
			{name = "Venompaw", id = 76, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Venompaw.png"}, description = "pronto."},
			{name = "Batcat", id = 77, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"BatCat.png"}, description = "pronto."},
			{name = "Sea Devil", id = 78, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"SeaDevil.png"}, description = "pronto."},
			{name = "Coralripper", id = 79, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Coralripper.png"}, description = "pronto."},
			{name = "Plumfish", id = 80, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Plumfish.png"}, description = "pronto."},
			{name = "Gorongra", id = 81, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Gorongra.png"}, description = "pronto."},
			{name = "Noctungra", id = 82, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Noctungra.png"}, description = "pronto."},
			{name = "Silverneck", id = 83, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Silverneck.png"}, description = "pronto."},
			{name = "Slagsnare", id = 84, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Slagsnare.png"}, description = "pronto."},
			{name = "Nightstinger", id = 85, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Nightstinger.png"}, description = "pronto."},
			{name = "Razorcreep", id = 86, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Razorcreep.png"}, description = "pronto."},
			{name = "Nightdweller", id = 88, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Nightdweller.png"}, description = "pronto."},
			{name = "Frostflare", id = 89, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Frostflare.png"}, description = "pronto."},
			{name = "Cinderhoof", id = 90, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Cinderhoof.png"}, description = "pronto."},
			{name = "Mouldpincer", id = 91, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Mouldpincer.png"}, description = "pronto."},
			{name = "Bloodcurl", id = 92, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"bloodcurl.png"}, description = "pronto."},
			{name = "Leafscuttler", id = 93, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Leafscuttler.png"}, description = "pronto."},
			{name = "Swamp Snapper", id = 95, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"SwampSnapper.png"}, description = "pronto."},
			{name = "Mould Shell", id = 96, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"MouldShell.png"}, description = "pronto."},
			{name = "Reed Lurker", id = 97, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"ReedLurker.png"}, description = "pronto."},
			{name = "Ivory Fang", id = 100, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"ivoryfang.png"}, description = "pronto."},
			{name = "Shadow Claw", id = 101, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"shadowclaw.png"}, description = "pronto."},
			{name = "Snow Pelt", id = 102, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"snowpelt.png"}, description = "pronto."},
			{name = "Cave Tarantula", id = 102, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"CaveTarantula.png"}, description = "pronto."},
			{name = "Gloom Widow", id = 102, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"GloomWidow.png"}, description = "pronto."},
			{name = "Cranium Spider", id = 102, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"CraniumSpider.png"}, description = "pronto."},
			{name = "Marsh Toad", id = 120, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Green Flog.png"}, description = "pronto."},
			{name = "Sanguine Flog", id = 121, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Pink Flog.png"}, description = "pronto."},
			{name = "Toxic Flog", id = 122, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Blue Flog.png"}, description = "pronto."},
			{name = "Mole", id = 119, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 40, icons = {"Mole.png"}, description = "pronto."},

		}
	},
	{

		name = "Outfits",
		state = GameStore.States.STATE_NONE,
		description = "Buy your character one more of the classy outfits offered here.",
		icons = {"Category_Outfits.png"},
		rookgaard = true,
		offers = {
			{name = "Retro Citizen", sexId = {male = 974, female = 975}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_RetroCitizen_Male_Base.png"}, description = "outfit."},
			{name = "Retro Hunter", sexId = {male = 972, female = 973}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_RetroHunter_Male_Base.png"}, description = "outfit."},
			{name = "Retro Knight", sexId = {male = 970, female = 971}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_RetroKnight_Male_Base.png"}, description = "outfit."},
			{name = "Retro Wizzard", sexId = {male = 968, female = 969}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_RetroMage_Male_Base.png"}, description = "outfit."},
			{name = "Retro Noblewoman", sexId = {male = 966, female = 967}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_RetroNobleman_Male_Base.png"}, description = "full addon."},
			{name = "Retro Summoner", sexId = {male = 964, female = 965}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_RetroSummoner_Male_Base.png"}, description = "full addon."},
			{name = "Retro Warrior", sexId = {male = 962, female = 963}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_RetroWarrior_Male_Base.png"}, description = "full addon."},
			{name = "Full Arena Champion Outfit", sexId = { male = 884, female = 885 }, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_ArenaChampion_Male_Full.png"}, description = "full addon."},
			{name = "Full Philosopher Outfit", sexId = {male = 873, female = 874}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_Professor_Male_Full.png"}, description = "full addon."},
			{name = "Full Winter Warden Outfit", sexId = {male = 853, female = 852}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50,  icons = {"Product_Outfit_WinterWarden_Male_Full.png"}, description = "full addon."},
		  	{name = "Full Royal Pumpkin Outfit", sexId = {male = 760, female = 759}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_RoyalPumpkin_Male_Full.png"}, description = "full addon."},
			{name = "Full Sea Dog Outfit", sexId = {male = 750, female = 749}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_SeaDog_Male_Full.png"}, description = "full addon."},
			{name = "Full Champion Outfit", sexId = {male = 633, female = 632}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_Champion_Male_Full.png"}, description = "full addon."},
			{name = "Full Conjurer Outfit", sexId = {male = 634, female = 635}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_Conjurer_Male_Full.png"}, description = "full addon."},
			{name = "Full Beastmaster Outfit", sexId = {male = 637, female = 636}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_Beastmaster_Male_Full.png"}, description = "full addon."},
			{name = "Full Chaos Acolyte Outfit", sexId = {male = 665, female = 664}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_ChaosAcolyte_Male_Full.png"}, description = "full addon."},
			{name = "Full Death Herald Outfit", sexId = {male = 667, female = 666}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_DeathHerald_Male_Full.png"}, description = "full addon."},
			{name = "Full Ranger Outfit", sexId = {male = 684, female = 683}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_Ranger_Male_Full.png"}, description = "full addon."},
			{name = "Full Ceremonial Garb Outfit", sexId = {male = 695, female = 694}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_CeremonialGarb_Male_Full.png"}, description = "full addon."},
			{name = "Full Puppeteer Outfit", sexId = {male = 697, female = 696}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_Puppeteer_Male_Full.png"}, description = "full addon."},
			{name = "Full Spirit Caller Outfit", sexId = {male = 699, female = 698}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_SpiritCaller_Male_Full.png"}, description = "full addon."},
			{name = "Full Evoker Outfit", sexId = {male = 725, female = 724}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_Evoker_Male_Full.png"}, description = "full addon."},
			{name = "Full Seaweaver Outfit", sexId = {male = 733, female = 732}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_SeaWeaver_Male_Full.png"}, description = "full addon."},
			{name = "Full Pharaoh Outfit", sexId = {male = 955, female = 956}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Product_Outfit_Pharaoh_female_Full.png"}, description = "full addon."},
			{name = "Full Hunter", sexId = {male = 129, female = 137}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Hunteramle.png"}, description = "full addon."},
			{name = "Full Warrior", sexId = {male = 134, female = 142}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Warriormale.png"}, description = "full addon."},
			{name = "Full Barbarian", sexId = {male = 143, female = 147}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Barbarianmale.png"}, description = "full addon."},
			{name = "Full Druid", sexId = {male = 144, female = 148}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Druidmale.png"}, description = "full addon."},
			{name = "Full Assassin", sexId = {male = 152, female = 156}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"Assassinmale.png"}, description = "full addon."},
   			{name = "Full Elementalist", sexId = {male = 432, female = 433}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"magemale.png"}, description = "full addon."},
			{name = "Full Mouth Cape", sexId = {male = 1338, female = 1339}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 50, icons = {"mouthcape.png"}, description = "full addon."},

		}
	},


   --Tournament
   {
   icons = { "Category_Tournament.png" },
   name = "Client 12",
   rookgaard = true,
   subclasses = {"Exclusive Offers", "Houses", "Decorations", "Objects", "More Items", "Last Items"},
  },
  -- Tickets
	{
   icons = { "Category_Tickets.png" },
   parent = "Client 12", 
   name = "Exclusive Offers",
   rookgaard = true,
   offers = {
            {
                icons = {"Hireling_Male.png"},
                name = "Hireling Apprentice",
                price = 100,
                id = 28799,
                count = 1,
                number = 1,
                sexId = {female = 1107, male = 1108},
                description = "Get your very own hireling to serve you and your guests in your own four walls!\n\n{house} can only be unwrapped in a house owned by the purchasing character\n{boxicon} comes in a magic lamp which can only be used by purchasing character\n{storeinbox}\n{usablebyallicon} can be used by all characters that have access to the house\n{useicon} use the magic lamp to summon your hireling\n{backtoinbox}\n{info} maximum amount that can be owned by character: 10",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING
            },
            {
                icons = {"Hireling_Male.png"},
                name = "Hireling Name Change",
                price = 100,
                id = 28797,
                count = 1,
                number = 1,
                description = "{info} Change the name of one of your hirelings",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_NAMECHANGE
            },
{

                icons = {"Hireling_Male.png"},
                name = "Hireling Sex Change",
                price = 50,
                id = 28796,
                count = 1,
                number = 1,
                description = "{info} Change the sex of one of your hirelings",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_SEXCHANGE
            },
            {
                icons = {"Hireling_Cook.png"},
                name = "Hireling Cook",
                price = 100,
                id = HIRELING_STORAGE.SKILL + HIRELING_SKILLS.COOKING,
                count = 1,
                number = 1,
                description = "{info} Give your hirelings the ability to cook exclusive status enhancement and instant recovery meals!",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_SKILL
            },
            {
                icons = {"Hireling_Trader.png"},
                name = "Hireling Trader",
                price = 100,
                id = HIRELING_STORAGE.SKILL + HIRELING_SKILLS.TRADER,
                count = 1,
                number = 1,
                description = "{info} Give your hirelings the ability of trading several types of items, including equipment, tools, potions, runes, wands and rods.",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_SKILL
            },
            {
                icons = {"Hireling_Steward.png"},
                name = "Hireling Steward",
                price = 100,
                id = HIRELING_STORAGE.SKILL + HIRELING_SKILLS.STEWARD,
                count = 1,
                number = 1,
                description = "{info} Give your hirelings the ability to access and manage your stash at the confort of your from home",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_SKILL
            },
            {
                icons = {"Hireling_Banker.png"},
                name = "Hireling Banker",
                price = 100,
                id = HIRELING_STORAGE.SKILL + HIRELING_SKILLS.BANKER,
                count = 1,
                number = 1,
                description = "{info} Give your hirelings the ability of managing your banking business.",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_SKILL
},
            {
		 icons = {"Hireling_Banker.png"},
                name = "Banker Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.BANKER,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} colours can be changed using the Outfit dialog\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
            },
            {
                icons = {"Hireling_Trader.png"},
                name = "Trader Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.TRADER,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} colours can be changed using the Outfit dialog\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
            },
            {
                icons = {"Hireling_Cook.png"},
                name = "Cook Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.COOKING,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} colours can be changed using the Outfit dialog\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
            },
            {
                icons = {"Hireling_Steward.png"},
                name = "Steward Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.STEWARD,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} colours can be changed using the Outfit dialog\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
            },
            {
                icons = {"Hireling_Servant.png"},
                name = "Servant Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.SERVANT,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} colours can be changed using the Outfit dialog\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
            },
            {
                icons = {"Hireling_Hydra.png"},
                name = "Hydra Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.HYDRA,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
            },
            {
                icons = {"Hireling_Ferumbras.png"},
                name = "Ferumbras Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.FERUMBRAS,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
            },
            {
                icons = {"Hireling_Bonelord.png"},
                name = "Bonelord Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.BONELORD,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
            },
            {
                icons = {"Hireling_Dragon.png"},
                name = "Dragon Dress",
                price = 100,
                id = HIRELING_STORAGE.OUTFIT + HIRELING_OUTFITS.DRAGON,
                count = 1,
                number = 1,
                description = "{info} can only be used for hirelings of the purchasing character\n{activated}\n{info} the purchased dress can be used by all hirelings, however, how many hirelings can wear this outfit at the same time depends on the number of dresses you own\n{info} number that can be purchased depends on the amount of hirelings you own",
                type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_OUTFIT
     
      
        }, 
			},
 -- Exclusive Offers  
 }, { 
      icons = { "Category_ExclusiveOffers.png" },
      name = "Houses",
      parent = "Client 12", 
      rookgaard = true,
      state = GameStore.States.STATE_NONE,
      offers = {
        {
          icons = { "Cerberus_Champion.png" },
          name = "Cerberus Champion",
          price = 250,
          id = 146,
          description = "{info} usable by all characters of the account\n{speedboost}\n\n<i>A fierce and grim guardian of the underworld has risen to fight side by side with the bravest warriors in order to send evil creatures into the realm of the dead. The three headed Cerberus Champion is constantly baying for blood and using its sharp fangs it easily rips apart even the strongest armour and shield.",
          type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
        },
        {
          icons = { "Jousting_Eagle.png" },
          name = "Jousting Eagle",
          price = 250,
          id = 145,
          description = "{info} usable by all characters of the account\n{speedboost}\n\n<i>High above the clouds far away from dry land, the training of giant eagles takes place. Only the cream of the crop is able to survive in such harsh environment long enough to call themselves Jousting Eagles while the weaklings find themselves at the bottom of the sea. The tough ones become noble and graceful mounts that are well known for their agility and endurance.</i>",
          type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
        },
        {
          icons = { "Outfit_Lion_of_War_Male_Addon_3.png", "Outfit_Lion_of_War_Female_Addon_3.png" },
          name = "Full Lion of War Outfit",
          price = 250,
          sexId = {female = 1207, male = 1206},
          addon = 3,
          description = "{info} usable by all characters of the account\n{info} colours can be changed using the Outfit dialog\n{info} includes basic outfit and 2 addons which can be selected individually\n\n<i>The Lion of War has fought on countless battlefields and never lost once. Enemies tremble with fear when he batters his sword against his almighty shield. Realising that a Lion of War knows no mercy, his opponents often surrender before the battle even begins.</i>",
          type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
        },
        {
          icons = { "Outfit_Veteran_Paladin_Male_Addon_3.png", "Outfit_Veteran_Paladin_Female_Addon_3.png" },
          name = "Full Veteran Paladin Outfit",
          price = 250,
          sexId = {female = 1205, male = 1204},
          addon = 3,
          description = "{info} usable by all characters of the account\n{info} colours can be changed using the Outfit dialog\n{info} includes basic outfit and 2 addons which can be selected individually\n\n<i>A Veteran Paladin has mastered the art of distance fighting. No matter how far away his prey may be, a marksman like the Veteran Paladin will always hit with extraordinary precision. No one can escape his keen hawk-eyed vision and even small stones become deadly weapons in his hands.</i>",
          type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
        },
        {
          icons = { "Outfit_Void_Master_Male_Addon_3.png", "Outfit_Void_Master_Female_Addon_3.png" },
          name = "Full Void Master Outfit",
          price = 250,
          sexId = {female = 1203, male = 1202},
          addon = 3,
          description = "{info} usable by all characters of the account\n{info} colours can be changed using the Outfit dialog\n{info} includes basic outfit and 2 addons which can be selected individually\n\n<i>According to ancient rumours, the pulsating orb that the Void Master balances skilfully on the tip of his staff consists of powerful cosmic spheres. If you gaze too long into the infinite emptiness inside the orb, its powers will absorb your mind.</i>",
          type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
        },
        {
          icons = { "Cerberus_Champion_Puppy.png" },
          name = "Cerberus Champion Puppy",
          price = 40,
          itemtype = 36299,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Jousting_Eagle_Baby.png" },
          name = "Jousting Eagle Baby",
          price = 40,
          itemtype = 36297,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
  
        },
        {
          icons = { "Sublime_Tournament_Accolade.png" },
          name = "Sublime Tournament Accolade",
          price = 30,
          itemtype = 36307,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Sublime_Tournament_Carpet.png" },
          name = "Sublime Tournament Carpet",
          price = 10,
          itemtype = 36302,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{useicon} use an unwrapped carpet to roll it out or up\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Tournament_Accolade.png" },
          name = "Tournament Accolade",
          price = 40,
          itemtype = 36305,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,

        },
        {
          icons = { "Tournament_Carpet.png" },
          name = "Tournament Carpet",
          price = 10,
          itemtype = 36301,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{useicon} use an unwrapped carpet to roll it out or up\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Baby_Vulcongra_Accolade.png" },
          name = "Baby Vulcongra",
          price = 40,
          itemtype = 37743,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Guzzlemaw_Grub.png" },
          name = "Guzzlemaw Grub",
          price = 40,
          itemtype = 37742,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Cozy_Couch.png" },
          name = "Cozy Couch",
          price = 20,
          itemtype = 37783,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Cozy_Couch_Left_End.png" },
          name = "Cozy Couch Left End",
          price = 20,
          itemtype = 37787,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Cozy_Couch_Right_End.png" },
          name = "Cozy Couch Right End",
          price = 20,
          itemtype = 37791,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Cozy_Couch_Corner.png" },
          name = "Cozy Couch Corner",
          price = 20,
          itemtype = 37799,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Baby_Brain_Squid.png" },
          name = "Baby Brain Squid",
          price = 20,
          itemtype = 37744,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Carved_Table.png" },
          name = "Carved Table",
          price = 25,
          itemtype = 37807,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
             
        }, 
			},
 -- Exclusive Offers  
 }, { 
      icons = { "Category_ExclusiveOffers.png" },
      name = "Objects",
      parent = "Client 12", 
      rookgaard = true,
      state = GameStore.States.STATE_NONE,
      offers = {
        {
          
          icons = { "Carved_Table_Centre.png" },
          name = "Carved Table Centre",
          price = 25,
          itemtype = 37809,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
          icons = { "Carved_Table_Corner.png" },
          name = "Carved Table Corner",
          price = 25,
          itemtype = 37804,
          count = 1,
          description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}",
          type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
        },
        {
		icons = {"Reward_Shrine.png"},
                name = "Daily Reward Shrine",
                price = 50,
                itemtype = 29022,
                count = 1,
                description = "<i>Pick up your daily reward comfortably in your own four walls!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{useicon} use it to open the reward wall\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Gilded_Imbuing_Shrine.png"},
                name = "Gilded Imbuing Shrine",
                price = 50,
                itemtype = 27851,
                count = 1,
                description = "<i>Enhance your equipment comfortably in your own four walls!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{useicon} use it with an imbuable item to open the imbuing dialog\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Imbuing_Shrine.png"},
                name = "Imbuing Shrine",
                price = 50,
                itemtype = 27843,
                count = 1,
                description = "<i>Enhance your equipment comfortably in your own four walls!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{useicon} use it with an imbuable item to open the imbuing dialog\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Mailbox.png"},
                name = "Mailbox",
                price = 50,
                itemtype = 26055,
                count = 1,
                description = "<i>Send your letters and parcels right from your own home!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ornate_Mailbox.png"},
                name = "Ornate Mailbox",
                price = 60,
                itemtype = 26057,
                count = 1,
                description = "<i>Send your letters and parcels right from your own home!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Shiny_Reward_Shrine.png"},
                name = "Shiny Daily Reward Shrine",
                price = 60,
                itemtype = 29024,
                count = 1,
                description = "<i>Pick up your daily reward comfortably in your own four walls!</i>\n\n{house}\n{box}\n{storeinbox}\n{usablebyall}\n{useicon} use it to open the reward wall\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Alchemistic_Cabinet.png"},
                name = "Alchemistic Cabinet",
                price = 40,
                itemtype = 32020,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Alchemistic_Chair.png"},
                name = "Alchemistic Chair",
                price = 40,
                itemtype = 32018,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Alchemistic_Table.png"},
                name = "Alchemistic Table",
                price = 40,
                itemtype = 32021,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Comfy_Cabinet.png"},
                name = "Comfy Cabinet",
                price = 30,
                itemtype = 33513,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Comfy_Chair.png"},
                name = "Comfy Chair",
                price = 30,
                itemtype = 33505,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Comfy_Chest.png"},
                name = "Comfy Chest",
                price = 30,
                itemtype = 33509,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Comfy_Table.png"},
                name = "Comfy Table",
                price = 30,
                itemtype = 33507,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Dwarven_Stone_Cabinet.png"},
                name = "Dwarven Stone Cabinet",
                price = 50,
                itemtype = 36027,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Dwarven_Stone_Chair.png"},
                name = "Dwarven Stone Chair",
                price = 50,
                itemtype = 36020,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Dwarven_Stone_Chest.png"},
                name = "Dwarven Stone Chest",
                price = 50,
                itemtype = 36022,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Dwarven_Stone_Table.png"},
                name = "Dwarven Stone Table",
                price = 50,
                itemtype = 36026,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} use it to open up some storage space\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ferocious_Cabinet.png"},
                name = "Ferocious Cabinet",
                price = 30,
                itemtype = 26077,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ferocious_Chair.png"},
                name = "Ferocious Chair",
                price = 20,
                itemtype = 26065,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ferocious_Table.png"},
                name = "Ferocious Table",
                price = 20,
                itemtype = 26070,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ferocious_Trunk.png"},
                name = "Ferocious Trunk",
                price = 20,
                itemtype = 26079,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Hrodmir_Chair.png"},
                name = "Hrodmir Chair",
                price = 20,
                itemtype = 36528,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Hrodmir_Chest.png"},
                name = "Hrodmir Chest",
                price = 30,
                itemtype = 36522,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Hrodmir_Cupboard.png"},
                name = "Hrodmir Cupboard",
                price = 30,
                itemtype = 36540,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Hrodmir_Table.png"},
                name = "Hrodmir Table",
                price = 30,
                itemtype = 36514,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Magnificent_Cabinet.png"},
                name = "Magnificent Cabinet",
                price = 30,
                itemtype = 26075,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Magnificent_Chair.png"},
                name = "Magnificent Chair",
                price = 30,
                itemtype = 26061,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Magnificent_Table.png"},
                name = "Magnificent Table",
                price = 60,
                itemtype = 26074,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Magnificent_Trunk.png"},
                name = "Magnificent Trunk",
                price = 30,
                itemtype = 26083,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ornate_Cabinet.png"},
                name = "Ornate Cabinet",
                price = 30,
                itemtype = 29398,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ornate_Chair.png"},
                name = "Ornate Chair",
                price = 20,
                itemtype = 29394,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ornate_Chest.png"},
                name = "Ornate Chest",
                price = 30,
                itemtype = 29401,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ornate_Table.png"},
                name = "Ornate Table",
                price = 30,
                itemtype = 29397,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Round_Side_Table.png"},
                name = "Round Side Table",
                price = 30,
                itemtype = 36043,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rustic_Cabinet.png"},
                name = "Rustic Cabinet",
                price = 30,
                itemtype = 26356,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rustic_Chair.png"},
                name = "Rustic Chair",
                price = 30,
                itemtype = 26351,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rustic_Table.png"},
                name = "Rustic Table",
                price = 30,
                itemtype = 26354,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rustic_Trunk.png"},
                name = "Rustic Trunk",
                price = 30,
                itemtype = 26358,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Skeletal_Cabinet.png"},
                name = "Skeletal Cabinet",
                price = 30,
                itemtype = 33415,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Skeletal_Chair.png"},
                name = "Skeletal Chair",
                price = 30,
                itemtype = 32260,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Skeletal_Chest.png"},
                name = "Skeletal Chest",
                price = 30,
                itemtype = 32266,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Skeletal_Table.png"},
                name = "Skeletal Table",
                price = 30,
                itemtype = 32264,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Square_Side_Table.png"},
                name = "Square Side Table",
                price = 30,
                itemtype = 29397,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Vengothic_Cabinet.png"},
                name = "Vengothic Cabinet",
                price = 30,
                itemtype = 27903,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Vengothic_Chair.png"},
                name = "Vengothic Chair",
                price = 30,
                itemtype = 27899,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Vengothic_Chest.png"},
                name = "Vengothic Chest",
                price = 30,
                itemtype = 27905,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Vengothic_Table.png"},
                name = "Vengothic Table",
                price = 20,
                itemtype = 27901,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Verdant_Cabinet.png"},
                name = "Verdant Cabinet",
                price = 20,
                itemtype = 29341,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Verdant_Chair.png"},
                name = "Verdant Chair",
                price = 20,
                itemtype = 29339,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Verdant_Table.png"},
                name = "Verdant Table",
                price = 30,
                itemtype = 29347,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Verdant_Trunk.png"},
                name = "Verdant Trunk",
                price = 20,
                itemtype = 29343,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Wooden_Bookcase.png"},
                name = "Wooden Bookcase",
                price = 10,
                itemtype = 36029,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
                  
        }, 
			},
 -- Exclusive Offers  
 }, { 
      icons = { "Category_ExclusiveOffers.png" },
      name = "Decorations",
      parent = "Client 12", 
      rookgaard = true,
      state = GameStore.States.STATE_NONE,
      offers = {
        {
           icons = {"Alchemistic_Bookstand.png"},
                name = "Alchemistic Bookstand",
                price = 30,
                itemtype = 32028,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Alchemistic_Cupboard.png"},
                name = "Alchemistic Cupboard",
                price = 20,
                itemtype = 32038,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Alchemistic_Scales.png"},
                name = "Alchemistic Scales",
                price = 30,
                itemtype = 32032,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"All-Seeing_Tapestry.png"},
                name = "All-Seeing Tapestry",
                price = 30,
                itemtype = 26106,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Anglerfish_Lamp.png"},
                name = "Anglerfish Lamp",
                price = 30,
                itemtype = 32259,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Arrival_at_Thais_Painting.png"},
                name = "Arrival The Thais Paint",
                price = 30,
                itemtype = 32046,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Azure_Carpet.png"},
                name = "Azure Carpet",
                price = 10,
                itemtype = 26366,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Baby_Dragon.png"},
                name = "Baby Dragon",
                price = 50,
                itemtype = 26098,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Baby_Polar_Bear.png"},
                name = "Baby Polar Bear",
                price = 50,
                itemtype = 37625,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Baby_Rotworm.png"},
                name = "Baby Rotworm",
                price = 50,
                itemtype = 32390,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Baby_Unicorn.png"},
                name = "Baby Unicorn",
                price = 50,
                itemtype = 36538,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Bamboo_Mat.png"},
                name = "Bamboo Mat",
                price = 10,
                itemtype = 26089,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Barrel_&_Anchor_Lamp.png"},
                name = "Barrel & Anchor Lamp",
                price = 20,
                itemtype = 36772,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Bath_Tub.png"},
                name = "Bath Tub",
                price = 80,
                itemtype = 29312,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Bellflower.png"},
                name = "Bellflower",
                price = 10,
                itemtype = 32396,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Bitter-Smack_Leaf.png"},
                name = "Bitter-Smack Leaf",
                price = 20,
                itemtype = 27893,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Blooming_Cactus.png"},
                name = "Blooming Cactus",
                price = 20,
                itemtype = 27892,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Blue_Round_Cushion.png"},
                name = "Blue Round Cushion",
                price = 20,
                itemtype = 36057,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Blue_Square_Cushion.png"},
                name = "Blue Square Cushion",
                price = 20,
                itemtype = 36054,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Brocade_Tapestry.png"},
                name = "Brocade Tapestry",
                price = 10,
                itemtype = 26381,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Carnivorous_Plant.png"},
                name = "Carnivorous Plant",
                price = 20,
                itemtype = 33417,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Cat_in_a_Basket.png"},
                name = "Cat in a Basket",
                price = 30,
                itemtype = 26107,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Chameleon.png"},
                name = "Chamaleon",
                price = 50,
                itemtype = 27889,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Chest_of_Abundance.png"},
                name = "Chest of Abundance",
                price = 50,
                itemtype = 33516,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Colourful_Carpet.png"},
                name = "Colourful Carpet",
                price = 5,
                itemtype = 27085,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Crested_Carpet.png"},
                name = "Crested Carpet",
                price = 5,
                itemtype = 29388,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
                  
        }, 
			},
 -- Exclusive Offers  
 }, { 
      icons = { "Category_ExclusiveOffers.png" },
      name = "More Items",
      parent = "Client 12", 
      rookgaard = true,
      state = GameStore.States.STATE_NONE,
      offers = {
        {
                          icons = {"Rolled-up_Crimson_Carpet.png"},
                name = "Crimson Carpet",
                price = 5,
                itemtype = 26363,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Crystal_Lamp.png"},
                name = "Crystal Lamp",
                price = 2,
                itemtype = 36031,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Curly_Hortensis_Lamp.png"},
                name = "Curly Hortensis Lamp",
                price = 30,
                itemtype = 36530,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Dark_Parquet.png"},
                name = "Dark Parquet",
                price = 20,
                itemtype = 26369,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Decorated_Carpet.png"},
                name = "Decorated Carpet",
                price = 5,
                itemtype = 29390,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Demon_Pet.png"},
                name = "Demon Pet",
                price = 50,
                itemtype = 29409,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Demon_Skull.png"},
                name = "Demon Skull",
                price = 50,
                itemtype = 36047,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Diamond_Carpet.png"},
                name = "Diamond Carpet",
                price = 5,
                itemtype = 27088,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Dog_House.png"},
                name = "Dog House",
                price = 20,
                itemtype = 26353,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Dungeon_Scene_Painting.png"},
                name = "Dungeon Scene Painting",
                price = 40,
                itemtype = 32045,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Emerald_Carpet.png"},
                name = "Emerald Carpet",
                price = 5,
                itemtype = 26367,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Fennec.png"},
                name = "Fennec",
                price = 50,
                itemtype = 32394,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{useicon} to trigger an animation feed it with meat, ham, dragon ham, haunch of a boar, roasted meat or bug meat\n{info} can be fed once every 65 seconds\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ferumbras_Bust.png"},
                name = "Ferumbras Dust",
                price = 40,
                itemtype = 32040,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{backtoinbox}\n{useicon} house owner can use it to display a duplicate of an owned Ferumbras' Hat on this bust - also works if the character has already turned Ferumbras' hat in to earn the outfit addon",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ferumbras_Portrait.png"},
                name = "Ferumbras Portrait",
                price = 40,
                itemtype = 32048,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Filled_Shoes.png"},
                name = "Festive Filled Shoes",
                price = 30,
                itemtype = 35021,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Fireplace.png"},
                name = "Festive Fireplace",
                price = 20,
                itemtype = 35027,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Pile_of_Presents.png"},
                name = "Festive Pile of Presents",
                price = 20,
                itemtype = 35039,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Pyramid.png"},
                name = "Festive Pyramid",
                price = 20,
                itemtype = 35042,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Rocking_Chair.png"},
                name = "Festive Rocking Chair",
                price = 20,
                itemtype = 35035,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Sack_of_Presents.png"},
                name = "Festive Sack of Presents",
                price = 20,
                itemtype = 35041,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Sleigh.png"},
                name = "Festive Sleigh",
                price = 20,
                itemtype = 35038,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Table.png"},
                name = "Festive Table",
                price = 20,
                itemtype = 35023,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Festive_Tree.png"},
                name = "Festive Tree",
                price = 20,
                itemtype = 35031,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Fish_in_a_Tank.png"},
                name = "Fish Tank",
                price = 30,
                itemtype = 26347,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Flowery_Carpet.png"},
                name = "Flowery Carpet",
                price = 5,
                itemtype = 27084,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Fluorescent_Fungi.png"},
                name = "Fluorescent Fungi",
                price = 20,
                itemtype = 33491,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Forget-Me-Not.png"},
                name = "Forget-Me-Not",
                price = 10,
                itemtype = 32397,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Fur_Carpet.png"},
                name = "Fur Carpet",
                price = 5,
                itemtype = 27087,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Gloomy_Poisonous_Fungi.png"},
                name = "Gloomy Poisonous Fungi",
                price = 20,
                itemtype = 33497,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Glowing_Sulphur_Fungi.png"},
                name = "Glowing Sulphur Fungi",
                price = 20,
                itemtype = 33495,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Golden_Demon_Skull.png"},
                name = "Golden Demon Skull",
                price = 50,
                itemtype = 36046,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                description = "Buy an incredible Golden Dragon Tapestry to decorate your home.",
                icons = {"Golden_Dragon_Tapestry.png"},
                name = "Golden Dragon Tapestry",
                price = 50,
                itemtype = 26379,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{info} drag the unwrapped tapestry to a wall to hang it up\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Golden_Minotaur_Skull.png"},
                name = "Golden Minotaur Skull",
                price = 50,
                itemtype = 36044,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
 },
            {

                icons = {"Green_Round_Cushion.png"},
                name = "Green Round Cushion",
                price = 20,
                itemtype = 36056,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Green_Square_Cushion.png"},
                name = "Green Square Cushion",
                price = 20,
                itemtype = 36053,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Hamster_in_a_Wheel.png"},
                name = "Hamster in a Wheel",
                price = 20,
                itemtype = 26100,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Baby_Hedgehog.png"},
                name = "Hedgehog",
                price = 30,
                itemtype = 36515,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Hrodmir_Weapons_Rack.png"},
                name = "Hrodmir Weapons Rack",
                price = 20,
                itemtype = 29317,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Idol_Lamp.png"},
                name = "Idol Lamp",
                price = 20,
                itemtype = 36049,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Incomprehensible_Riches.png"},
                name = "Incomprehensible Riches",
                price = 20,
                itemtype = 33515,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"King_Tibianus_Bust.png"},
                name = "King Tibianus Bust",
                price = 30,
                itemtype = 32049,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Light_of_Change.png"},
                name = "Light of Change",
                price = 40,
                itemtype = 32023,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Light_Parquet.png"},
                name = "Light Parquet",
                price = 20,
                itemtype = 26368,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Lit_Predator_Lamp.png"},
                name = "Lit Predator Lamp",
                price = 10,
                itemtype = 26092,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Lit_Protectress_Lamp.png"},
                name = "Lit Protectress Lamp",
                price = 20,
                itemtype = 26096,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Lit_Skull_Lamp.png"},
                name = "Lit Skull Lamp",
                price = 20,
                itemtype = 27103,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Little_Big_Flower_Lamp.png"},
                name = "Little Big Flower Lamp",
                price = 30,
                itemtype = 36532,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
                                }, 
			},
 -- Exclusive Offers  
 }, { 
      icons = { "Category_ExclusiveOffers.png" },
      name = "Last Items",
      parent = "Client 12", 
      rookgaard = true,
      state = GameStore.States.STATE_NONE,
      offers = {
        {
                   icons = {"Lordly_Tapestry.png"},
                name = "Lordly Tapestry",
                price = 20,
                itemtype = 26104,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Luminescent_Fungi.png"},
                name = "Luminescent Fungi",
                price = 20,
                itemtype = 33493,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Marble_Floor.png"},
                name = "Marble Floor",
                price = 20,
                itemtype = 26376,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Menacing_Tapestry.png"},
                name = "Menacing Tapestry",
                price = 20,
                itemtype = 26105,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Mermaid_Figure_Head.png"},
                name = "Mermaid Figure Head",
                price = 40,
                itemtype = 26105,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Minotaur_Skull.png"},
                name = "Minotaur Skull",
                price = 30,
                itemtype = 36045,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Model_Ship_Lamp.png"},
                name = "Model Ship Lamp",
                price = 20,
                itemtype = 36777,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Monkey.png"},
                name = "Monkey",
                price = 40,
                itemtype = 36790,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Mystic_Carpet.png"},
                name = "Mystic Carpet",
                price = 5,
                itemtype = 29354,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Night_Sky_Carpet.png"},
                name = "Night Sky Carpet",
                price = 5,
                itemtype = 27090,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Painting_of_Tibiasula.png"},
                name = "Painting of Tibiasula",
                price = 20,
                itemtype = 33518,
                itemtype = 33519,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Parrot.png"},
                name = "Parrot",
                price = 40,
                itemtype = 27100,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Patterned_Carpet.png"},
                name = "Patterned Carpet",
                price = 5,
                itemtype = 27089,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Pile_of_Alchemistic_Books.png"},
                name = "Pile of Alchemistic Books",
                price = 20,
                itemtype = 32036,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Pink_Roses.png"},
                name = "Pink Roses",
                price = 20,
                itemtype = 27894,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Pirate_Flag.png"},
                name = "Pirate Flag",
                price = 10,
                itemtype = 36780,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Pirate_Ship_Ballista.png"},
                name = "Pirate Ship Ballista",
                price = 30,
                itemtype = 36768,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Pirate_Skeleton_Cage.png"},
                name = "Pirate Skeleton Cage",
                price = 30,
                itemtype = 36782,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Pirate_Treasure_Chest.png"},
                name = "Pirate Treasure Chest",
                price = 40,
                itemtype = 36771,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Pirate_Treasure_Map.png"},
                name = "Pirate Treasure Map",
                price = 30,
                itemtype = 36781,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Queen_Eloise_Bust.png"},
                name = "Queen Eloise Bust",
                price = 30,
                itemtype = 32043,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Red_Geranium.png"},
                name = "Red Geranium",
                price = 20,
                itemtype = 32398,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Red_Roses.png"},
                name = "Red Roses",
                price = 20,
                itemtype = 27895,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Exalted_Sarcophagus.png"},
                name = "Sarcophagus",
                price = 30,
                itemtype = 36518,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Shaggy_Carpet.png"},
                name = "Shaggy Carpet",
                price = 5,
                itemtype = 29352,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Ship's_Wheel.png"},
                name = "Ship's Wheel",
                price = 10,
                itemtype = 36783,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                description = "Buy an incredible Star Carpet to decorate your home.",
                icons = {"Rolled-up_Star_Carpet.png"},
                name = "Star Carpet",
                price = 5,
                itemtype = 27091,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Piled-up_Stone_Tiles.png"},
                name = "Stone Tiles",
                price = 5,
                itemtype = 29357,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Striped_Carpet .png"},
                name = "Striped Carpet",
                price = 5,
                itemtype = 27086,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Stuffed_Bear_Display.png"},
                name = "Stuffed Bear Display",
                price = 20,
                itemtype = 33499,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Stuffed_Teddy_Display.png"},
                name = "Stuffed Teddy Display",
                price = 15,
                itemtype = 33501,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Sulphur_Blossom_Lamp.png"},
                name = "Sulphur Blossom Lamp",
                price = 20,
                itemtype = 36558,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Sword_Tapestry.png"},
                name = "Sword Tapestry",
                price = 30,
                itemtype = 26380,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Terrarium_Snake.png"},
                name = "Terrarium Snake",
                price = 30,
                itemtype = 29407,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Spider_in_a_Terrarium.png"},
                name = "Terrarium Spider",
                price = 30,
                itemtype = 29314,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Tibia_Streets_Painting.png"},
                name = "Tibia Streets Painting",
                price = 20,
                itemtype = 32047,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Torch_of_Change.png"},
                name = "Torch of Change",
                price = 20,
                itemtype = 33175,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Vengothic_Lamp.png"},
                name = "Vengothic Lamp",
                price = 30,
                itemtype = 27886,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Venorean_Table_Clock.png"},
                name = "Venorean Table Clock",
                price = 20,
                itemtype = 29348,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Verdant_Carpet.png"},
                name = "Verdant Carpet",
                price = 5,
                itemtype = 29350,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Violet_Round_Cushion.png"},
                name = "Violet Round Cushion",
                price = 15,
                itemtype = 36055,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Violet_Square_Cushion.png"},
                name = "Violet Square Cushion",
                price = 15,
                itemtype = 36052,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Wheat_Carpet.png"},
                name = "Wheat Carpet",
                price = 5,
                itemtype = 29387,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_White_Fur_Carpet.png"},
                name = "White Fur Carpet",
                price = 5,
                itemtype = 26088,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"White_Shark_Trophy.png"},
                name = "White Shark Trophy",
                price = 20,
                itemtype = 36786,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Wooden_Planks.png"},
                name = "Wooden Planks",
                price = 5,
                itemtype = 29359,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Rolled-up_Yalaharian_Carpet.png"},
                name = "Yalaharian Carpet",
                price = 5,
                itemtype = 26087,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE
            },
            {
                icons = {"Yellow_Roses.png"},
                name = "Yellow Roses",
                price = 15,
                itemtype = 27896,
                count = 1,
                description = "{house}\n{box}\n{storeinbox}\n{use}\n{backtoinbox}",
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE

        },
	},
 },
}


-- Each outfit must be uniquely identified to distinguish between addons.
-- Here we dynamically assign ids for outfits. These ids must be unique.
local runningId = 45000
for k, category in ipairs(GameStore.Categories) do
    if category.offers then
        for m, offer in ipairs(category.offers) do
            if not offer.id then
                if type(offer.count) == "table" then
                    for i = 1, #offer.price do
                        offer.id[i] = runningId
                        runningId = runningId + 1
                    end
                else
                    offer.id = runningId
                    runningId = runningId + 1
                end
            end
            if not offer.type then
                offer.type = GameStore.OfferTypes.OFFER_TYPE_NONE
            end
            if not offer.coinType then
                offer.coinType = GameStore.CointType.Coin
            end
        end
    end
end
