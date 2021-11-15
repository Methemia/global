function onSpeak(cid, type, message)
    local playerGroup = getPlayerGroupId(cid)
    if playerGroup == 1 then
        doPlayerSendCancel(cid, "You are not allowed to send messages on this channel.")
        return false
    end

    if playerGroup <= 1 then
        type = TALKTYPE_CHANNEL_Y
    elseif playerGroup > 1 and playerGroup <= 9 then
        type = TALKTYPE_CHANNEL_O
    else
        type = TALKTYPE_CHANNEL_R1
    end
    
    return type
end