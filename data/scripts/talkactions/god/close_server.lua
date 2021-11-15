local closeServer = TalkAction("/closeserver")

function closeServer.onSay(player, words, param)
	logCommand(player, words, param)
if not(player:getGroup():getId() >= 5) then
    return true
end

	if param == "shutdown" then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	else
		Game.setGameState(GAME_STATE_CLOSED)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Server is now closed.")
	end
	return false
end

closeServer:separator(" ")
closeServer:register()
