local function timestampToDate(timestamp)
    local day_count, year, days, month = function(yr) return (yr % 4 == 0 and (yr % 100 ~= 0 or yr % 400 == 0)) and 366 or 365 end, 1970, math.ceil(timestamp/86400)
    while days >= day_count(year) do
        days = days - day_count(year) year = year + 1
    end
	
    local tab_overflow = function(seed, table) for i = 1, #table do if seed - table[i] <= 0 then return i, seed end seed = seed - table[i] end end
    month, days = tab_overflow(days, {31,(day_count(year) == 366 and 29 or 28),31,30,31,30,31,31,30,31,30,31})
    local hours, minutes, seconds = math.floor(timestamp / 3600 % 24), math.floor(timestamp / 60 % 60), math.floor(timestamp % 60)
    hours = hours > 12 and hours - 12 or hours == 0 and 12 or hours
    return string.format("%d-%d-%04d, %02d:%02d:%02d", year, month, days, hours, minutes, seconds)
end

local reportCommand = TalkAction("!report")
function reportCommand.onSay(player, words, param, channel)
    local storage = 6708 -- (You can change the storage if its already in use)
    local delaytime = 30 -- (Exhaust In Seconds.)
    local x, y, z = player:getPosition().x, player:getPosition().y, player:getPosition().z -- (Do not edit this.)
	
    if(param == '') then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Command param required.")
        return false
    end
	
	local name = player:getName()
	if (player:getStorageValue(storage) <= os.time()) then
		local file = io.open(string.format("data/reports/%s.txt", name), "a")
		if not file then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There was an error when processing your report, please contact a gamemaster.")
			return
		end

		io.output(file)
		io.write("------------------------------\n")
		io.write("Reported by: " .. name .. "\n")
		io.write("Date: " .. timestampToDate(os.time()) .. "\n")
		io.write("Comment: " .. db.escapeString(param) .. "\n")
		io.write("Position: {x = "..x..", y = "..y..", z = "..z.."}\n")
		io.write("------------------------------\n")
		io.close(file)
		
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Thank you for your report %s. Your report \z
		will be processed by %s team as soon as possible.", name, configManager.getString(configKeys.SERVER_NAME)))
		player:setStorageValue(storage, os.time() + delaytime)
    else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have to wait "..player:getStorageValue(storage) - os.time().." seconds to report again.")
    end
return false
end

reportCommand:separator(" ")
reportCommand:register()