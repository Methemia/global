local config = {
	ratio = {180, 3}, -- {total secs, received min}
	interval = 15,
	storage = 30968,
	message = "You have entered in a protection zone. You will regain +3 stamina every 3 minutes while in this zone (fast stamina event actived).",
	messagetype = MESSAGE_EVENT_DEFAULT,
}

local function regenStamina(cid, lastLogout)
	local player = Player(cid)
	if not player then return false end
	if player:getLastLogout() ~= lastLogout then return false end
	local stamina = player:getStamina()
	if stamina < 42*60 then
		local tile = player:getTile()
		if tile and tile:hasFlag(TILESTATE_PROTECTIONZONE) then
			local total = player:getStorageValue(config.storage)
			total = total + config.interval
			if total >= config.ratio[1] then
				total = 0
				stamina = math.min(42*60, stamina + config.ratio[2])
				player:setStamina(stamina)
				if config.message ~= "" then
					player:sendTextMessage(config.messagetype, config.message)
				end
			end
			player:setStorageValue(config.storage, total)
		end
	end
	addEvent(regenStamina, config.interval*1000, cid, lastLogout)
end
        

local staminaLogin = CreatureEvent("staminaLogin")
function staminaLogin.onLogin(player)
	addEvent(regenStamina, config.interval*1000, player:getId(), player:getLastLogout())
	return true
end

staminaLogin:register()