local goSouth = MoveEvent()

function goSouth.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local South = Position(33572, 31466, 9)
	player:teleportTo(South)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	South:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goSouth:type("stepin")
goSouth:aid(45757)
goSouth:register()