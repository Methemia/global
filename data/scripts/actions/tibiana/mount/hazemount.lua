local hazemount = Action()
function hazemount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(414333) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this mount.")
		player:getPosition():sendMagicEffect(3)
		return true
	end
		
    	player:setStorageValue(414333, 2)
	player:getPosition():sendMagicEffect(15)
	item:remove(1)
		player:addMount(162)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
	return true
end
hazemount:id(37464)
hazemount:register()