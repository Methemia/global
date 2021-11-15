local brainGroundsEntrance = MoveEvent()

function brainGroundsEntrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local BrainGrounds = Position(31915, 32355, 8)
	player:teleportTo(BrainGrounds)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	BrainGrounds:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

brainGroundsEntrance:type("stepin")
brainGroundsEntrance:aid(45747)
brainGroundsEntrance:register()