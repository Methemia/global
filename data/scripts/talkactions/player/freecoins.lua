local tcs = TalkAction("!tcsjsjsjsjsjs")
local freeTcs = 400
local accountStorage = 300

function tcs.onSay(player, words, param)

	if player:getLevel() < 250 then
        player:sendCancelMessage("You need to be level 250 to use this command.")
        return false
   	 end

	local accountId = player:getAccountId()
	local ip = player:getIp()
	local query = db.storeQuery("SELECT * FROM accounts_storage WHERE `key` = " .. accountStorage .. " AND (account_id = " .. accountId .. " OR value = " .. ip .. ")")
	if query then
		player:sendCancelMessage("Ya reclamaste tus tibia coins.")
	else
		db.query("INSERT INTO accounts_storage (`account_id`, `key`, `value`) VALUES (" .. accountId .. ", " .. accountStorage .. ", " .. ip .. ")")
		player:addTibiaCoins(freeTcs)
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
		player:sendCancelMessage("Obtuviste tus tcs gratuitas!")
	end
	return false
end

tcs:separator(" ")
tcs:register()