local createSummon = TalkAction("/s")

function createSummon.onSay(player, words, param)
	logCommand(player, words, param)

	if not(player:getGroup():getId() >= 5) then
    return true
end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local position = player:getPosition()
	local monster = Game.createMonster(param, position)
	if monster then
		player:addSummon(monster)
		monster:reload()
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		player:sendCancelMessage("There is not enough room.")
		position:sendMagicEffect(CONST_ME_POFF)
	end
	return false
end

createSummon:separator(" ")
createSummon:register()
