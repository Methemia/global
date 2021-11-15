local backpack = TalkAction("!backpack")
local price_backpack = 5000

function backpack.onSay(player, words, param)
	
	if player:removeMoneyNpc(price_backpack) then
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		player:addItem(1988, 1)	
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You dont have enought money.")
	end
	
end
backpack:register()