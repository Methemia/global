local config = {
	time = 60*60*24,
	itemid = 2160,
	str = 50189,
	[1] = {vocs = {1, 5}, itemid = 32129, text = "exercise wand"},
	[2] = {vocs = {2, 6}, itemid = 32128, text = "exercise rod"},
	[3] = {vocs = {3, 7}, itemid = 32127, text = "exercise bow"},
	[4] = {vocs = {4, 8}, itemid = 32124, text = "exercise sword"},
	[5] = {vocs = {4, 8}, itemid = 32125, text = "exercise axe"},
	[6] = {vocs = {4, 8}, itemid = 32126, text = "exercise club"},
}, 25398

local exdaily = Action()
function exdaily.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player then return false end

	if player:getStorageValue(config.str) > os.time() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait 24 hours to get your reward.")
		return true
	end

	for i = 1, #config do
		local paso = config[i]
		local pvoc = player:getVocation():getId()
		if isInArray(config[i].vocs, pvoc) then
			player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(config[i].itemid, 50)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found "..config[i].text..".")
			player:getPosition():sendMagicEffect(15)
		end
	end
	player:setStorageValue(config.str, os.time()+config.time)
	return true
end
exdaily:aid(61315)
exdaily:register()
