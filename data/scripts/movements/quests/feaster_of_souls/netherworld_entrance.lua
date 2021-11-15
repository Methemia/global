local netherworldEntrance = MoveEvent()

function netherworldEntrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local Netherworld = Position(33613, 31415, 8)
	player:teleportTo(Netherworld)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	Netherworld:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

netherworldEntrance:type("stepin")
netherworldEntrance:aid(45746)
netherworldEntrance:register()