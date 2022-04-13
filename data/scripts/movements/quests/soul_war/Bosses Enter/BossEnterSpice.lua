local EnterSpice = MoveEvent()

function EnterSpice.onStepIn(creature, item, toPosition, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end


	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getStorageValue(Storage.Tibiana.SoulWarEnd) < 2 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need mission.")
		creature:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations!")

	local accessPosition = Position(34101, 31063, 11)
	player:teleportTo(accessPosition)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	accessPosition:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

EnterSpice:aid(59131)
EnterSpice:register()
