local goWest = MoveEvent()

function goWest.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local ToIrgix = Position(33533, 31444, 8)
	player:teleportTo(ToIrgix)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	ToIrgix:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goWest:type("stepin")
goWest:aid(45750)
goWest:register()