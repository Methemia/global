local ThaianBackEdron = MoveEvent()

function ThaianBackEdron.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local ThaianBack = Position(33220, 31705, 7)
	player:teleportTo(ThaianBack)
	fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	ThaianBack:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

ThaianBackEdron:type("stepin")
ThaianBackEdron:aid(45761)
ThaianBackEdron:register()