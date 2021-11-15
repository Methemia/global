local cobraBastionenter = MoveEvent()
local destinations = {
	[60391] = Position(33385, 32627, 7)
}

function cobraBastionenter.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getLevel() < 250 then
		player:teleportTo(fromPosition)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You're not a Level 250.")
		return true
	end

	player:teleportTo(destinations[item.actionid])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

cobraBastionenter:aid(60391)
cobraBastionenter:register()
