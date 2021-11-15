	
local MossmasherFigurine = Action()

function MossmasherFigurine.onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getVocation():getId() == 6 then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations, you have got an outfit for your summon.")
   item:remove(1)
	player:addFamiliar(1364)
    return true
end
end


MossmasherFigurine:id(40426)
MossmasherFigurine:register()
