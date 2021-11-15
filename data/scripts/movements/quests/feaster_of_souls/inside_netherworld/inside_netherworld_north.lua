local goNorth = MoveEvent()

function goNorth.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local North = Position(33542, 31411, 9)
	player:teleportTo(North)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	North:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goNorth:type("stepin")
goNorth:aid(45753)
goNorth:register()