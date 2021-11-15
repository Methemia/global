local goCentreBack = MoveEvent()

function goCentreBack.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local CentreBack = Position(33537, 31440, 9)
	player:teleportTo(CentreBack)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	CentreBack:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goCentreBack:type("stepin")
goCentreBack:aid(45756)
goCentreBack:register()