
warDefaultDuration = 60 * 60
warDefaultInviteDuration = 2 * 60
warMaxIdleTime = 10 * 60
warMinGuildLeaderLevel = 150
warMinPlayerLevel = 50

warStorages = {
inArena = 104984,
areaRunes = 104985,
ueSpells = 104986,
ssaMight = 104987,
summons = 104988,
expLoss = 104989,
exhChange = 104990,
}

warConfig = {
{
-- CityName, Tp on command
[1] = {"Edron", Position({x = 1040, y = 1025, z = 6}), Position({x = 1109, y = 1155, z = 7})},
},
{20, 40, 60, 80, 100, 200, "Disabled"}, -- Frags
{50, 100, 200, 300, 400, 500, 600, "Disabled"}, -- MaxLevel
{2, 4, 8, "Disabled"}, -- FrontLine
{5, 10, 15, 20, 25, 30, 35, 40, 45, 50, "Disabled"}, -- Max Players
{"Enabled", "50%", "Disabled"}, -- Area Runes DONT edit those
{"Enabled", "50%", "Disabled"}, -- UE Spells DONT edit those
{"Enabled", "Disabled"}, -- SSA/Might Ring DONT edit those
{"Enabled", "Disabled"}, -- Summons DONT edit those
{"Enabled", "Disabled"}, -- Exp Loss
{"Disabled", 2, 3, 4, "No Limit"}, -- MC
{"All Clients", "Only 12", "Only 10"}, -- CLIENTS
{"Enabled", "50%", "Disabled"}, -- WAVES
}

function getFragLimit(warId)
    local fraglimit = 0
    local query = db.storeQuery("SELECT `fraglimit` FROM `guild_wars` WHERE `id` = " .. warId .. " LIMIT 1")
    if(query ~= false) then
        fraglimit = result.getDataInt(query, "fraglimit")
    end
    result.free(query) 
    return fraglimit
end

function getGuildKills(guildId, warId)
    local totalKills = 0
    local query = db.storeQuery("SELECT `killer` FROM `guildwar_kills` WHERE `warid` = " .. warId .. " AND `killerguild` = " .. guildId .. " ORDER BY `time`;")
    if(query ~= false) then
        repeat
            totalKills = totalKills + 1
        until not result.next(query)
    end
    result.free(query) 
    return totalKills
end

function endCityWar(creature, warId, winner, message)
local query = db.storeQuery("SELECT guild1, guild2 FROM citywar WHERE warid = "..warId)
if query == false then
result.free(query)
return false
end

local guildid1 = result.getNumber(query, "guild1")
local guildid2 = result.getNumber(query, "guild2")
result.free(query)
local guild1 = Guild(guildid1)
local guild2 = Guild(guildid2)
local player
if guild1 then
local guild1online = guild1:getMembersOnline()
for i=1, #guild1online do
player = guild1online[i]
if player ~= creature and player:getGuild() == guild1 and player:getStorageValue(warStorages.inArena) == 1 then
player:removeCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
player:setTempLevel(false)
player:teleportTo(player:getTown():getTemplePosition())
player:setStorageValue(warStorages.inArena, -1)
player:setStorageValue(warStorages.areaRunes , -1)
player:setStorageValue(warStorages.ueSpells , -1)
player:setStorageValue(warStorages.ssaMight , -1)
player:setStorageValue(warStorages.summons , -1)
player:setStorageValue(warStorages.expLoss, -1)
end
end
end

if guild2 then
local guild2online = guild2:getMembersOnline()
for i=1, #guild2online do
player = guild2online[i]
if player ~= creature and player:getGuild() == guild2 and player:getStorageValue(warStorages.inArena) == 1 then
player:removeCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
player:setTempLevel(false)
player:teleportTo(player:getTown():getTemplePosition())
player:setStorageValue(warStorages.inArena, -1)
player:setStorageValue(warStorages.areaRunes , -1)
player:setStorageValue(warStorages.ueSpells , -1)
player:setStorageValue(warStorages.ssaMight , -1)
player:setStorageValue(warStorages.summons , -1)
player:setStorageValue(warStorages.expLoss, -1)
end
end
end
local toupdate = {}
if guild1 then
local guild1online = guild1:getMembersOnline()
for i=1, #guild1online do
player = guild1online[i]
toupdate[#toupdate + 1] = player:getId()
end
end
if guild2 then
local guild2online = guild2:getMembersOnline()
for i=1, #guild2online do
player = guild2online[i]
toupdate[#toupdate + 1] = player:getId()
end
end
for i=1, #toupdate do
addEvent(function()
		if Player(toupdate[i]) then
		Player(toupdate[i]):updateEmblem()
		end
		end, 100 * i)
end

local name1 = db.storeQuery("SELECT name FROM guilds WHERE id = "..guildid1)
local name2 = db.storeQuery("SELECT name FROM guilds WHERE id = "..guildid2)
if message ~= false then
broadcastMessage("[City War]\nWar ended, the result was ".. result.getString(name1, "name") .. " with "..(guildid1 == winner and getGuildKills(guildid1, warId)+1 or getGuildKills(guildid1, warId)).." frags vs "..result.getString(name2, "name") .." with "..(guildid2 == winner and getGuildKills(guildid2, warId)+1 or getGuildKills(guildid2, warId)).." frags.", MESSAGE_EVENT_ADVANCE)
end
result.free(name1)
result.free(name2)
db.query("UPDATE citywar SET state = 4 WHERE warid = "..warId)
return true
end
