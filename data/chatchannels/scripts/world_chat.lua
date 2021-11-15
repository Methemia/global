function onSpeak(player, type, message)
    local type = TALKTYPE_CHANNEL_Y
    local acc = player:getAccountType()
    if acc >= ACCOUNT_TYPE_GAMEMASTER then
        type = TALKTYPE_CHANNEL_R1
    elseif acc >= ACCOUNT_TYPE_TUTOR then
        type = TALKTYPE_CHANNEL_O
    end
    return type
end