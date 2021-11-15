local handofinquisition = Action()
function handofinquisition.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(414329) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this addon.")
		player:getPosition():sendMagicEffect(3)
		return true
	end
		
    	player:setStorageValue(414329, 2)
	player:getPosition():sendMagicEffect(15)
	item:remove(1)
		player:addOutfitAddon(1243, 1)
		player:addOutfitAddon(1244, 1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
	return true
end
handofinquisition:id(36573)
handofinquisition:register()