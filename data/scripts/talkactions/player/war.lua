local war = TalkAction("!war")
local minPlayersOnline = 1
local minLevel = 100

local function hasMinimumMembersInGuild(guild)
    local membersOnline = guild:getMembersOnline()
    local total = 0
    for _, member in ipairs(membersOnline) do
        if member:getLevel() >= minLevel then
            total = total + 1
        end
    end

    if total >= minPlayersOnline then
        return true
    end

    return false
end

function war.onSay(player, words, param)
    local guild = player:getGuild()
    if not guild then
        player:sendCancelMessage("You need to be in a guild to use this command.")
        return false
    end

    if player:getGuildLevel() ~= 3 then
        player:sendCancelMessage("You need to be a guild leader to use this command.")
        return false
    end

    local p = param:split(',')
    local action, targetGuildName = p[1], p[2]
    if not action or not targetGuildName then
        player:popupFYI('Utilize o comando corretamente:' .. '\n\n' .. '\n\n AVISO\n\n GUILDS NAME DUTY IS EQUAL TO SITE \n\nPara invitar warmode contra a guild Undead por 30 frags:\n' .. '--> !war invite,Undead,30' .. '\n\n' .. 'Para aceitar o pedido de warmode contra a guild Undead:\n' .. '--> !war accept,Undead' .. '\n\n' .. 'Para rejeitar o pedido de warmode da guild Undead:\n' .. '--> !war reject,Undead' .. '\n\n' .. 'Para cancelar o pedido de warmode da guild Undead:\n' .. '--> !war cancel,Undead' .. '\n\n' .. 'Para terminar a warmode contra a guild Undead:\n' .. '--> !war end,Undead')
        return true
    end

    local resultName = db.storeQuery(string.format('SELECT `id` FROM `guilds` WHERE `name` = %s', db.escapeString(targetGuildName)))
    if not resultName then
        player:sendCancelMessage(string.format("A guild %s nao existe.", targetGuildName))
        return false
    end

    local targetGuildId = result.getNumber(resultName, "id")
    result.free(resultName)

    local guildId, guildName = guild:getId(), guild:getName()
    if action:lower() == "invite" then
        if not hasMinimumMembersInGuild(guild) then
            player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Voce precisa ter no m�nimo %d player%s online na sua Guild que sejam maior que o level %d para usar esse comando.', minPlayersOnline, minPlayersOnline ~= 1 and 's', minLevel))
            return false
        end

        if #p ~= 3 then
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'Por favor utilize o comando corretamente:\n!war invite, nome_da_guild_inimiga, frags\n\nPor exemplo:\n!war invite,Blackout,100')
            return false
        end

        local frags = p[3]
        if targetGuildName:lower() == guildName:lower() or guildId == targetGuildId then
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce nao pode invitar a sua propria guild para warmode.")
            return false
        end

        local resultInvite = db.storeQuery(string.format("SELECT `id` FROM `guild_wars` WHERE (((guild1 = %d AND guild2 = %d) OR (guild1 = %d AND guild2 = %d)) AND (status = 0 OR status = 1))", guildId, targetGuildId, targetGuildId, guildId))
        if resultInvite then
            player:sendCancelMessage("Voce ja enviou um convite de warmode para essa guild.")
            result.free(resultInvite)
            return false
        end
       
        local fragsLimit = tonumber(frags)
        if not fragsLimit then
            player:sendCancelMessage("Por favor utilize so numeros nos frags.")
            return false
        end

        if fragsLimit < 20 or fragsLimit > 999 then
            player:sendCancelMessage("A quantidade minima eh de 20 frags e 999 a maxima.")
            return false
        end
       
        db.query(string.format('INSERT INTO `guild_wars`(`guild1`, `guild2`, `name1`, `name2`, `status`, `started`, `ended`, `frags_limit`) VALUES (%d, %d, %s, %s, %d, %d, %d, %d)', guildId, targetGuildId, db.escapeString(guildName), db.escapeString(targetGuildName), 0, 0, 0, fragsLimit))
        Game.broadcastMessage(string.format('[WARMODE] %s invitou a guild %s para warmode de %d frags!', guild:getName(), targetGuildName, fragsLimit), MESSAGE_EVENT_ADVANCE)
    elseif action:lower() == "accept" then
        if not hasMinimumMembersInGuild(guild) then
            player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Voce precisa ter no minimo %d player%s online na sua Guild que sejam maior que o level %d para usar esse comando.', minPlayersOnline, minPlayersOnline ~= 1 and 's', minLevel))
            return false
        end

        local acceptResult = db.storeQuery(string.format("SELECT `id`, `guild1`, `guild2` FROM `guild_wars` WHERE (`status` = 0 AND (name1 = %s AND name2 = %s) OR (name2 = %s AND name1 = %s))", db.escapeString(targetGuildName), db.escapeString(guildName), db.escapeString(guildName), db.escapeString(targetGuildName)))
        if not acceptResult then
            player:sendCancelMessage('You have no pending warmode invitations against this guild.')
            return false
        end
       
        local invitationId = result.getNumber(acceptResult, "id")
        local guildInvited = result.getNumber(acceptResult, "guild1")
        local guildReceived = result.getNumber(acceptResult, "guild2")
        result.free(acceptResult)
        if guildInvited == guildId then
            player:sendCancelMessage('You cannot accept a Warmode that you were the one who invented.')
            return false
        end

        db.query(string.format('UPDATE `guild_wars` SET `status` = 1, `started` = %d WHERE `id` = %d', os.time(), invitationId))
        Game.broadcastMessage(string.format('[WARMODE] A guild %s aceitou o pedido de warmode da guild %s.', guildName, targetGuildName), MESSAGE_EVENT_ADVANCE)
    elseif action:lower() == "reject" then   
        if not hasMinimumMembersInGuild(guild) then
            player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Voce precisa ter no minimo %d player%s online na sua Guild que sejam maior que o level %d para usar esse comando.', minPlayersOnline, minPlayersOnline ~= 1 and 's', minLevel))
            return false
        end

        local rejectId = db.storeQuery(string.format("SELECT `id`, `guild1`, `guild2` FROM `guild_wars` WHERE (`status` = 0 AND (name1 = %s AND name2 = %s) OR (name2 = %s AND name1 = %s))", db.escapeString(targetGuildName), db.escapeString(guildName), db.escapeString(guildName), db.escapeString(targetGuildName)))
        if not rejectId then
            player:sendCancelMessage('You have no pending warmode invitations against this guild.')
            return false
        end

        local invitationId = result.getNumber(rejectId, "id")
        local guildInvited = result.getNumber(rejectId, "guild2")
        result.free(rejectId)
        if guildInvited == guildId then
            player:sendCancelMessage('You cant reject a Warmode.')
            return false
        end
       
        db.query(string.format('UPDATE `guild_wars` SET `status` = 2 WHERE `id` = %d', invitationId))
        Game.broadcastMessage(string.format('A guild %s rejeitou o pedido de warmode da guild %s.', guildName, targetGuildName), MESSAGE_EVENT_ADVANCE)
    elseif action:lower() == "end" then       
        local endResult = db.storeQuery(string.format("SELECT `id`, `guild1`, `guild2` FROM `guild_wars` WHERE (`status` = 1 AND (name1 = %s AND name2 = %s) OR (name2 = %s AND name1 = %s))", db.escapeString(targetGuildName), db.escapeString(guildName), db.escapeString(guildName), db.escapeString(targetGuildName)))
        if not endResult then
            player:sendCancelMessage('Currently your guild is not in any active warmode with that guild.')
            return false
        end

        local warId = result.getNumber(endResult, "id")   
        local guildInvited = result.getNumber(endResult, "guild1")
        local guildReceived = result.getNumber(endResult, "guild2")
        result.free(endResult)

        db.query(string.format('UPDATE `guild_wars` SET `status` = 4, `ended` = %d WHERE `id` = %d', os.time(), warId))
        Game.broadcastMessage(string.format('A guild %s encerrou a warmode contra a guild %s.', guildName, targetGuildName), MESSAGE_EVENT_ADVANCE)
    elseif action:lower() == "cancel" then   
        if not hasMinimumMembersInGuild(guild) then
            player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Voce precisa ter no minimo %d player%s online na sua Guild que sejam maior que o level %d para usar esse comando.', minPlayersOnline, minPlayersOnline ~= 1 and 's', minLevel))
            return false
        end

        local resultCancel = db.storeQuery(string.format("SELECT `id`, `guild1` FROM `guild_wars` WHERE (`status` = 0 AND (name1 = %s AND name2 = %s) OR (name2 = %s AND name1 = %s))", db.escapeString(targetGuildName), db.escapeString(guildName), db.escapeString(guildName), db.escapeString(targetGuildName)))
        if not resultCancel then
            player:sendCancelMessage('You have no pending warmode invitations against this guild.')
            return false
        end

        local invitationId = result.getNumber(resultCancel, "id")
        local guildInvited = result.getNumber(resultCancel, "guild1")
        result.free(resultCancel)
        if guildInvited ~= guildId then
            player:sendCancelMessage('You cannot cancel a War that was not you who invoked.')
            return false
        end
       
        db.query(string.format('UPDATE `guild_wars` SET `status` = 3 WHERE `id` = %d', invitationId))
        Game.broadcastMessage(string.format('A guild %s cancelou o pedido de warmode a guild %s.', guildName, targetGuildName), MESSAGE_EVENT_ADVANCE)
    end
   
    return false
end
war:separator(" ")
war:register()