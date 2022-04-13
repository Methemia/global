local goPos = {x = 34155, y = 30996, z = 11}

local HatredEntrance = Action()
function HatredEntrance.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return
    end

    if player:getStorageValue(Storage.Tibiana.SoulWarEnd) < 3 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need mission.")
	else
        position:sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(goPos)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        end
end

HatredEntrance:aid(59133)
HatredEntrance:register()
