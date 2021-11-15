local inactiveHouses = TalkAction("/inactivehouse")
local days = 7

function inactiveHouses.onSay(player, words, param)
    local position = player:getPosition()
    position:getNextPosition(player:getDirection())

    local house = Tile(position):getHouse()
    if not house then
        player:sendCancelMessage("You must face a house door to evict the owner.")
        return false
    end

    local ownerId = house:getOwnerGuid()
    if ownerId == 0 then
        player:sendCancelMessage("This house is already owned by nobody.")
        return false
    end

    local query = db.storeQuery("SELECT 1 FROM `players` WHERE `id` = " .. ownerId .. " AND `lastlogin` < " .. os.time() - (days * 24 * 60 * 60))
    if not query then
        player:sendCancelMessage("This house owner is an active player.")
        return false
    end

    house:setOwnerGuid(0)
    return false
end

inactiveHouses:register()