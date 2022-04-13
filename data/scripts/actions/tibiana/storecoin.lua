local tibiaCoin = Action()

function tibiaCoin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		local tibiaCoin = Player(cid)
		local tibiaCoin = player:getCoinsBalance()+item:getCount()
		player:getPosition():sendMagicEffect(15)
		item:remove()
		player:setCoinsBalance(tibiaCoin)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to carry tibia coins in your backpack.")
	end

tibiaCoin:id(247749)
tibiaCoin:register()