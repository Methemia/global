
local portals = {
	[59706] = {position = Position(33886, 31188, 10)}
}

local teleportInferno = MoveEvent()

function teleportInferno.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals[item.uid]
	if portal then
		player:teleportTo(portal.position)
		item:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
	end
	return true
end

teleportInferno:type("stepin")
teleportInferno:uid(59706)
teleportInferno:register()
