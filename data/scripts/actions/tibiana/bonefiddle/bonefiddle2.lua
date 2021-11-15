
local BoneFiddle2 = Action()


function BoneFiddle2.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player then return false end

	if player:getItemCount(33272) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the skull.")
		return false
	end

		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
		player:getPosition():sendMagicEffect(15)
		player:removeItem(33274, 1)
		player:addItem(33275, 1)
		player:removeItem(33272, 1)
		end

BoneFiddle2:id(33274)
BoneFiddle2:register()
