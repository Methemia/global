
local portals = {
	[59713] = {position = Position(33947, 31027, 11)}
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
		player:getPosition():sendMagicEffect(CONST_ME_POISONAREA)
	end
	return true
end

teleportRotten:type("stepin")
teleportRotten:uid(59713)
teleportRotten:register()
