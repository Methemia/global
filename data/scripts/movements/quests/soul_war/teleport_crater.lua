
local portals = {
	[59705] = {position = Position(33864, 31833, 3)}
}

local teleportCrater = MoveEvent()

function teleportCrater.onStepIn(creature, item, position, fromPosition)
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

teleportCrater:type("stepin")
teleportCrater:uid(59705)
teleportCrater:register()
