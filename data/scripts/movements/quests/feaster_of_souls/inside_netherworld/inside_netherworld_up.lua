local goUp = MoveEvent()

function goUp.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local Up = Position(33486, 31435, 8)
	player:teleportTo(Up)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	Up:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goUp:type("stepin")
goUp:aid(45762)
goUp:register()