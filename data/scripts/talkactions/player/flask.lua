local baseStorage = 5000000
local vials = {7634, 7635, 7636}


local flask = TalkAction("!flask")

function removePlayerVials(cid)
    local player = Player(cid)
    if not player then
        return
    end

    if player:getStorageValue(baseStorage) < 1 then
 player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Flask System: OFF.")
        return player:returnVials()
    end

    for k,v in pairs(vials) do
        local count = player:getItemCount(v)
        if count > 0 then
            player:setStorageValue(v, math.max(player:getStorageValue(v), 0) + count)
            player:removeItem(v, count)
        end
    end
    addEvent(removePlayerVials, 1, player:getId())
end

function Player:returnVials()
    for k,v in pairs(vials) do
        local count = self:getStorageValue(v)
        if count > 0 then
            self:setStorageValue(v, 0)
        end
    end
end
function flask.onSay(player, words, param, channel)
    if player:getStorageValue(baseStorage) < 1 then
 player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Flask System: ON.")

        player:setStorageValue(baseStorage, 1)
        removePlayerVials(player:getId())
    else
        player:setStorageValue(baseStorage, 0)  
    end
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
    return false
end

flask:register()