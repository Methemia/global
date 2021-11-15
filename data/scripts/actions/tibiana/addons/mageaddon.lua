local mageDoll = Action()
function mageDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(432363) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this addon.")
		player:getPosition():sendMagicEffect(3)
		return true
	end
		
    	player:setStorageValue(432363, 1)
	player:getPosition():sendMagicEffect(15)
	item:remove(1)
	player:addOutfitAddon(130, 1)	
	player:addOutfitAddon(130, 2)		
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
	return true
end
mageDoll:id(2480899)
mageDoll:register()