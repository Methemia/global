local loginEvents = CreatureEvent("LoginEvents")
function loginEvents.onLogin(player)

	local events = {
		--Monster
		"LowerRoshamuul",
		--Others
		"AdvanceSave",
		"BestiaryOnKill",
		"BossParticipation",
		"DropLoot",
		"PlayerDeath",
		"PreyLootBonusKill",
		"RookgaardAdvance",
		"FamiliarLogin",
		"AdvanceFamiliar",
		--Quests
		--Adventurers Guild Quest
		"Thegreatdragonhuntkill",
		--Bigfoot Burden Quest
		"BossesWarzone",
		"ParasiteWarzone",
		"VersperothKill",
		"WigglerKill",
		--Cults Of Tibia Quest
		"BossesCults",
		"MinotaurTask",
		"VortexCarlin",
		"LeidenHeal",
		"ShocksDeath",
		"ForeshockTransform",
		"PirateDoorHeal",
		"GlowingRubbishAmulet",
		"DestroyedPillar",
		"HealthPillar",
		"YalahariHealth",
		--Dangerous Depths Quest
		"LostExileKill",
		"SnailSlimeKill",
		"TheBaronFromBelowKill",
		--Dawnport Quest
		"MorrisMinotaurKill",
		"MorrisGoblinKill",
		"MorrisTrollKill",
		--Elemental Spheres Quest
		"OverlordKill",
		--Ferumbras Ascendant Quest
		"AscendantBossesKill",
		"TheShattererKill",
		--Firewalker Boots
		"PythiusTheRottenKill",
		--Forgotten Knowledge Quest
		"BossesForgottenKill",
		"AstralPower",
		"EnergyPrismDeath",
		"ReplicaServant",
		--Hero Of Rathleton
		"RathletonBossKill",
		--Secret Service
		"BlackKnightKill",
		--Service Of Yalahar
		"DiseasedTrio",
		"Azerus",
		"QuaraLeaders",
		--Inquisition
		"InquisitionBossKill",
		"UngreezKill",
		--Killing In The Name Of
		"KillingInTheNameOfKill",
		"KillingInTheNameOfMinotaurKill",
		--Kilmaresh
		"BragrumolKill",
		"MozradekKill",
		"XogixathKill",
		"FafnarKill",
		--Liquid Black
		"DeeplingBosses",
		--Raging Mage Worldchange
		"EnergizedRagingMageKill",
		"RagingMageKill",
		"YielothaxKill",
		--Spike Tasks
		"LowerSpikeKill",
		"UpperSpikeKill",
		"MiddleSpikeKill",
		--Svargrond Arena
		"SvargrondArenaKill",
		--The First Dragon
		"KillDragon",
		"SomewhatBeatableDeath",
		--The New Frontier
		"ShardOfCorruptionKill",
		"TireczKill",
		--Thieves Guild
		"NomadKill",
		--Wrath of the Emperor
		"LizardMagistratusKill",
		"LizardNobleKill",
		"KeeperKill",
		"BossesKill",
		"ZalamonKill",
		"danielTask",
		"GuildLogin",
		"ExpPvp",
		"TentuglyHeadKill",
		"MiniRoshaKills",
		"PirateTailsKills",
		"PirateTailsKills2",
		"PirateTailsKills3",
		"removeConditionsPZ",
		"staminaLogin",
		"SkullPlayer",
		"Autoloot",
		"MirrorImageTransform",
		"TibianaHalloween",
		"SoulWarEnd",
		"SoulwarBossKill",
		"wboss",
		"CrueltyKill",
		"GreedKill",
		"HatredKill",
		"MaliceKill",
		"SpiceKill",
		"BrainHeadKills",
		"MegalomaniaKill",
		-- The Rookie Guard
		"VascalirRatKills"
	}

	for i = 1, #events do
		player:registerEvent(events[i])
		player:registerEvent("moreRegen")
		player:registerEvent("AntiMC")
		player:registerEvent("SoulWarEnd")
		player:registerEvent("points_reward")
		player:registerEvent("AutoLoot")
	end
	return true
end
loginEvents:register()
