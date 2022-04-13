local tcs = TalkAction("!fastregen")
local freeVip = 7
local accountStorage = 307

function tcs.onSay(player, words, param)
	local accountId = player:getAccountId()
	local ip = player:getIp()
	local query = db.storeQuery("SELECT * FROM accounts_storage WHERE `key` = " .. accountStorage .. " AND (account_id = " .. accountId .. " OR value = " .. ip .. ")")
	if query then
		player:sendCancelMessage("Ya reclamaste tus dias de fast regen. Solo una vez se puede reclamar este obsequio recuerda que es por IP y por CUENTA.")
	else
		db.query("INSERT INTO accounts_storage (`account_id`, `key`, `value`) VALUES (" .. accountId .. ", " .. accountStorage .. ", " .. ip .. ")")
		player:addVipDays(freeVip)
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
		player:sendCancelMessage("Obtuviste 7 dias de fast regen recuerda que este obsequio es por IP y por CUENTA!")
	end
	return false
end

tcs:separator(" ")
tcs:register()