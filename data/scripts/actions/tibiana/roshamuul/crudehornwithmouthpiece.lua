
local CrudeHornWithMouthPiece = Action()


function CrudeHornWithMouthPiece.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player then return false end

	if player:getItemCount(22389) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need a crude horn of bone.")
		return false
	end

		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations.")
		player:getPosition():sendMagicEffect(15)
		player:removeItem(22389, 1)
		player:addItem(22390, 1)
		player:removeItem(22391, 1)
		end

CrudeHornWithMouthPiece:id(22391)
CrudeHornWithMouthPiece:register()
