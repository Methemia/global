	
local BladesparkFigurine = Action()

function BladesparkFigurine.onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getVocation():getId() == 5 then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations, you have got an outfit for your summon.")
   item:remove(1)
	player:addFamiliar(1367)
    return true
end
end


BladesparkFigurine:id(40427)
BladesparkFigurine:register()
