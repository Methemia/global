local goPos = {x = 33639, y = 32560, z = 13}

local facelessBaneTP = Action()
function facelessBaneTP.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return
    end

    if player:getLevel() >= 200 then
        position:sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(goPos)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All chants have been sung in the right order, you are deemed worthy. You are transported away...")
    else
        player:sendCancelMessage('You do not have enough level.')
    end
end

facelessBaneTP:aid(64020)
facelessBaneTP:register()