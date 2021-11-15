local rewards = {
    { id = 38917, name = "Soulcutter" },
    { id = 38918, name = "Soulshredder" },
    { id = 38919, name = "Soulbiter" },
    { id = 38920, name = "Souleater" },
    { id = 38921, name = "Soulcrusher" },
    { id = 38922, name = "Soulmaimer" },
    { id = 38923, name = "Soulbleeder" },
    { id = 38924, name = "Soulpiercer" },
    { id = 38925, name = "Soultainter" },
    { id = 38926, name = "Soulhexer" },
    { id = 38927, name = "Soulshanks" },
    { id = 38928, name = "Soulstrider" },
    { id = 38929, name = "Soulshell" },
    { id = 38930, name = "Soulmantel" },
    { id = 38931, name = "Soulshroud" },
    { id = 38932, name = "Pair of Soulwalkers" },
    { id = 38933, name = "Pair of Soulstalkers" },
    { id = 38934, name = "Soulbastion" }
}

local bagyouDesireChest = Action()

function bagyouDesireChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]
	
	if player:getStorageValue(39425) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this reward.")
		player:getPosition():sendMagicEffect(3)
		return true
	end

	if player:getLevel() < 300 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You're not a Level 300.")
		return true
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received a ' .. rewardItem.name .. '.')
	player:addItem(rewardItem.id, 1)
	player:setStorageValue(39425, 1)
	return true
end


bagyouDesireChest:aid(38944)
bagyouDesireChest:register()