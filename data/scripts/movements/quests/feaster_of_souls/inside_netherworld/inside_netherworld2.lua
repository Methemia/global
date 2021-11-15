local goEast = MoveEvent()

function goEast.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local East = Position(33546, 31444, 8)
	player:teleportTo(East)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	East:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goEast:type("stepin")
goEast:aid(45751)
goEast:register()