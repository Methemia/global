
local portals = {
	[63021] = {position = Position(33619, 32528, 15)},
}

local cathedral = MoveEvent()

function cathedral.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals[item.uid]
	if portal then
		player:teleportTo(portal.position)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You traverse the rubble with ease but more of it falls down behind you, essentially blocking your path once again.")
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

cathedral:type("stepin")
cathedral:uid(63021)
cathedral:register()
