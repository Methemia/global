local setting = {
	[60390] = {effectTeleport = CONST_ME_GREEN_RINGS, newPosition = Position(33313, 32647, 6)},
	[603910] = {effectTeleport = CONST_ME_STONES, newPosition = Position(33385, 32627, 7)},
}

local cobraBastion = MoveEvent()

function cobraBastion.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
		if not player then
		return true
	end

	local teleport = setting[item.actionid]
	if teleport then
		local newPosition = teleport.newPosition
		player:teleportTo(newPosition)

		fromPosition:sendMagicEffect(teleport.effectTeleport)
		newPosition:sendMagicEffect(teleport.effectTeleport)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end
	return true
end

cobraBastion:type("stepin")

for index, value in pairs(setting) do
	cobraBastion:aid(index)
end

cobraBastion:register()
