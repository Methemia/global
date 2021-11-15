local config = {
	maxPlayersUntilBonusStop = 8,
	totalPlayersWhileBonusApplies = 4,
	dropToActualPlayers = true, -- true = it will be like 1,2,3,4,4,4,4,4,9,10 ... so the difference will be very notorious, on false = 1,2,3,4,4,4,4,4,5,6
}

function Party:onJoin(player)
	return true
end

function Party:onLeave(player)
	return true
end

function Party:onDisband()
	return true
end

function Party:onShareExperience(exp)
	local sharedExperienceMultiplier = 1.20 --20%
	local vocationsIds = {}

	local vocationId = self:getLeader():getVocation():getBase():getId()
	if vocationId ~= VOCATION_NONE then
		table.insert(vocationsIds, vocationId)
	end

	for _, member in ipairs(self:getMembers()) do
		vocationId = member:getVocation():getBase():getId()
		if not table.contains(vocationsIds, vocationId) and vocationId ~= VOCATION_NONE then
			table.insert(vocationsIds, vocationId)
		end
	end

	local size = #vocationsIds
	if size > 1 then
		sharedExperienceMultiplier = 1.0 + ((size * (5 * (size - 1) + 10)) / 100)
	end
	
	local members = #self:getMembers() + 1
	
	if members > config.totalPlayersWhileBonusApplies then
		if config.dropToActualPlayers == false then
			members = config.totalPlayersWhileBonusApplies + math.max(0, members - config.maxPlayersUntilBonusStop)
		else
			members = members > config.maxPlayersUntilBonusStop and members or config.totalPlayersWhileBonusApplies
		end
	end
		
	

	return (exp * sharedExperienceMultiplier) / members
end
