local PirateTailsKills = CreatureEvent("PirateTailsKills23")
function PirateTailsKills.onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	if player:getStorageValue(Storage.PiratsTails.Questline) == 3 then
if target:getName() == "Troll" then
player:setStorageValue(Storage.PiratsTails.RatMiral.BossKill2, 1)
player:setStorageValue(Storage.PiratsTails.RatMiral.Counter, player:getStorageValue(Storage.PiratsTails.RatMiral.Counter) + 1)
				
				end
				end
	return true
end
PirateTailsKills:register()
