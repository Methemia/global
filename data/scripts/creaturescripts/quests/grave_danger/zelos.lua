
local zelosEvent = CreatureEvent("king_zelos")
function zelosEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
return primaryDamage, primaryType, secondaryDamage, secondaryType
end
local resistimer = creature:getStorageValue(Storage.GraveDangerBosses.KingZelos.ResistanceTimer)
local newdamage = 1
if resistimer >= 720 then
newdamage = 0.1
elseif resistimer >= 660 then
newdamage = 0.4
elseif resistimer >= 500 then
newdamage = 0.7
end

return primaryDamage*newdamage, primaryType, secondaryDamage*newdamage, secondaryType
end
zelosEvent:register()
