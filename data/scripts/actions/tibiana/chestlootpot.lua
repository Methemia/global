local lootpotionchest = Action()
function lootpotionchest.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	if player:getStorageValue(81797) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this reward.")
		player:getPosition():sendMagicEffect(3)
		return true
	end

        player:getDepotChest(1, true):addItem(40812,1) -- minorboost 
	player:setStorageValue(81797, 1)
	player:getPosition():sendMagicEffect(15)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations, you gain a Loot Potion! the item was sent to your Depot")
	return true
end
lootpotionchest:uid(9685)
lootpotionchest:register()