local goPos = {x = 32682, y = 31507, z = 10}

local escaleraHiddencity = Action()
function escaleraHiddencity.onUse(creature, item, position, fromPosition, pos, target, toPosition)
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

escaleraHiddencity:aid(50587)
escaleraHiddencity:register()
