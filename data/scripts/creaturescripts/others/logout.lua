local playerLogout = CreatureEvent("PlayerLogout")
function playerLogout.onLogout(player)
	if nextUseStaminaTime[playerId] ~= nil then
		nextUseStaminaTime[playerId] = nil
	end
	player:saveSpecialStorage()
	player:setStorageValue(Storage.ExerciseDummyExhaust, 0)

	local stats = player:inBossFight()
	if stats then
		local boss = Monster(stats.bossId)
		-- Player logged out (or died) in the middle of a boss fight, store his damageOut and stamina
		if boss then
			local dmgOut = boss:getDamageMap()[playerId]
			if dmgOut then
				stats.damageOut = (stats.damageOut or 0) + dmgOut.total
			end
			stats.stamina = player:getStamina()
		end
	end

	
	if onExerciseTraining[playerId] then
		stopEvent(onExerciseTraining[playerId].event)
		onExerciseTraining[playerId] = nil
		player:setTraining(false)
	end

	player:setStorageValue(17101,0)
	return true
end
playerLogout:register()
