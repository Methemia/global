local function onMovementRemoveProtection(cid, oldPos, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPos = player:getPosition()
	if (playerPos.x ~= oldPos.x or playerPos.y ~= oldPos.y or playerPos.z ~= oldPos.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPos, time - 1)
end

local function protectionZoneCheck(playerName)
    doRemoveCreature(playerName)
    return true
end

local playerLogin = CreatureEvent("PlayerLogin")

function playerLogin.onLogin(player)
	local items = {
		{2120, 1}
	}
	if player:getLastLoginSaved() == 0 then
		player:sendOutfitWindow()
		local backpack = player:addItem(1988)
		if backpack then
			for i = 1, #items do
				backpack:addItem(items[i][1], items[i][2])
			end
		end
		db.query('UPDATE `players` SET `istutorial` = 0 where `id`='..player:getGuid())
	else
		player:sendTextMessage(MESSAGE_STATUS, "Welcome to " .. SERVER_NAME .. "!")
		player:sendTextMessage(MESSAGE_LOGIN, string.format("Your last visit in ".. SERVER_NAME ..": %s.", os.date("%d. %b %Y %X", player:getLastLoginSaved())))
	end

	if isPremium(player) then
	player:loadVipData()
	player:updateVipTime()
	player:addAddonMount()
		player:setStorageValue(Storage.PremiumAccount, 1)
	end
	-- Premium Ends Teleport to Temple, change addon (citizen) houseless
	local defaultTown = "Thais" -- default town where player is teleported if his home town is in premium area
	local freeTowns = {"Ab'Dendriel", "Carlin", "Kazordoon", "Thais", "Venore", "Rookgaard", "Dawnport", "Dawnport Tutorial", "Island of Destiny"} -- towns in free account area

	if isPremium(player) == false and isInArray(freeTowns, player:getTown():getName()) == false then
		local town = player:getTown()
		local sex = player:getSex()
		local home = getHouseByPlayerGUID(getPlayerGUID(player))
		town = isInArray(freeTowns, town:getName()) and town or Town(defaultTown)
		player:teleportTo(town:getTemplePosition())
		player:setTown(town)
		player:sendTextMessage(MESSAGE_FAILURE, "Your premium time has expired.")
		player:setStorageValue(Storage.PremiumAccount, 0)
		if sex == 1 then
			player:setOutfit({lookType = 128, lookFeet = 114, lookLegs = 134, lookHead = 114,lookAddons = 0})
        elseif sex == 0 then
			player:setOutfit({lookType = 136, lookFeet = 114, lookLegs = 134, lookHead = 114, lookAddons = 0})
        end
        if home ~= nil and not isPremium(player) then
            setHouseOwner(home, 0)
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'You\'ve lost your house because you are not premium anymore.')
			player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'Your items from house are send to your inbox.')
        end
	end
	-- End 'Premium Ends Teleport to Temple'

	-- Recruiter system
	local resultId = db.storeQuery('SELECT `recruiter` from `accounts` where `id`='..getAccountNumberByPlayerName(getPlayerName(player)))
	local recruiterStatus = result.getNumber(resultId, 'recruiter')
	local sex = player:getSex()
	if recruiterStatus >= 1 then
		if sex == 1 then
			local outfit = player:hasOutfit(746)
			if outfit == false then
				player:addOutfit(746)
			end
		else
			local outfit = player:hasOutfit(745)
			if outfit == false then
				player:addOutfit(745)
			end
		end
	end
	if recruiterStatus >= 3 then
		if sex == 1 then
			local outfit = player:hasOutfit(746,1)
			if outfit == false then
				player:addOutfitAddon(746,1)
			end
		else
			local outfit = player:hasOutfit(745,1)
			if outfit == false then
				player:addOutfit(745,1)
			end
		end
	end
	if recruiterStatus >= 10 then
		if sex == 1 then
			local outfit = player:hasOutfit(746,2)
			if outfit == false then
				player:addOutfitAddon(746,2)
			end
		else
			local outfit = player:hasOutfit(745,2)
			if outfit == false then
				player:addOutfit(745,2)
			end
		end
	end
	-- End recruiter system

	local playerId = player:getId()
	DailyReward.init(playerId)

	player:loadSpecialStorage()

	if player:getGroup():getId() >= GROUP_TYPE_GAMEMASTER then
		player:setGhostMode(true)
	end
	-- Boosted creature
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Today's boosted creature: " .. Game.getBoostedCreature() .. " \
	Boosted creatures yield more experience points, carry more loot than usual and respawn at a faster rate.")

local guild = player:getGuild()
if guild then
	if player:getLevel() >= CONFIG_GUILD_LEVEL.minLevelToGetPoints then
		player:registerEvent('GuildLevelK')
  	end
  player:registerEvent('guildLevel_e')
end	

	if player:getLevel() >= 1 and (player:getStorageValue(198009) ~= 1) then	
        player:setStorageValue(Storage.ThreatenedDreams.Start, 1)
	player:setStorageValue(Storage.ThreatenedDreams.TroubledMission01, 1)
    	player:setStorageValue(Storage.WrathoftheEmperor.Questline, 29)
    	player:setStorageValue(Storage.WrathoftheEmperor.Mission02, 3)
    	player:setStorageValue(Storage.WrathoftheEmperor.Mission03, 3)
    	player:setStorageValue(Storage.WrathoftheEmperor.Mission04, 3)
    	player:setStorageValue(Storage.WrathoftheEmperor.Mission05, 3)
    	player:setStorageValue(Storage.WrathoftheEmperor.Mission06, 4)
    	player:setStorageValue(Storage.WrathoftheEmperor.Mission07, 6)
    	player:setStorageValue(Storage.WrathoftheEmperor.Mission08, 2)
    	player:setStorageValue(Storage.WrathoftheEmperor.Mission09, 2)
        player:setStorageValue(Storage.WrathoftheEmperor.Mission10, 0)
	player:setStorageValue(Storage.WrathoftheEmperor.Mission11, 0)

        player:setStorageValue(Storage.ForgottenKnowledge.AccessDeath, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.AccessEarth, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.AccessViolet, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.AccessFire, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.AccessIce, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.AccessGolden, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.AccessLast, 1)
		player:setStorageValue(198009, 1)
	end
	
	--	if player:getLevel() >= 1 and (player:getStorageValue(38783) ~= 1) then	
	--	player:addOutfit(962)
	--	player:addOutfit(963)
	--	player:addOutfit(964)
	--	player:addOutfit(965)
	--	player:addOutfit(966)
	--	player:addOutfit(967)
	--	player:addOutfit(968)
	--	player:addOutfit(969)
	--	player:addOutfit(970)
	--	player:addOutfit(971)
	--	player:addOutfit(972)
	--	player:addOutfit(973)
	--	player:addOutfit(974)
	--	player:addOutfit(975)
	--	player:setStorageValue(38783, 1)
	--	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have won all retro outfits for first login.")
	--end

		if player:getLevel() >= 1 and (player:getStorageValue(38785) ~= 1) then	
		player:addMount(math.random(187))
		player:setStorageValue(38785, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have won a random mount for first login.")
	end

	--	if player:getLevel() >= 1 and (player:getStorageValue(31990) ~= 1) then		
	--	player:removeOutfitAddon(1210, 1)
	--	player:removeOutfitAddon(1210, 2)
	--	player:removeOutfitAddon(1211, 1)
	--	player:removeOutfitAddon(1211, 2)
	--	player:removeOutfit(1210)
	--	player:removeOutfit(1211)
	--	player:setOutfit({lookType = 128, lookFeet = 114, lookLegs = 134, lookHead = 114, lookAddons = 0})
	--	player:setStorageValue(31990, 1)
	--	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Remove new BUG abuse GOLDEN OUTFIT.")
	--end

if player:getStorageValue(5000000) == 1 then
    removePlayerVials(player:getId())
end




	-- Stamina
	nextUseStaminaTime[playerId] = 1

	-- EXP Stamina
	nextUseXpStamina[playerId] = 1

	-- Prey Small Window
	for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
		player:sendPreyData(slot)
	end

	-- New prey
	nextPreyTime[playerId] = {
		[CONST_PREY_SLOT_FIRST] = 1,
		[CONST_PREY_SLOT_SECOND] = 1,
		[CONST_PREY_SLOT_THIRD] = 1
	}

	-- Open channels
	if player:getClient().version < 1200 then
		player:openChannel(9)
	end
	if table.contains({TOWNS_LIST.DAWNPORT, TOWNS_LIST.DAWNPORT_TUTORIAL}, player:getTown():getId())then
		player:openChannel(3) -- World chat
	else
		player:openChannel(3) -- World chat
		player:openChannel(5) -- Advertsing main
	end

	-- Rewards
	local rewards = #player:getRewardList()
	if(rewards > 0) then
		player:sendTextMessage(MESSAGE_LOGIN, string.format("You have %d %s in your reward chest.",
		rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	if player:getStorageValue(Storage.combatProtectionStorage) < 1 then
		player:setStorageValue(Storage.combatProtectionStorage, 1)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end
	-- Set Client XP Gain Rate
	local baseExp = 100
	if Game.getStorageValue(GlobalStorage.XpDisplayMode) > 0 then
		baseExp = getRateFromTable(experienceStages, player:getLevel(), configManager.getNumber(configKeys.RATE_EXP))
	end

	local staminaMinutes = player:getStamina()
	local doubleExp = false --Can change to true if you have double exp on the server
	local staminaBonus = (staminaMinutes > 2340) and 150 or ((staminaMinutes < 840) and 50 or 100)
	if doubleExp then
		baseExp = baseExp * 2
	end
	player:setStaminaXpBoost(staminaBonus)
	player:setBaseXpGain(baseExp)

	if player:getStorageValue(Storage.isTraining) == 1 then --Reset exercise weapon storage
		player:setStorageValue(Storage.isTraining,0)
	end
	return true
end
playerLogin:register()
