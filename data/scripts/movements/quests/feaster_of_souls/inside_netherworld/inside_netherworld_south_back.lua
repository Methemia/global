local goSouthBack = MoveEvent()

function goSouthBack.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local SouthBack = Position(33556, 31467, 9)
	player:teleportTo(SouthBack)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	SouthBack:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goSouthBack:type("stepin")
goSouthBack:aid(45758)
goSouthBack:register()