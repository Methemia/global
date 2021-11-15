local killEvent = CreatureEvent("MiniRoshaKills")
function killEvent.onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	if player:getStorageValue(Storage.ThreatenedDreams.FinalMission) == 1 then
if target:getName() == "Kroazur" then
player:setStorageValue(Storage.ThreatenedDreams.KroazurKilled, 1)
elseif target:getName() == "Enfeebled Silencer" or target:getName() == "Weakened Frazzlemaw" then
				player:setStorageValue(Storage.ThreatenedDreams.MiniRoshaCounter, player:getStorageValue(Storage.ThreatenedDreams.MiniRoshaCounter) + 1)
				end
				end
	return true
end
killEvent:register()
