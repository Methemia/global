local tilelevel = MoveEvent()
function tilelevel.onStepIn(cid, item, position, fromPosition)
if getPlayerLevel(cid) >= 1 then
return true
else
doplayer:sendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "level 100 to pass this tile")
doTeleportThing(cid, fromPosition, false)
end
end
tilelevel:aid(45739)
tilelevel:register()