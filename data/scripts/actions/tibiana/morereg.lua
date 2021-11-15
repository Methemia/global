local moreRegen = Action()

function moreRegen.onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    if player:getStorageValue(261400) >= os.time() then
        player:say('You already have more regenearion!', TALKTYPE_MONSTER_SAY)
        return true
    end

    player:setStorageValue(261400, os.time() + 24 * 60 * 60)
    Item(item.uid):remove(1)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your 24 hour of more regeneration has started!')
    return true
end
moreRegen:id(253780)
moreRegen:register()