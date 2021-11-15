if not AutoLootList then
    AutoLootList = { players = { } }
end

AutoLootList.stop = function(self, playerId)
    if self.players[playerId] ~= nil then
        stopEvent(self.players[playerId])
        self.players[playerId] = nil
    end
end

local dataTypes = {
    number = result.getNumber,
    string = result.getString,
    stream = result.getStream
}
 
function queryToTable(id, values)
    local ret = {}
    if not id then
        return ret
    end
		
    repeat
        local t = {}
        for i = 1, #values do
            local column, dataType = values[i]:match('(%a+):(%a+)')
            t[column] = dataTypes[dataType](id, column)
        end
        table.insert(ret, t)
    until not result.next(id)
	
    return ret
end

AutoLootList.save = function(self, playerId)
    local player = Player(playerId)
    if not player then
        self:stop(playerId)
        return
    end

    local resultId = db.storeQuery(string.format('SELECT `item_id` FROM `quick_loot_list` WHERE `player_id` = %d', player:getGuid()))
    if not resultId then
        self:stop(playerId)
        return
    end

    if not self.players[playerId] then
		self.players[playerId] = { lootList = { } }
    end
	
	local itemTable = {}
	repeat
		local itemId = result.getNumber(resultId, "item_id")
		table.insert(itemTable, itemId)
	until not result.next(resultId)
	result.free(resultId)
	
    self.players[playerId].lootList = itemTable
end

function Player:getObtainedMoneyAutoLoot()
    local resultId = db.storeQuery(string.format('SELECT `autoloot_goldstored` FROM `players` WHERE `name` = %s', db.escapeString(self:getName())))
    if resultId then
        local obtainedMoney = result.getNumber(resultId, "autoloot_goldstored")
        result.free(resultId)
        return obtainedMoney
    end

    return 0
end

 

AutoLootList.onLogin = function(self, playerId) self:save(playerId) end
AutoLootList.onLogout = function(self, playerId) self:stop(playerId) end
AutoLootList.onDeath = function(self, playerId) self:stop(playerId) end