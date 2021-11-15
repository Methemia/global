local goNorthBack = MoveEvent()

function goNorthBack.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local NorthBack = Position(33529, 31410, 9)
	player:teleportTo(NorthBack)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	NorthBack:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goNorthBack:type("stepin")
goNorthBack:aid(45754)
goNorthBack:register()