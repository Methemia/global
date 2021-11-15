local openServer = TalkAction("/openserver")

function openServer.onSay(player, words, param)
	logCommand(player, words, param)
	if not(player:getGroup():getId() >= 4) then
    return true
end

	Game.setGameState(GAME_STATE_NORMAL)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Server is now open.")
	return false
end

openServer:separator(" ")
openServer:register()
