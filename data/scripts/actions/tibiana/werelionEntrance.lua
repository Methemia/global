local goPos = {x = 33118, y = 32252, z = 10}

local werelionEntrance = Action()
function werelionEntrance.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return
    end

    if player:getLevel() >= 100 then
        position:sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(goPos)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendCancelMessage('You do not have enough level.')
    end
end

werelionEntrance:aid(64003)
werelionEntrance:register()
