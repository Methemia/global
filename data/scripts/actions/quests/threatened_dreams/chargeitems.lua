local items = {
[29034] = {pos = Position(33515, 32167, 7), dist = 8, time = "day"},
[29032] = {pos = Position(33529, 32301, 4), dist = 8, time = "night"},
[29030] = {pos = Position(33523, 32212, 7), dist = 5, time = "night"},
}

local action = Action()
function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
if not items[item:getId()] then return false end
local data = items[item:getId()]
local position = player:getPosition()
if position.z ~= data.pos.z or position:getDistance(data.pos) > data.dist then
player:sendCancelMessage("No pareciera que puedes cargar el objeto aqui.")
position:sendMagicEffect(CONST_ME_POFF)
return true
end
local time = getWorldTime()
if (data.time == "day" and time >= 360 and time < 1080) or (data.time == "night" and (time >= 1080 or time < 360)) then
item:transform(item:getId() + 1)
position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Absorbiendo el poder del entorno, el objeto se carga satisfactoriamente.')
return true
else
player:sendCancelMessage("No parece ser la hora indicada para cargar el objeto.")
position:sendMagicEffect(CONST_ME_POFF)
return true
end
return false
end

action:id(29034)
action:id(29032)
action:id(29030)
action:register()
