local zarganashEntrance = MoveEvent()

function zarganashEntrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local Zarganash = Position(33648, 31444, 10)
	player:teleportTo(Zarganash)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	Zarganash:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

zarganashEntrance:type("stepin")
zarganashEntrance:aid(45745)
zarganashEntrance:register()