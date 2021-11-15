local PirateTailsKills = CreatureEvent("PirateTailsKills2")
function PirateTailsKills.onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	if player:getStorageValue(Storage.PiratsTails.Questline) == 2 then
if target:getName() == "Ratmiral Blackwhiskers" then
player:setStorageValue(Storage.PiratsTails.RatMiral.BossKill, 1)
player:setStorageValue(Storage.PiratsTails.RatMiral.ClickCounter, player:getStorageValue(Storage.PiratsTails.RatMiral.ClickCounter) + 1)
				
				end
				end
	return true
end
PirateTailsKills:register()
