local handofinquisition2 = Action()
function handofinquisition2.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		if player:getStorageValue(414328) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this addon.")
		player:getPosition():sendMagicEffect(3)
		return true
	end
		
    	player:setStorageValue(414328, 2)
	player:getPosition():sendMagicEffect(15)
	item:remove(1)
		player:addOutfitAddon(1243, 2)
		player:addOutfitAddon(1244, 2)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
	return true
end
handofinquisition2:id(36572)
handofinquisition2:register()