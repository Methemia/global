local expPotion = Action()
function expPotion.onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    if player:getStorageValue(91340) >= os.time() then
        player:say('You already have double exp!', TALKTYPE_MONSTER_SAY)
        return true
    end

    player:setStorageValue(91340, os.time() + 3600)
    Item(item.uid):remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, 'Your hour of double XP has started!')
    return true
end
expPotion:id(41558)
expPotion:register()