local barrenDriftThaian = MoveEvent()

function barrenDriftThaian.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local BarrenThaian = Position(33900, 31886, 8)
	player:teleportTo(BarrenThaian)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	BarrenThaian:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

barrenDriftThaian:type("stepin")
barrenDriftThaian:aid(45759)
barrenDriftThaian:register()