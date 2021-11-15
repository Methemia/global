local GoldenOutfitDoll = Action()
function GoldenOutfitDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(414359) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this addon.")
		player:getPosition():sendMagicEffect(3)
		return true
	end
		
    	player:setStorageValue(414359, 2)
	player:getPosition():sendMagicEffect(15)
	item:remove(1)
		--player:addOutfitAddon(1210, 1)
		--player:addOutfitAddon(1210, 2)		
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
	return true
end
GoldenOutfitDoll:id(248089999)
GoldenOutfitDoll:register()