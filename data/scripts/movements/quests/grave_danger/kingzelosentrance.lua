local zelosEntrance = MoveEvent()
function zelosEntrance.onStepIn(creature, item, position, fromPosition)
if not creature:isPlayer() then return false end
local player = creature
local bosses = {"Rewar the Bloody", "Regenerating Mass", "Nargol the Impaler", "Magnor Mournbringer", "The Red Knight"}
for _, name in pairs(bosses) do
if Creature(name) then
player:teleportTo(fromPosition)
return true
end
end

if Game.getStorageValue(Storage.GraveDangerBosses.KingZelos.Summoned) ~= 1 then

Game.setStorageValue(Storage.GraveDangerBosses.KingZelos.Summoned, 1)
end

player:teleportTo(Position(33443, 31536, 13))
Position(33443, 31536, 13):sendMagicEffect(CONST_ME_TELEPORT)
position:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
zelosEntrance:aid(50426)
zelosEntrance:register()
