local enterAncient2room = Action()
local config = {
	bossName = "Rat",
        lockStorage = 50803020, -- globalstorage
	bossPos = Position(33720, 32375, 15),
	centerRoom = Position(33720, 32375, 15), -- Center Room  
	exitPosition = Position(33692, 32388, 15), -- Exit Position
	newPos = Position(33709, 32375, 15),
	range = 20,
	time = 10, -- time in minutes to remove the player	
}	

--[[local monsters = {
	{pillar = "oberons ire", pos = Position(33367, 31320, 9)},
	{pillar = "oberons spite", pos = Position(33361, 31320, 9)},
	{pillar = "oberons hate", pos = Position( 33367, 31316, 9)},
	{pillar = "oberons bile", pos = Position(33361, 31316, 9)}
}]]

local function clearOberonRoom()
	if Game.getStorageValue(config.lockStorage) == 1 then
		local spectators = Game.getSpectators(config.bossPos, false, false, 10, 10, 10, 10)
		for i = 1, #spectators do
			local spectator = spectators[i]
			if spectator:isPlayer() then
				spectator:teleportTo(config.exitPosition)
				spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
		
			end
		end
		Game.setStorageValue(config.lockStorage, 0)
	end
end
-- Start Script poss principal y action del script
function enterAncient2room.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 11536 and item.actionid == 44038 then
		if player:getPosition() ~= Position(33693, 32386, 15) then
			return true
		end
-- Poss de los players			
	for x = 33692, 33694 do
	local playerTile = Tile(Position(x, 32386, 15)):getTopCreature()
		if playerTile and playerTile:isPlayer() then 
			if playerTile:getStorageValue(Storage.Tibiana.LokathmorTimer) > os.time() then
				playerTile:sendTextMessage(MESSAGE_STATUS_SMALL, "You or a member in your team have to wait 20 hours to challange Ghulosh again!")
				item:transform(11536)
				return true
			end
		end
	end			
				
	--[[for n = 1, #monsters do
			Game.createMonster(monsters[n].pillar, monsters[n].pos, true, true)
		end]]	
	Game.createMonster(config.bossName, config.bossPos, true, true)	
	Game.setStorageValue(config.lockStorage, 1)
-- poss de los players
	for x = 33692, 33694 do
		local playerTile = Tile(Position(x, 32386, 15)):getTopCreature()
		if playerTile and playerTile:isPlayer() then 					
			playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
			playerTile:teleportTo(config.newPos)
			playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
			playerTile:setStorageValue(Storage.Tibiana.LokathmorTimer, os.time() + 15 * 60 * 60) -- + 20 * 60 * 3600
			addEvent(clearOberonRoom, 60 * config.time * 1000, playerTile:getId(), config.centerRoom, config.range, config.range, config.exitPosition)
			playerTile:sendTextMessage(MESSAGE_STATUS_SMALL, "You have 10 minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.")
			item:transform(11536)
		end
	end
	
elseif item.itemid == 11536 then
		item:transform(11536)
	end
		return true
end
enterAncient2room:aid(44038)
enterAncient2room:register()