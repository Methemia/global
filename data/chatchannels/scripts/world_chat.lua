function onSpeak(player, type, message)
local mutedstorage = 1501
    if player:getStorageValue(mutedstorage) > os.time() then
        player:sendCancelMessage("You have been muted, try again later.")
        return false
    end

    local type = TALKTYPE_CHANNEL_Y
    local acc = player:getAccountType()
    if acc >= ACCOUNT_TYPE_GAMEMASTER then
        type = TALKTYPE_CHANNEL_R1
    elseif acc >= ACCOUNT_TYPE_TUTOR then
        type = TALKTYPE_CHANNEL_O
    end
    return type
end