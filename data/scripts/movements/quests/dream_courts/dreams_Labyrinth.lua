local dreamLabyrinth = MoveEvent()

function dreamLabyrinth.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local Dreams = Position(32208, 32093, 13)
	player:teleportTo(Dreams)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	Dreams:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

dreamLabyrinth:type("stepin")
dreamLabyrinth:aid(45740)
dreamLabyrinth:register()