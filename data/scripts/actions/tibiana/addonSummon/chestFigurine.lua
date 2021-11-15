local config = {
	itemid = 2160,
	str = 50189,
	[1] = {vocs = {1, 5}, itemid = 40427, text = "Bladespark Figurine"},
	[2] = {vocs = {2, 6}, itemid = 40426, text = "Mossmasher Figurine"},
	[3] = {vocs = {3, 7}, itemid = 40425, text = "Sandscourge Figurine"},
	[4] = {vocs = {4, 8}, itemid = 40424, text = "Snowbash Figurine"},
}, 25398

local chestFigurine = Action()


function chestFigurine.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player then return false end

	if player:getStorageValue(39421) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this reward.")
		player:getPosition():sendMagicEffect(3)
		return true
	end

	if player:getItemCount(40343) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the key.")
		return false
	end

	for i = 1, #config do
		local paso = config[i]
		local pvoc = player:getVocation():getId()
		if isInArray(config[i].vocs, pvoc) then
			player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(config[i].itemid, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found "..config[i].text..".")
			player:getPosition():sendMagicEffect(15)
			player:setStorageValue(39421, 1)
		player:removeItem(40343, 1)
		end
	end
	return true
end
chestFigurine:aid(61415)
chestFigurine:register()
