local goCentre = MoveEvent()

function goCentre.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local Centre = Position(33551, 31439, 9)
	player:teleportTo(Centre)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	Centre:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

goCentre:type("stepin")
goCentre:aid(45755)
goCentre:register()