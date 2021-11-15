local pz = TalkAction("!pz")
function pz.onSay(player, words, param, channel)
if not player:isPzLocked() then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You don\'t have Pz')
    return false
end
 
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait " .. (math.floor(player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT):getEndTime() / 1000) - os.time()) .. " second for pz.")
    return false
end
pz:register()