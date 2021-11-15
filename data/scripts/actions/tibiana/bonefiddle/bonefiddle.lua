
local BoneFiddle = Action()


function BoneFiddle.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player then return false end

	if player:getItemCount(33273) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need a strand of hair.")
		return false
	end

		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
		player:getPosition():sendMagicEffect(15)
		player:removeItem(33273, 1)
		player:addItem(33276, 1)
		player:removeItem(33275, 1)
		end

BoneFiddle:id(33275)
BoneFiddle:register()
