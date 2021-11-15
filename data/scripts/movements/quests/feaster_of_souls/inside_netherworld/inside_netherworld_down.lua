local goDown = MoveEvent()

function goDown.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local Down = Position(33483, 31452, 9)
	player:teleportTo(Down)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	Down:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goDown:type("stepin")
goDown:aid(45752)
goDown:register()