local playerPrepareDeath = CreatureEvent("CityWar")
function playerPrepareDeath.onPrepareDeath(cid, prekiller)
local player = Player(cid)
if player:getStorageValue(warStorages.inArena) == 1 then
player:setStorageValue(warStorages.inArena, -1)
player:setStorageValue(warStorages.areaRunes , -1)
player:setStorageValue(warStorages.ueSpells , -1)
player:setStorageValue(warStorages.ssaMight , -1)
player:setStorageValue(warStorages.summons , -1)
if player:getLevel() ~= player:getLevel(true) then
player:setTempLevel(false)
end
player:say("FRAG!")
player:getPosition():sendMagicEffect(7)
if player:getStorageValue(warStorages.expLoss) == 2 then
player:setStorageValue(warStorages.expLoss , -1)
player:teleportTo(player:getTown():getTemplePosition())
player:setHealth(player:getMaxHealth())
local killer = prekiller
if prekiller:getMaster() and prekiller:getMaster():isPlayer() then
killer = prekiller:getMaster()
end
if killer:isPlayer() then
		local targetGuild = player:getGuild()
		targetGuild = targetGuild and targetGuild:getId() or 0
		if targetGuild ~= 0 then
			local killerGuild = killer:getGuild()
			killerGuild = killerGuild and killerGuild:getId() or 0
			if killerGuild ~= 0 and targetGuild ~= killerGuild and isInWar(player, killer) then
				local warId = false
				local frags_limit = 0
				resultId = db.storeQuery('SELECT `id`, `frags_limit` FROM `guild_wars` WHERE `status` = 1 AND ((`guild1` = ' .. killerGuild .. ' AND `guild2` = ' .. targetGuild .. ') OR (`guild1` = ' .. targetGuild .. ' AND `guild2` = ' .. killerGuild .. '))')
				if resultId ~= false then
					warId = result.getNumber(resultId, 'id')
					frags_limit = result.getNumber(resultId, 'frags_limit')
					result.free(resultId)
				end
				
				if warId ~= false then
				if frags_limit > 0 and getGuildKills(killerGuild, warId)+1 >= frags_limit then
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
	return false
end
end
return true
end
playerPrepareDeath:register()

local playerLogin = CreatureEvent("CityWarLogin")
function playerLogin.onLogin(cid)
-- This function shouldnt be triggered, but just in case the player got kicked somehow
local player = Player(cid)
if player:getStorageValue(warStorages.inArena) == 1 then
player:setStorageValue(warStorages.inArena, -1)
player:setStorageValue(warStorages.areaRunes , -1)
player:setStorageValue(warStorages.ueSpells , -1)
player:setStorageValue(warStorages.ssaMight , -1)
player:setStorageValue(warStorages.summons , -1)
end
return true
end
playerLogin:register()
