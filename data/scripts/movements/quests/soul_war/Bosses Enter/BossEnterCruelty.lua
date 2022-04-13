local EnterCruelty = MoveEvent()

function EnterCruelty.onStepIn(creature, item, toPosition, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end


	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getStorageValue(Storage.Tibiana.SoulWarEnd) < 4 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need mission.")
		creature:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations!")

	local accessPosition = Position(33869, 31865, 6)
	player:teleportTo(accessPosition)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	accessPosition:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

EnterCruelty:aid(38465)
EnterCruelty:register()
