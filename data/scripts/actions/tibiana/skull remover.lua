local skullRemover = Action()

function skullRemover.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:isPzLocked() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can use this item when you aren't pz locked!")
	return true
	end

	
	if table.contains({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
		item:remove(1)
		player:setSkull(SKULL_NONE)
		player:setSkullTime(0)
		player:sendMagicEffect(CONST_ME_MAGIC_RED)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your skull has been removed!")
		db.query("UPDATE `player_deaths` SET `unjustified` = 0 WHERE `unjustified` = 1 AND `killed_by` = " .. db.escapeString(player:getName()))
	else
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "You can only remove red or black skulls!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
skullRemover:id(11144)
skullRemover:register()