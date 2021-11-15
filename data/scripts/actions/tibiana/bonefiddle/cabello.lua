local cabellos = Action()
function cabellos.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(34376) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this reward.")
		player:getPosition():sendMagicEffect(3)
		return true
	end
		
    	player:setStorageValue(34376, 1)
	player:addItem(33273)
	player:getPosition():sendMagicEffect(15)		
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
	return true
end
cabellos:aid(32756)
cabellos:register()
