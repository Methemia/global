local Poltergeist = Action()
function Poltergeist.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(414330) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this addon.")
		player:getPosition():sendMagicEffect(3)
		return true
	end
		
    	player:setStorageValue(414330, 2)
	player:getPosition():sendMagicEffect(15)
	item:remove(1)
		player:addOutfitAddon(1271, 1)
		player:addOutfitAddon(1270, 1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
	return true
end
Poltergeist:id(37465)
Poltergeist:register()