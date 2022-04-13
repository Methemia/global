local online = TalkAction("!tcs")

function online.onSay(player, words, param)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Lo sentimos. La promocion de tibia coins gratis ha acabado.")
	return false
end 

online:register()