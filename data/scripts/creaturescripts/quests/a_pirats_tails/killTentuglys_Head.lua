local PirateTailsKills = CreatureEvent("PirateTailsKills")
function PirateTailsKills.onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	if player:getStorageValue(Storage.PiratsTails.Questline) == 1 then
if target:getName() == "Tentugly's Head" then
player:setStorageValue(Storage.PiratsTails.RatMiral.LastKilled, 1)
player:setStorageValue(Storage.PiratsTails.RatMiral.BossCounter, player:getStorageValue(Storage.PiratsTails.RatMiral.BossCounter) + 1)
				
				end
				end
	return true
end
PirateTailsKills:register()
