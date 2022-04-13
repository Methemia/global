local SoulWarEnter = MoveEvent()
local destinations = {
	[44281] = Position(33621, 31428, 10)
}

function SoulWarEnter.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getLevel() < 400 then
		player:teleportTo(fromPosition)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You're not a Level 400.")
		return true
	end

	player:teleportTo(destinations[item.actionid])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

SoulWarEnter:aid(44281)
SoulWarEnter:register()
