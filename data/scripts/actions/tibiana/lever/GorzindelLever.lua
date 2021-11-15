local Gorzindel = Action()
local config = {
	bossName = "Gorzindel",
	lockStorage = 50803019, -- globalstorage
	bossPos = Position(32687, 32718, 10),
	centerRoom = Position(32687, 32718, 10), -- Center Room  
	exitPosition = Position(32718, 32772, 10), -- Exit Position
	newPos = Position(32688, 32726, 10),
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
			elseif spectator:isMonster() then
				spectator:remove()
			end
		end
		Game.setStorageValue(config.lockStorage, 0)
	end
end
-- Start Script poss principal y action del script
function Gorzindel.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 32585 and item.actionid == 40096 then
		if player:getPosition() ~= Position(32747, 32749, 10) then
			return true
		end
-- Poss de los players			
	for x = 32747, 32751 do
	local playerTile = Tile(Position(x, 32749, 10)):getTopCreature()
		if playerTile and playerTile:isPlayer() then 
			if playerTile:getStorageValue(Storage.Tibiana.GorzindelTimer) > os.time() then
				playerTile:sendTextMessage(MESSAGE_STATUS_SMALL, "You or a member in your team have to wait 20 hours to challange Gorzindel again!")
				item:transform(32585)
				return true
			end
		end
	end			
	
	local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
	for i = 1, #specs do
		spec = specs[i]
		if spec:isPlayer() then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "There's someone fighting with Gorzindel.")
			item:transform(32585)
			return true
		end
	end	
			
	if Game.getStorageValue(config.lockStorage) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need wait 10 minutes to room cleaner!")
		return true
	end
	
	local spectators = Game.getSpectators(config.bossPos, false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isMonster() then
			spectator:remove()
		end
	end
		--[[for n = 1, #monsters do
			Game.createMonster(monsters[n].pillar, monsters[n].pos, true, true)
		end]]	
	Game.createMonster(config.bossName, config.bossPos, true, true)	
	Game.setStorageValue(config.lockStorage, 1)
-- poss de los players
	for x = 32747, 32751 do
		local playerTile = Tile(Position(x, 32749, 10)):getTopCreature()
		if playerTile and playerTile:isPlayer() then 					
			playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
			playerTile:teleportTo(config.newPos)
			playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
			playerTile:setStorageValue(Storage.Tibiana.GorzindelTimer, os.time() + 15 * 60 * 60) -- + 20 * 60 * 3600
			addEvent(clearOberonRoom, 60 * config.time * 1000, playerTile:getId(), config.centerRoom, config.range, config.range, config.exitPosition)
			playerTile:sendTextMessage(MESSAGE_STATUS_SMALL, "You have 10 minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.")
			item:transform(32585)
		end
	end
	
elseif item.itemid == 32585 then
		item:transform(32585)
	end
		return true
end
Gorzindel:aid(40096)
Gorzindel:register()