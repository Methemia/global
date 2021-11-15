local ghost = TalkAction("/ghost")

function ghost.onSay(player, words, param)
	
if not(player:getGroup():getId() >= 4) then
    return true
end

	local position = player:getPosition()
	local isGhost = not player:isInGhostMode()

	player:setGhostMode(isGhost)
	if isGhost then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are now invisible.")
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are visible again.")
		position.x = position.x + 1
	end
	return false
end

ghost:separator(" ")
ghost:register()
