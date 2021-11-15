	
local SandscourgeFigurine = Action()

function SandscourgeFigurine.onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getVocation():getId() == 7 then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations, you have got an outfit for your summon.")
   item:remove(1)
	player:addFamiliar(1366)
    return true
end
end


SandscourgeFigurine:id(40425)
SandscourgeFigurine:register()
