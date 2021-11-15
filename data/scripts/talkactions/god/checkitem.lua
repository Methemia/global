local checkitem = TalkAction("/checkitem")
function checkitem.onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if not param then
		player:sendCancelMessage('Please type the command: /checkItem, itemId')
		return false
	end

	local itemId = tonumber(param)
    if not itemId then
        player:sendCancelMessage('The value should be numeric.')
        return false
    end

	local resultId = db.storeQuery(string.format('SELECT `name`, `id` FROM `players` WHERE `id` IN (SELECT `player_id` FROM `player_items` WHERE `itemtype` = %d)', itemId))
	local message = string.format('Results from the search from the itemId %d in our database:\n\n', itemId)
	if resultId ~= false then
		repeat
   			local playerName = result.getDataString(resultId, "name")
   			local playerId = result.getDataInt(resultId, "id")

   			local checkOnline = db.storeQuery(string.format('SELECT `player_id` FROM `players_online` WHERE `players_online`.`player_id` = %d', playerId))
   			if checkOnline ~= false then 
   				status = 'Online'
   			else
   				status = 'Offline'
   			end

			message = message .. playerName .." [".. status .."]\n"

		until not result.next(resultId)
		result.free(resultId)
	else
		message = message .. "There is no players with this item at our server."
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
	return false
end
checkitem:register()