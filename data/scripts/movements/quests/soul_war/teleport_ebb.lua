
local portals = {
	[59703] = {position = Position(33881, 31002, 8)}
}

local teleportEbb = MoveEvent()

function teleportEbb.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals[item.uid]
	if portal then
		player:teleportTo(portal.position)
		item:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
	end
	return true
end

teleportEbb:type("stepin")
teleportEbb:uid(59703)
teleportEbb:register()
