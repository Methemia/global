local mageDoll = Action()
function mageDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getLevel() < 50 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need level 50.")
		player:getPosition():sendMagicEffect(3)
		return true
	end
		
    	player:addMount(math.random(187))
    	player:setStorageValue(432363, 1)
	player:getPosition():sendMagicEffect(15)
	item:remove(1)		
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
	return true
end
mageDoll:id(24808)
mageDoll:register()