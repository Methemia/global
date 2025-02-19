local statues = {
	[18488] = SKILL_SWORD,
	[18489] = SKILL_AXE,
	[18490] = SKILL_CLUB,
	[18491] = SKILL_DISTANCE,
	[18492] = SKILL_MAGLEVEL
}

local offlineTraining = Action()

function offlineTraining.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local skill = statues[item:getId()]
	if player:isPzLocked() then
		return false
	end
	player:setOfflineTrainingSkill(skill)
	player:remove()
	return true
end

for index, value in pairs(statues) do
	offlineTraining:id(index)
end

offlineTraining:register()
