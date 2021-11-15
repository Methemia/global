local barrenDriftExit = MoveEvent()

function barrenDriftExit.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local BarrenExit = Position(33220, 31704, 7)
	player:teleportTo(BarrenExit)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	BarrenExit:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

barrenDriftExit:type("stepin")
barrenDriftExit:aid(45749)
barrenDriftExit:register()