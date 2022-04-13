local deathListEnabled = true

local playerDeath = CreatureEvent("PlayerDeath")
function playerDeath.onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local playerId = player:getId()
	if nextUseStaminaTime[playerId] then
		nextUseStaminaTime[playerId] = nil
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are dead.")
		if player:getStorageValue(Storage.SvargrondArena.PitDoor) > 0 then
		player:setStorageValue(Storage.SvargrondArena.PitDoor, 0)
	end

	if not deathListEnabled then
		return
	end

	local byPlayer = 0
	local killerName
	if killer ~= nil then
		if killer:isPlayer() then
			byPlayer = 1
		else
			local master = killer:getMaster()
			if master and master ~= killer and master:isPlayer() then
				killer = master
				byPlayer = 1
			end
		end
		killerName = killer:isMonster() and killer:getType():getNameDescription() or killer:getName()
	else
		killerName = 'field item'
	end

	local byPlayerMostDamage = 0
	local mostDamageKillerName
	if mostDamageKiller ~= nil then
		if mostDamageKiller:isPlayer() then
			byPlayerMostDamage = 1
		else
			local master = mostDamageKiller:getMaster()
			if master and master ~= mostDamageKiller and master:isPlayer() then
				mostDamageKiller = master
				byPlayerMostDamage = 1
			end
		end
		mostDamageName = mostDamageKiller:isMonster() and mostDamageKiller:getType():getNameDescription() or mostDamageKiller:getName()
	else
		mostDamageName = 'field item'
	end

	local playerGuid = player:getGuid()
	db.query('INSERT INTO `player_deaths` (`player_id`, `time`, `level`, `killed_by`, `is_player`, `mostdamage_by`, `mostdamage_is_player`, `unjustified`, `mostdamage_unjustified`) VALUES (' .. playerGuid .. ', ' .. os.time() .. ', ' .. player:getLevel() .. ', ' .. db.escapeString(killerName) .. ', ' .. byPlayer .. ', ' .. db.escapeString(mostDamageName) .. ', ' .. byPlayerMostDamage .. ', ' .. (unjustified and 1 or 0) .. ', ' .. (mostDamageUnjustified and 1 or 0) .. ')')
	local resultId = db.storeQuery('SELECT `player_id` FROM `player_deaths` WHERE `player_id` = ' .. playerGuid)

	local deathRecords = 0
	local tmpResultId = resultId
	while tmpResultId ~= false do
		tmpResultId = result.next(resultId)
		deathRecords = deathRecords + 1
	end

	if resultId ~= false then
		result.free(resultId)
	end

		if byPlayer == 1 then
		local targetGuild = player:getGuild()
		targetGuild = targetGuild and targetGuild:getId() or 0
		if targetGuild ~= 0 then
			local killerGuild = killer:getGuild()
			killerGuild = killerGuild and killerGuild:getId() or 0
			if killerGuild ~= 0 and targetGuild ~= killerGuild and isInWar(playerId, killer:getId()) then
				local warId = false
				local fraglimit = 0
				resultId = db.storeQuery('SELECT `id`, `fraglimit` FROM `guild_wars` WHERE `status` = 1 AND ((`guild1` = ' .. killerGuild .. ' AND `guild2` = ' .. targetGuild .. ') OR (`guild1` = ' .. targetGuild .. ' AND `guild2` = ' .. killerGuild .. '))')
				if resultId ~= false then
					warId = result.getNumber(resultId, 'id')
					fraglimit = result.getNumber(resultId, 'fraglimit')
					result.free(resultId)
				end
				
				if warId ~= false then
				if fraglimit > 0 and getGuildKills(killerGuild, warId)+1 >= fraglimit then
				db.query("UPDATE `guild_wars` SET `status` = 4, `ended` = " .. os.time() .. " WHERE `id` = " .. warId)
				endCityWar(player, warId, killerGuild, true)
				end
				local guild1online = Guild(killerGuild):getMembersOnline()
				for i=1, #guild1online do
				guild1online[i]:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your guild scored 1 frag against "..Guild(targetGuild):getName()..", you have now "..getGuildKills(killerGuild, warId)+1 .." frags ("..getGuildKills(killerGuild, warId)+1 .." vs "..getGuildKills(targetGuild, warId)..")")
				end
				local guild2online = Guild(targetGuild):getMembersOnline()
				for i=1, #guild2online do
				guild2online[i]:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The enemy guild "..Guild(killerGuild):getName().." scored 1 frag against your guild, they have now "..getGuildKills(killerGuild, warId)+1 .." frags ("..getGuildKills(targetGuild, warId) .." vs "..getGuildKills(killerGuild, warId)+1 ..")")
				end
				db.asyncQuery('INSERT INTO `guildwar_kills` (`killer`, `target`, `killerguild`, `targetguild`, `time`, `warid`) VALUES (' .. db.escapeString(killerName) .. ', ' .. db.escapeString(player:getName()) .. ', ' .. killerGuild .. ', ' .. targetGuild .. ', ' .. os.time() .. ', ' .. warId .. ')')
				end
			end
		end
	end
end
playerDeath:register()