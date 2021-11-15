local barrenDriftThaianBack = MoveEvent()

function barrenDriftThaianBack.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local BarrenBack = Position(33850, 31814, 8)
	player:teleportTo(BarrenBack)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	BarrenBack:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

barrenDriftThaianBack:type("stepin")
barrenDriftThaianBack:aid(45760)
barrenDriftThaianBack:register()