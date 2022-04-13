
local portals = {
	[59707000] = {position = Position(33619, 31429, 10)}
}

local teleportsSoulWar = MoveEvent()

function teleportsSoulWar.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals[item.uid]
	if portal then
		player:teleportTo(portal.position)
		item:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
	end
	return true
end

teleportsSoulWar:type("stepin")
teleportsSoulWar:uid(59707000)
teleportsSoulWar:register()
