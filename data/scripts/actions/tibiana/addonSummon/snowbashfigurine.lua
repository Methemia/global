	
local SnowbashFigurine = Action()

function SnowbashFigurine.onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getVocation():getId() == 8 then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations, you have got an outfit for your summon.")
   item:remove(1)
	player:addFamiliar(1365)
    return true
end
end


SnowbashFigurine:id(40424)
SnowbashFigurine:register()
