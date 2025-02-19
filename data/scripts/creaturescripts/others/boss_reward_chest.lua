local function pushSeparated(buffer, sep, ...)
	local argv = {...}
	local argc = #argv
	for k, v in ipairs(argv) do
		table.insert(buffer, v)
		if k < argc and sep then
			table.insert(buffer, sep)
		end
	end
end

local function insertItems(buffer, info, parent, items, bagSid)
	local start = info.running
	for _, item in ipairs(items) do
		if item ~= nil then
			if _ ~= 1 or parent > 100 then
				table.insert(buffer, ",")
			end
			if item:getId() == ITEM_REWARD_CONTAINER then
				table.insert(buffer, "(")
				pushSeparated(buffer, ",", info.playerGuid, parent, bagSid, item:getId(), item:getSubType(), db.escapeString(item:serializeAttributes()))
				table.insert(buffer, ")")
			else
				info.running = info.running + 1
				table.insert(buffer, "(")
				pushSeparated(buffer, ",", info.playerGuid, parent, info.running, item:getId(), item:getSubType(), db.escapeString(item:serializeAttributes()))
				table.insert(buffer, ")")
			end

			if item:isContainer() then
				local size = item:getSize()
				if size > 0 then
					local subItems = {}
					for i = 1, size do
						table.insert(subItems, item:getItem(i - 1))
					end

					insertItems(buffer, info, bagSid, subItems, bagSid)
				end
			end
		end
	end
	return info.running - start
end

local function insertRewardItems(playerGuid, timestamp, itemList)
	db.asyncStoreQuery('select `pid`, `sid`, (SELECT max(`sid`) as sid from `player_rewards` where player_id = '..playerGuid..') as max_sid from `player_rewards` where `pid` = (select max(`pid`) from `player_rewards` where player_id = ' .. playerGuid .. ' and `pid` < 100);',
		function(query)
			local lastPid = result.getDataInt(query, 'pid') or 0
			local bagSid = result.getDataInt(query, 'sid') or 100
			local lastSid = result.getDataInt(query, 'max_sid') or 101
			if lastPid ~= 0 then 
				db.query('UPDATE `player_rewards` SET `sid` = `sid`+1 WHERE `sid`> '..bagSid..' ORDER BY `sid` DESC')
				lastSid = lastSid+1
			end

			local buffer = {'INSERT INTO `player_rewards` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES'}

			--reward bag
			local info = {
				playerGuid = playerGuid,
				running = lastSid
			}

			local bag = Game.createItem(ITEM_REWARD_CONTAINER)
			bag:setAttribute(ITEM_ATTRIBUTE_DATE, timestamp)
			if itemList then
				for _, p in ipairs(itemList) do
					bag:addItem(p[1], p[2])
				end
			end

			local total = insertItems(buffer, info, lastPid + 1, {bag}, bagSid+1)
			table.insert(buffer, ";")

			if total ~= 0 then
				db.query(table.concat(buffer))
			end
		end
	)
end

local function getPlayerStats(bossId, playerGuid, autocreate)
	local ret = globalBosses[bossId][playerGuid]
	if not ret and autocreate then
		ret = {
			bossId = bossId,
			damageIn = 0, -- damage taken from the boss
			healing = 0, -- healing (other players) done
		}
		globalBosses[bossId][playerGuid] = ret
		return ret
	end
	return ret
end

local function resetAndSetTargetList(creature)
	if not creature then
		return
	end

	local bossId = creature:getId()
	local info = globalBosses[bossId]
	-- Reset all players' status
	for _, player in pairs(info) do
		player.active = false
	end
	-- Set all players in boss' target list as active in the fight
	local targets = creature:getTargetList()
	for _, target in ipairs(targets) do
		if target:isPlayer() then
			local stats = getPlayerStats(bossId, target:getGuid(), true)
			stats.playerId = target:getId() -- Update player id
			stats.active = true
		end
	end
end

local bossDeath = CreatureEvent("BossDeath")
function bossDeath.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
	-- player
	if not creature or creature:isPlayer() then
		return true
	end
	
	-- Deny summons
    if creature:getMaster() then
        return true
    end

	-- boss
	local monsterType = creature:getType()
	if monsterType and monsterType:isRewardBoss() then -- Make sure it is a boss
		local bossId = creature:getId()
		local timestamp = os.time()

		resetAndSetTargetList(creature)

		local totalDamageOut, totalDamageIn, totalHealing = 0.1, 0.1, 0.1 -- avoid dividing by zero

		local scores = {}
		local info = globalBosses[bossId]
		local damageMap = creature:getDamageMap()

		for guid, stats in pairs(info) do
			local player = Player(stats.playerId)
			local part = damageMap[stats.playerId]
			local damageOut, damageIn, healing = (stats.damageOut or 0) + (part and part.total or 0), stats.damageIn or 0, stats.healing or 0

			totalDamageOut = totalDamageOut + damageOut
			totalDamageIn = totalDamageIn + damageIn
			totalHealing = totalHealing + healing

			table.insert(scores, {
				player = player,
				guid = guid,
				damageOut = damageOut,
				damageIn = damageIn,
				healing = healing,
			})
		end

		local participants = 0
		for _, con in ipairs(scores) do
			local score = (con.damageOut / totalDamageOut) + (con.damageIn / totalDamageIn) + (con.healing / totalHealing)
			con.score = score / 3 -- normalize to 0-1
			if score ~= 0 then
				participants = participants + 1
			end
		end
		table.sort(scores, function(a, b) return a.score > b.score end)

		local expectedScore = 1 / participants

		for _, con in ipairs(scores) do
			local reward, stamina -- ignoring stamina for now because I heard you get receive rewards even when it's depleted
			if con.player then
				reward = con.player:getReward(timestamp, true)
				stamina = con.player:getStamina()
			else
				stamina = con.stamina or 0
			end

			local playerLoot
			if --[[stamina > 840 and]] con.score ~= 0 then
				local lootFactor = 1
				lootFactor = lootFactor / participants ^ (1 / 3) -- tone down the loot a notch if there are many participants
				lootFactor = lootFactor * (1 + lootFactor) ^ (con.score / expectedScore) -- increase the loot multiplicatively by how many times the player surpassed the expected score
				playerLoot = monsterType:getBossReward(lootFactor, _ == 1)

				if con.player then
					for _, p in ipairs(playerLoot) do
						reward:addItem(p[1], p[2])
					end
				end
			end

			local client = con.player:getClient()

			if con.player and con.score ~= 0 then
				if client.version > 1200 then
					local lootMessage = ("The following items dropped by %s are available in your reward chest: %s"):format(creature:getName(), reward:getContentDescription())

					con.player:sendTextMessage(MESSAGE_LOOT, lootMessage)
				else
					local lootMessage = {"The following items dropped by ".. creature:getName() .." are available in your reward chest: ".. reward:getRewardContentDescription() ..""}

					con.player:sendTextMessage(MESSAGE_INFO_DESCR, table.concat(lootMessage))
				end

				if stamina > 840 then
					reward:getContentDescription(lootMessage)
				end
			elseif con.score ~= 0 then
				insertRewardItems(con.guid, timestamp, playerLoot)
			end
		end

		globalBosses[bossId] = nil
	end
	return true
end
bossDeath:register()

local bossThink = CreatureEvent("BossThink")
function bossThink.onThink(creature, interval)
	resetAndSetTargetList(creature)
end
bossThink:register()

local bossParticipation = CreatureEvent("BossParticipation")
function bossParticipation.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if not next(globalBosses) then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	if not creature or not attacker then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	local stats = creature:inBossFight()
	if not stats then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	local creatureId, attackerId = creature:getId(), attacker:getId()
	stats.playerId = creatureId -- Update player id

	-- Account for healing of others active in the boss fight
	if primaryType == COMBAT_HEALING and attacker:isPlayer() and attackerId ~= creatureId then
		local healerStats = getPlayerStats(stats.bossId, attacker:getGuid(), true)
		healerStats.active = true
		healerStats.playerId = attackerId -- Update player id
		healerStats.healing = healerStats.healing + primaryDamage
	elseif stats.bossId == attackerId then
		-- Account for damage taken from the boss
		stats.damageIn = stats.damageIn + primaryDamage
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
bossParticipation:register()

local loginBossPlayer = CreatureEvent("LoginBossPlayer")
function loginBossPlayer.onLogin(player)
	player:registerEvent("BossDeath")
	return true
end
loginBossPlayer:register()
