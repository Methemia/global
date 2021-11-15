local CityWar = GlobalEvent("CityWar")
function CityWar.onThink(interval)

local time = os.time()


-- expired invitation start
local query = db.storeQuery("SELECT warid FROM citywar WHERE state = 0")
local tmpquery = query
local guildquery, warid
while(tmpquery ~= false) do
warid = result.getNumber(query, "warid")
guildquery = db.storeQuery("SELECT started, name1, name2 FROM guild_wars WHERE id = "..warid)
if guildquery ~= false then
if result.getNumber(guildquery, "started") + warDefaultInviteDuration <= time then
db.query("UPDATE citywar SET state = 3 WHERE warid = "..warid)
db.query("UPDATE guild_wars SET status = 3 WHERE id = ".. warid)
broadcastMessage("[City War]\nThe war invitation between "..result.getString(guildquery, "name1").." and "..result.getString(guildquery, "name2").." expired because of no reply.", MESSAGE_EVENT_ADVANCE)
end
end
result.free(guildquery)
tmpquery = result.next(query)
end
result.free(query)
-- expired invitation end



-- update idletime start
local idlequery = db.storeQuery("SELECT guild1, guild2, idletime,warid FROM citywar WHERE state = 1")
local tmpidle = idlequery
local guild1, guild2, idletime, newidletime, guild1isidle, guild2isidle, name1, name2, guild1online, guild2online
while(tmpidle ~= false) do
guild1isidle = true
guild2isidle = true
guild1 = result.getNumber(idlequery, "guild1")
guild2 = result.getNumber(idlequery, "guild2")
warid = result.getNumber(idlequery, "warid")
idletime = result.getNumber(idlequery, "idletime")
newidletime = idletime
if Guild(guild1) then
guild1online = Guild(guild1):getMembersOnline()
for i=1, #guild1online do
if guild1online[i]:getStorageValue(warStorages.inArena) == 1 then
guild1isidle = false
break
end
end
end
if Guild(guild2) then
guild2online = Guild(guild2):getMembersOnline()
for i=1, #guild2online do
if guild2online[i]:getStorageValue(warStorages.inArena) == 1 then
guild2isidle = false
break
end
end
end

if guild1isidle then 
newidletime = newidletime + 60
end
if guild2isidle then
newidletime = newidletime + 60
end
if newidletime >= warMaxIdleTime then
db.query("UPDATE guild_wars SET status = 4, ended = "..time.." WHERE id = "..warid)
endCityWar(nil, warid, nil, false)
name1 = db.storeQuery("SELECT name FROM guilds WHERE id = "..guild1)
name2 = db.storeQuery("SELECT name FROM guilds WHERE id = "..guild2)

broadcastMessage("[City War]\nWar ended due to inactivity, the result was ".. result.getString(name1, "name") .. " with ".. getGuildKills(guild1, warid).." frags vs ".. result.getString(name2, "name") .." with ".. getGuildKills(guild2, warid) .." frags.", MESSAGE_EVENT_ADVANCE)
elseif newidletime ~= idletime then
db.query("UPDATE citywar SET idletime = "..newidletime.." WHERE warid = "..warid)
end

tmpidle = result.next(idlequery)
end
result.free(idlequery)
-- update idletime end


-- end of war by time start
local query2 = db.storeQuery("SELECT id, guild1, guild2, name1, name2 FROM guild_wars WHERE status = 1 AND duration > 0 AND (started + duration) < " .. time)
local tmpquery2 = query2
local citywarquery
while(tmpquery2 ~= false) do
warid = result.getNumber(query2, "id")
guild1 = result.getNumber(query2, "guild1")
guild2 = result.getNumber(query2, "guild2")
name1 = result.getString(query2, "name1")
name2 = result.getString(query2, "name2")
db.query("UPDATE guild_wars SET status = 4, ended = "..time.." WHERE id = "..warid)
endCityWar(nil, warid, nil, false)
broadcastMessage("[City War]\nWar ended, the result was ".. name1 .. " with ".. getGuildKills(guild1, warid).." frags vs ".. name2 .." with ".. getGuildKills(guild2, warid) .." frags.", MESSAGE_EVENT_ADVANCE)
tmpquery2 = result.next(query2)
end
result.free(query2)
-- end of war by time end


	return true
end


CityWar:interval(60000)
CityWar:register()
