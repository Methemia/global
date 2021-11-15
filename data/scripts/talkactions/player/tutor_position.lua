local tutorPosition = TalkAction("!position")

function tutorPosition.onSay(player, words, param)

	local position = player:getPosition()
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your current position is: \z
		" .. position.x .. ", " .. position.y .. ", " .. position.z .. ".")
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Please Report all issues directly to Discord - Discord https://discord.gg/PrQYvTK - Thank you.")

	return false
end

tutorPosition:register()