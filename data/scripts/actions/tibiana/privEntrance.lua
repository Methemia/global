local goPos = {x = 517, y = 441, z = 7}

local PrivEntrance = Action()
function PrivEntrance.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return
    end

if not player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage('Destination require you in PZ.')
        return false
    end


    if player:getStorageValue(417360) > 0 then
        position:sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(goPos)
	player:addMount(126)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendCancelMessage('You do not have permission.')
    end
end

PrivEntrance:id(24807)
PrivEntrance:register()
