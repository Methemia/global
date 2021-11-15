
local portals = {
	[59702] = {position = Position(33987, 31001, 9)}
}

local teleportRotten = MoveEvent()

function teleportRotten.onStepIn(creature, item, position, fromPosition)
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

teleportRotten:type("stepin")
teleportRotten:uid(59702)
teleportRotten:register()
