local EnterReward = MoveEvent()

function EnterReward.onStepIn(creature, item, toPosition, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end


	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getStorageValue(Storage.Tibiana.SoulWarEnd) < 7 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need finish the mission.")
		creature:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations!")

	local accessPosition = Position(33621, 31412, 10)
	player:teleportTo(accessPosition)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	accessPosition:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

EnterReward:aid(59311)
EnterReward:register()
