local config = {
    centerPosition = Position(33443, 31545, 13), -- Center Room  
	exitPosition = Position(33488, 31546, 13), -- Exit Position
	newPosition = Position(33443, 31573, 13),
	rangeX = 35,
	rangeY = 35,
	time = 60, -- time in minutes to remove the player	
}	

local function RoomIsOccupied(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(config.centerPosition, false, true, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
	if #spectators ~= 0 then
		return true
	end

	return false
end

local function clearRoom(playerId)
		local player = Player(playerId)
		if player and player:getPosition().z == config.centerPosition.z and math.abs(player:getPosition().x - config.centerPosition.x) <= config.rangeX and math.abs(player:getPosition().y - config.centerPosition.y) <= config.rangeY then
			player:teleportTo(config.exitPosition)
			Position(config.exitPosition):sendMagicEffect(CONST_ME_TELEPORT)
end
end
local zelosAction = Action()
function zelosAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(33485, 31546, 13) then
			item:transform(9826)
			return true
		end
	end
	
	if item.itemid == 9825 then
			for x = 33485, 33486 do
			for y = 31544, 31548 do
			local playerTile = Tile(Position(x, y, 13)):getTopCreature()
			   if playerTile and playerTile:isPlayer() then 
        if playerTile:getStorageValue(Storage.GraveDangerBosses.KingZelos.Timer) > os.time() then
	       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only enter every 7 days!")
	   return true
	    end
		end
		end
	end
	end

	if item.itemid == 9825 then
		if RoomIsOccupied(config.centerPosition, config.rangeX, config.rangeY) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There is already someone inside, wait until they finish to enter.")
		return true
	end
		local monsterspectators = Game.getSpectators(config.centerPosition, false, false, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
	if #monsterspectators > 0 then
	for i=1, #monsterspectators do 
	monsterspectators[i]:remove()
	end
	end
	
	Game.createMonster("The Red Knight", Position(33423, 31562, 13), false, true)
	Game.createMonster("Nargol the Impaler", Position(33423, 31529, 13), false, true)
	Game.createMonster("Magnor Mournbringer", Position(33463, 31529, 13), false, true)
	Game.createMonster("Rewar the Bloody", Position(33463, 31562, 13), false, true)
	Game.createMonster("King Zelos", Position(33443, 31547, 13), false, true)
	
		for x = 33485, 33486 do
			for y = 31544, 31548 do
			local playerTile = Tile(Position(x, y, 13)):getTopCreature()
			   if playerTile and playerTile:isPlayer() then 					
				playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
				playerTile:teleportTo(config.newPosition)
				playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
				playerTile:setStorageValue(Storage.GraveDangerBosses.KingZelos.Timer, 20 * 60 * 60)
		addEvent(clearRoom, 60 * config.time * 1000, Player(playerTile):getId())
					end
					end
		end
		Game.setStorageValue(Storage.GraveDangerBosses.KingZelos.ResistanceTimer, os.time())
		item:transform(9826)
	elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end
zelosAction:aid(45108)
zelosAction:register()