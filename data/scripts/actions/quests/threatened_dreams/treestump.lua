local action = Action()
function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
if player:getStorageValue(Storage.ThreatenedDreams.RewardFinal1) ~= -1 then
player:sendCancelMessage("It's empty.")
return true
end
player:addItem(29030, 1)
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Entremedio de todo, notas que el dark moon mirror siempre estuvo aqui escondido.')
player:setStorageValue(Storage.ThreatenedDreams.RewardFinal1, 1)
return true
end

action:aid(48756)
action:register()
