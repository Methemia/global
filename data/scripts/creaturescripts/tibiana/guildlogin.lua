function table.size(t, deep)
    local size = 0
    for k, v in pairs(t) do
        size = size + 1
        if type(v) == 'table' and deep then
            size = size + table.size(v, deep)
        end
    end
    return size
end

local guildLogin = CreatureEvent("GuildLogin")

function guildLogin.onLogin(player)
    local playerGuild = player:getGuild() --get player guild
    if playerGuild then --if player have a guild
        local GuildOnlineMembers = playerGuild:getMembersOnline() --get all online player in player guild
        local realOnlineMembers = {} --empty table to hold all players that is online and don't have same ip; tableStructure = {[ip] = {playerOnThisIp}}
        for i = 1, #GuildOnlineMembers do --for each player in online members
            local tempPlayer = GuildOnlineMembers[i] --get player userdata
            if not realOnlineMembers[tempPlayer:getIp()] then --if don't exist index with tempPlayer ip
                realOnlineMembers[tempPlayer:getIp()] = {tempPlayer} --create a index with tempPlayer ip and store tempPlayer userdata as value
            else--if already exist tempPlayer IP as index
                table.insert(realOnlineMembers[tempPlayer:getIp()], tempPlayer) --insert player userdata in the IP index
            end
        end
        if table.size(realOnlineMembers) >= 4 then --get online ips in guild, if more than 5
			player:setStorageValue(1577534, 1)
            player:sendTextMessage(MESSAGE_LOOT, '[Boost]: You receive 10%+ for being in a guild only with 4 players or more. This applies to monster\'s.') --send msg to player
        end
    end
    return true
end
guildLogin:register()