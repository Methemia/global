local goPos = {x = 33850, y = 31814, z = 8}

local insideBarren = Action()
function insideBarren.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return
    end

    if player:getLevel() >= 1 then
        position:sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(goPos)
        player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
    else
        player:sendCancelMessage('You do not have enough level.')
    end
end

insideBarren:aid(64221)
insideBarren:register()
