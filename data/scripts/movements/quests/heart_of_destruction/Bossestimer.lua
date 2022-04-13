local setting = {
		[47491] = {storage = Storage.Tibiana.Anomaly},
		[47496] = {storage = Storage.Tibiana.Realityquake},
		[47492] = {storage = Storage.Tibiana.Rupture},
		[47493] = {storage = Storage.Tibiana.Outburst},
		[47494] = {storage = Storage.Tibiana.Eradicator},
		[47495] = {storage = Storage.Tibiana.DevourerStorage}
	}

local bossTimer = MoveEvent()

function bossTimer.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local bossTimer = setting[item.actionid]
	if bossTimer then
		if player:getStorageValue(bossTimer.storage) > os.time() then
			player:sendCancelMessage("You need to wait for 20 hours to face this boss again.")
			player:teleportTo(fromPosition)
			return false
		end
	end
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

bossTimer:type("stepin")

for index, value in pairs(setting) do
	bossTimer:aid(index)
end

bossTimer:register()
