local emote = TalkAction("!emote9")
function emote.onSay(player, words, param)
    local storage = player:getStorageValue(203500)
    player:sendCancelMessage((storage > 0 and "Desactivaste" or "Activaste") .. " los spells en naranja.")
    player:setStorageValue(203500, storage * -1)
    return false
end

emote:register()