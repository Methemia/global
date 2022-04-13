local goPos = {x = 33681, y = 32382, z = 15}

local ancientEntrance = Action()
function ancientEntrance.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return
    end

	if player:getItemCount(30758) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the key.")
		return false
	end


    if player:getLevel() >= 100 then
        position:sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(goPos)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendCancelMessage('You do not have enough level.')
    end
end

ancientEntrance:id(32013)
ancientEntrance:register()
