local stonemosaic = {
[1] = {pos = Position({x = 33484, y = 32192, z = 7}), storage = Storage.ThreatenedDreams.StoneMosaic1},
[2] = {pos = Position({x = 33546, y = 32155, z = 7}), storage = Storage.ThreatenedDreams.StoneMosaic2},
[3] = {pos = Position({x = 33547, y = 32206, z = 7}), storage = Storage.ThreatenedDreams.StoneMosaic3},
[4] = {pos = Position({x = 33568, y = 32243, z = 7}), storage = Storage.ThreatenedDreams.StoneMosaic4},
[5] = {pos = Position({x = 33419, y = 32242, z = 7}), storage = Storage.ThreatenedDreams.StoneMosaic5},
}

local dreambirdtree = {
[1] = {pos = Position({x = 33458, y = 32299, z = 7}), storage = Storage.ThreatenedDreams.DreamBirdTree1},
[2] = {pos = Position({x = 33541, y = 32244, z = 7}), storage = Storage.ThreatenedDreams.DreamBirdTree2},
[3] = {pos = Position({x = 33562, y = 32256, z = 7}), storage = Storage.ThreatenedDreams.DreamBirdTree3},
[4] = {pos = Position({x = 33529, y = 32187, z = 7}), storage = Storage.ThreatenedDreams.DreamBirdTree4},
[5] = {pos = Position({x = 33442, y = 32201, z = 7}), storage = Storage.ThreatenedDreams.DreamBirdTree5},
}

local moonsculpture = {
[1] = {pos = Position({x = 33511, y = 32320, z = 6}), storage = Storage.ThreatenedDreams.MoonSculpture1},
[2] = {pos = Position({x = 33518, y = 32193, z = 7}), storage = Storage.ThreatenedDreams.MoonSculpture2},
[3] = {pos = Position({x = 33549, y = 32219, z = 7}), storage = Storage.ThreatenedDreams.MoonSculpture3},
[4] = {pos = Position({x = 33386, y = 32215, z = 7}), storage = Storage.ThreatenedDreams.MoonSculpture4},
[5] = {pos = Position({x = 33597, y = 32182, z = 7}), storage = Storage.ThreatenedDreams.MoonSculpture5},
}

local barrer = Action()
function barrer.onUse(player, item, fromPosition, target, toPosition, isHotkey)
if player:getStorageValue(Storage.ThreatenedDreams.FinalMission) == 4 then
local time = getWorldTime()
if item.itemid == 29035 then
for _, data in pairs(stonemosaic) do
if toPosition == data.pos then
if not (time >= 360 and time < 1080) then
player:sendCancelMessage("No es la hora correcta para reparar la barrera")
fromPosition:sendMagicEffect(CONST_ME_POFF)
return true
end
if player:getStorageValue(data.storage) == -1 then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Con un fuerte ruido, oyes como la barrera se repara')
toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
player:setStorageValue(data.storage, 1)
player:setStorageValue(Storage.ThreatenedDreams.StoneMosaicCounter, player:getStorageValue(Storage.ThreatenedDreams.StoneMosaicCounter) + 1)
if player:getStorageValue(Storage.ThreatenedDreams.StoneMosaicCounter) == 5 then
item:transform(29213)
end
return true
else
player:sendCancelMessage("Ya reparaste la barrera en este punto")
fromPosition:sendMagicEffect(CONST_ME_POFF)
return true
end
end
end
elseif item.itemid == 29033 then
for _, data in pairs(dreambirdtree) do
if toPosition == data.pos then
if (time >= 360 and time < 1080) then
player:sendCancelMessage("No es la hora correcta para reparar la barrera")
fromPosition:sendMagicEffect(CONST_ME_POFF)
return true
end
if player:getStorageValue(data.storage) == -1 then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Con un fuerte ruido, oyes como la barrera se repara')
toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
player:setStorageValue(data.storage, 1)
player:setStorageValue(Storage.ThreatenedDreams.DreamBirdTreeCounter, player:getStorageValue(Storage.ThreatenedDreams.DreamBirdTreeCounter) + 1)
if player:getStorageValue(Storage.ThreatenedDreams.DreamBirdTreeCounter) == 5 then
item:transform(29212)
end
return true
else
player:sendCancelMessage("Ya reparaste la barrera en este punto")
fromPosition:sendMagicEffect(CONST_ME_POFF)
return true
end
end
end
elseif item.itemid == 29031 then
for _, data in pairs(moonsculpture) do
if toPosition == data.pos then
if (time >= 360 and time < 1080) then
player:sendCancelMessage("No es la hora correcta para reparar la barrera")
fromPosition:sendMagicEffect(CONST_ME_POFF)
return true
end
if player:getStorageValue(data.storage) == -1 then
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Con un fuerte ruido, oyes como la barrera se repara')
toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
player:setStorageValue(data.storage, 1)
player:setStorageValue(Storage.ThreatenedDreams.MoonSculptureCounter, player:getStorageValue(Storage.ThreatenedDreams.MoonSculptureCounter) + 1)
if player:getStorageValue(Storage.ThreatenedDreams.MoonSculptureCounter) == 5 then
item:transform(29211)
end
return true
else
player:sendCancelMessage("Ya reparaste la barrera en este punto")
fromPosition:sendMagicEffect(CONST_ME_POFF)
return true
end
end
end
end
end
return false
end

barrer:id(29035)
barrer:id(29031)
barrer:id(29033)
barrer:register()