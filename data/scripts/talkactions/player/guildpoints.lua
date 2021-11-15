local guildpoints = TalkAction("!guildsssspoints")
local config = {
        executeInterval = 4008,
        minimumLevel = 200,
        membersNeeded = 4,
        minimumDifferentIps = 4,
        pointAmount = 1
}

local function getValidAccounts(guild)
        local resultId = db.storeQuery('SELECT a.`id` FROM `accounts` a, `guild_membership` m, `players` p WHERE m.`guild_id` = ' ..guild:getId() .. ' AND p.`id` = m.`player_id` AND p.`level` > ' ..  config.minimumLevel .. ' and a.`id` = p.`account_id` AND a.`guild_points_stats` = 0 GROUP BY a.`id`;')
        if resultId == false then
                return {}
        end

        local accounts = {}
        repeat
                table.insert(accounts, result.getDataInt(resultId, 'id'))
        until not result.next(resultId)
        result.free(resultId)

        return accounts
end

function guildpoints.onSay(cid, words, param)
        local player = Player(cid)
        local guild = player:getGuild()
        if not guild or player:getGuildLevel() < 3 then
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:sendTextMessage(MESSAGE_INFO_DESCR, 'Only guild leader can request points.')
                return false
        end

        local resultId = db.storeQuery('SELECT `last_execute_points` FROM `guilds` WHERE id = ' .. guild:getId())
        if resultId == false then
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:sendCancelMessage('Error while running database query.')
                return false
        end

        local lastExecution = result.getDataInt(resultId, 'last_execute_points')
        result.free(resultId)
        if lastExecution >= os.time() then
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:sendTextMessage(MESSAGE_INFO_DESCR, 'The command can only be run once every ' ..config.executeInterval .. ' hours.')
                return false
        end

        local members = guild:getMembersOnline()
        for i = #members, 1, -1 do
                if members[i]:getLevel() < config.minimumLevel then
                        table.remove(members, i)
                end
        end

        if #members < config.membersNeeded then
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:sendTextMessage(MESSAGE_INFO_DESCR, 'Only ' .. #members .. ' guild members online, you need ' ..config.membersNeeded .. ' guild members with level ' .. config.minimumLevel .. ' or higher.')
                return false
        end

        local ipDictionary, ipCount = {}, 0
        for i = 1, #members do
                local ip = members[i]:getIp()
                if not ipDictionary[ip] then
                        ipDictionary[ip] = true
                        ipCount = ipCount + 1
                end
        end

        if ipCount < config.minimumDifferentIps then
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:sendTextMessage(MESSAGE_INFO_DESCR, 'Only ' .. ipCount .. ' members are valid, you need ' ..config.minimumDifferentIps .. ' players with different ip addresses.')
                return false
        end

        local validAccounts = getValidAccounts(guild)
        db.query('UPDATE `guilds` SET `last_execute_points` = ' .. (os.time() + config.executeInterval * 3600) .. ' WHERE `guilds`.`id` = ' .. guild:getId() .. ';')
        player:sendTextMessage(MESSAGE_INFO_DESCR, #validAccounts .. ' guild members received points.')
        if #validAccounts > 0 then
                db.query('UPDATE `accounts` SET `coins` = `coins` + ' .. config.pointAmount .. ', `guild_points_stats` = ' .. os.time() .. ' WHERE `id` IN (' .. table.concat(validAccounts, ',') .. ');')
                for i = 1, #members do
                        local member = members[i]
                        if isInArray(validAccounts, member:getAccountId()) then
				player:addItem(25378, 10)
                                member:sendTextMessage(MESSAGE_INFO_DESCR, 'You received ' .. config.pointAmount .. ' coins and 10 guild tokens.')
                        end
                end
        end
        return false
end
guildpoints:register()