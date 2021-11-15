local goPos = {x = 33850, y = 31820, z = 8}

local barrenDriftCentre = Action()
function barrenDriftCentre.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return
    end

    if player:getLevel() >= 1 then
        player:teleportTo(goPos)
        player:getPosition()
    else
        player:sendCancelMessage('You do not have enough level.')
    end
end

barrenDriftCentre:aid(64222)
barrenDriftCentre:register()
