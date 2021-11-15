local fairy = {
[1] = {pos = Position(33505, 32286, 8), storage = Storage.ThreatenedDreams.FairyFree1},
[2] = {pos = Position(33440, 32217, 8), storage = Storage.ThreatenedDreams.FairyFree2},
[3] = {pos = Position(33576, 32185, 8), storage = Storage.ThreatenedDreams.FairyFree3},
[4] = {pos = Position(33621, 32214, 8), storage = Storage.ThreatenedDreams.FairyFree4},
[5] = {pos = Position(33559, 32203, 9), storage = Storage.ThreatenedDreams.FairyFree5},
}

local action = Action()

local function fairyRevert(pos)
Tile(pos):getItemById(29086):transform(29085)
return true
end
function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
if player:getStorageValue(Storage.ThreatenedDreams.FinalMission) == 2 then
for _, data in pairs(fairy) do
if toPosition == data.pos then
if player:getStorageValue(data.storage) == -1 then
item:transform(29086)
addEvent(fairyRevert, 60000, toPosition)
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Liberaste al hada de la prision, mejor salir de aqui pronto.')
player:setStorageValue(data.storage, 1)
player:setStorageValue(Storage.ThreatenedDreams.FairyFreeCount, player:getStorageValue(Storage.ThreatenedDreams.FairyFreeCount) + 1)
return true
else
player:sendCancelMessage("Ya liberaste a esta hada")
fromPosition:sendMagicEffect(CONST_ME_POFF)
return true
end
end
end
end
return false
end

action:id(29085)
action:register()