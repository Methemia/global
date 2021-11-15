function acceptWarWindow(player, warId, guildname, frags)
local info = db.storeQuery("SELECT id, state, town, maxlevel, frontline, maxplayers, arearunes, uespells, ssamight, summons, exploss, multiclient FROM citywar WHERE warid = "..warId)
if info == false then
result.free(info)
player:sendCancelMessage("Error, please contact an administrator.")
return false
end
local citywarid = result.getNumber(info, "id")
local state = result.getNumber(info, "state")
if state ~= 0 then
player:sendCancelMessage("The invitation expired.")
result.free(info)
return false
end
local town = result.getNumber(info, "town")
local maxlevel = result.getNumber(info, "maxlevel")
local frontline = result.getNumber(info, "frontline")
local maxplayers = result.getNumber(info, "maxplayers")
local arearunes = result.getNumber(info, "arearunes")
local uespells = result.getNumber(info, "uespells")
local ssamight = result.getNumber(info, "ssamight")
local summons = result.getNumber(info, "summons")
local exploss = result.getNumber(info, "exploss")
local multiclient = result.getNumber(info, "multiclient")

local window = ModalWindow {
	title = "War Anti-Entrosa",
	message = "The guild ".. guildname .. " invited you to a city war, you will be able to enter with the command:\n/citywar go\nHere you can see the configuration the leader used for this war",
	}
	local function acceptWar(button, choice)
	local query = db.storeQuery("SELECT guild1, guild2, state FROM citywar WHERE warid = "..warId)
	if query == false then
	player:sendCancelMessage("There was an error accepting the war, contact an administrator.")
	result.free(query)
	return false
	end
	local guild1 = result.getNumber(query, "guild1")
	local guild2 = result.getNumber(query, "guild2")
	local newstate = result.getNumber(query, "state")
	result.free(query)
	if newstate ~= 0 then
	player:sendCancelMessage("The invitation expired.")
	return false
	end
	
	db.query("UPDATE guild_wars SET status = 1 WHERE id = "..warId)
	db.query("UPDATE citywar SET state = 1 WHERE warid = "..warId)
	broadcastMessage("[City War]\nThe guild "..player:getGuild():getName().." accepted the City War against "..guildname.."", MESSAGE_EVENT_ADVANCE)
	if Guild(guild1) then
	local guild1online = Guild(guild1):getMembersOnline()
	for i=1, #guild1online do
	guild1online[i]:updateEmblem()
	end
	end
	if Guild(guild2) then
	local guild2online = Guild(guild2):getMembersOnline()
	for i=1, #guild2online do
	guild2online[i]:updateEmblem()
	end
	end
	return false
	end
window:addChoice("City : "..warConfig[1][town][1])
window:addChoice("Frags : ".. (frags == 0 and "Disabled" or frags))
window:addChoice("Max Level : "..warConfig[3][maxlevel])
window:addChoice("Frontline : "..warConfig[4][frontline])
window:addChoice("Max Players per Team : "..warConfig[5][maxplayers])
window:addChoice("Area Runes : "..warConfig[6][arearunes])
window:addChoice("UE Spells : "..warConfig[7][uespells])
window:addChoice("SSA/Might Ring : "..warConfig[8][ssamight])
window:addChoice("Summons : "..warConfig[9][summons])
window:addChoice("Exp Loss : "..warConfig[10][exploss])
window:addChoice("MC : "..warConfig[11][multiclient])

window:addButton("Accept", acceptWar)
window:addButton("Exit")

window:setDefaultEnterButton("Accept")
window:setDefaultEscapeButton("Exit")

window:sendToPlayer(player)

return true
end


function warModalWindow(player, data, guild)
local window = ModalWindow {
	title = "War Anti-Entrosa",
	message = "You are inviting the guild "..guild[2].." to war.\nHere you can change the configuration for the city war.",
	}
local tempdata = data
local function cambiarItem(button, choice)
if choice.id == 0 then 
return true
end
local num = tempdata[choice.id]
if num == #warConfig[choice.id] then
num = 1
else
num = num + 1
end
tempdata[choice.id] = num
warModalWindow(player, tempdata, guild)
end
local function sendWarInvitation(button, choice)
local warquery = db.storeQuery("SELECT id FROM citywar WHERE ((guild1 = "..guild[1].." AND guild2 = "..player:getGuild():getId()..") OR (guild1 = "..player:getGuild():getId().." AND guild2 = "..guild[1]..")) AND state = 0")
if warquery ~= false then
player:sendCancelMessage("There's a pending invitation between the guilds!")
result.free(warquery)
return false
end
result.free(warquery)
local otherwarquery = db.storeQuery("SELECT id FROM citywar WHERE (guild1 = "..guild[1].." OR guild2 = "..player:getGuild():getId().." OR guild1 = "..player:getGuild():getId().." OR guild2 = "..guild[1]..") AND state = 1")
if otherwarquery ~= false then
player:sendCancelMessage("Your guild or the other guild is already in a war")
result.free(otherwarquery)
return false
end
result.free(otherwarquery)
local citywar = db.storeQuery("SELECT id FROM citywar WHERE town = "..data[1].." AND (state = 0 OR state = 1)")
if citywar == false then
db.query("INSERT INTO guild_wars (guild1, guild2, name1, name2, status, started, duration, ended, frags_limit) VALUES ("..player:getGuild():getId()..", "..guild[1]..", '"..player:getGuild():getName().."', '"..guild[2].."', 0, "..os.time()..", "..warDefaultDuration..", 0, "..warConfig[2][data[2]]..")")
local query = db.storeQuery("SELECT id FROM guild_wars WHERE guild1 = "..player:getGuild():getId().." AND guild2 = "..guild[1].." AND status = 0 AND ended = 0")
local warId = result.getNumber(query, "id")
result.free(query)
db.query("INSERT INTO citywar (guild1, guild2, state, warid, town, maxlevel, frontline, maxplayers, arearunes, uespells, ssamight, summons, exploss, multiclient) VALUES ("..player:getGuild():getId()..", "..guild[1]..", 0, "..warId..", "..data[1]..", "..data[3]..", "..data[4]..", "..data[5]..", "..data[6]..", "..data[7]..", "..data[8]..", "..data[9]..", "..data[10]..", "..data[11]..")")
broadcastMessage("[City War]\nThe guild "..player:getGuild():getName().." invited the guild "..guild[2].." to a city war with ".. (#warConfig[2] == data[2] and "no limit in frags" or "limited frags, set in "..warConfig[2][data[2]])..""..". The war will take place in "..warConfig[1][data[1]][1]..".", MESSAGE_EVENT_ADVANCE)
else
player:sendCancelMessage("This city is already reserved, wait until it ends.")
end
result.free(citywar)
return false
end
	window:addChoice("City : "..warConfig[1][data[1]][1])
	window:addChoice("Frags : "..warConfig[2][data[2]])
	window:addChoice("Max Level : "..warConfig[3][data[3]])
	window:addChoice("Frontline : "..warConfig[4][data[4]])
	window:addChoice("Max Players per Team : "..warConfig[5][data[5]])
	window:addChoice("Area Runes : "..warConfig[6][data[6]])
	window:addChoice("UE Spells : "..warConfig[7][data[7]])
	window:addChoice("SSA/Might Ring : "..warConfig[8][data[8]])
	window:addChoice("Summons : "..warConfig[9][data[9]])
	window:addChoice("Exp Loss : "..warConfig[10][data[10]])
	window:addChoice("MC : "..warConfig[11][data[11]])
	
	
	window:addButton("Change", cambiarItem)
	window:addButton("Send", sendWarInvitation)
	window:addButton("Cancel")
	    window:setDefaultEnterButton("Cambiar")
    window:setDefaultEscapeButton("Cancel")
	window:sendToPlayer(player)
	end
	
	
local cityWarCommand = TalkAction("/citywar")
function cityWarCommand.onSay(player, words, param)
local playerguild = player:getGuild()

if not playerguild then
player:sendCancelMessage("You don't have a guild.")
return false
end

if param == "" then
player:sendCancelMessage("Usage : /citywar go | /citywar leave | /citywar [GUILD] | /citywar cancel, [GUILD]")
return false
end

if param == "leave" then
if player:getStorageValue(warStorages.inArena) ~= 1 then
player:sendCancelMessage("You are not in the city war.")
return false
end
if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) ~= true and player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
player:sendCancelMessage("You must be in pz or not have infight to leave the city war")
return false
end
player:unregisterEvent("CityWar")
player:teleportTo(player:getTown():getTemplePosition())
player:setTempLevel(false)
player:setStorageValue(warStorages.inArena, -1)
player:setStorageValue(warStorages.areaRunes , -1)
player:setStorageValue(warStorages.ueSpells , -1)
player:setStorageValue(warStorages.ssaMight , -1)
player:setStorageValue(warStorages.summons , -1)
player:setStorageValue(warStorages.expLoss, -1)
return false
end


if param == "go" then

if player:getStorageValue(warStorages.inArena) == 1 then
player:sendCancelMessage("You are already fighting in the arena")
return false
end

local query = db.storeQuery("SELECT guild1, guild2, state, town, maxlevel, frontline, maxplayers, arearunes, uespells, ssamight, summons, exploss, multiclient FROM citywar WHERE (guild1 = "..playerguild:getId().." OR guild2 = "..playerguild:getId()..") AND state = 1")

if query == false then
player:sendCancelMessage("You are not in a city war.")
result.free(query)
return false
end

local guild1 = result.getNumber(query, "guild1")
local guild2 = result.getNumber(query, "guild2")
local state = result.getNumber(query, "state")
local town = result.getNumber(query, "town")
local maxlevel = result.getNumber(query, "maxlevel")
local maxfrontline = result.getNumber(query, "frontline")
local maxplayers = result.getNumber(query, "maxplayers")
local arearunes = result.getNumber(query, "arearunes")
local uespells = result.getNumber(query, "uespells")
local ssamight = result.getNumber(query, "ssamight")
local summons = result.getNumber(query, "summons")
local exploss = result.getNumber(query, "exploss")
local multiclient = result.getNumber(query, "multiclient")
result.free(query)

if player:getLevel() < warMinPlayerLevel then
player:sendCancelMessage("You dont have enough level to enter the city war")
return false
end

if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) ~= true and player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
player:sendCancelMessage("You must be in pz or not have infight to enter the city war")
return false
end

if isInArray({3, 4, 7, 8}, player:getVocation():getId()) and #warConfig[4] == maxfrontline then
player:sendCancelMessage("Paladins and Knights are not allowed in this city war.")
return false
end

local maxfrontlinereal = warConfig[4][maxfrontline]
local ips = 0
local guildonline = playerguild:getMembersOnline()
local totalonline = 0
local frontline = 0
for i=1, #guildonline do
if guildonline[i]:getStorageValue(warStorages.inArena) == 1 then
totalonline = totalonline + 1
if guildonline[i]:getIp() == player:getIp() then
ips = ips + 1
end
if isInArray({3, 4, 7, 8}, guildonline[i]:getVocation():getId()) then
frontline = frontline + 1
end
end
end


if isInArray({3, 4, 7, 8}, player:getVocation():getId()) and frontline >= maxfrontlinereal then
player:sendCancelMessage("No more paladins and knights can enter the city war.")
return false
end

if maxplayers ~= #warConfig[5] and totalonline >= warConfig[5][maxplayers] then
player:sendCancelMessage("No more players are allowed from your guild")
return false
end

if ips ~= 0 and multiclient ~= #warConfig[11] and ((multiclient == 1 and ips > 0) or (tonumber(warConfig[11][multiclient]) and warConfig[11][multiclient] <= ips)) then
player:sendCancelMessage("No more mc are allowed.")
return false
end

if maxlevel ~= #warConfig[3] and warConfig[3][maxlevel] < player:getLevel() then
player:setTempLevel(warConfig[3][maxlevel])
end

if playerguild:getId() == guild1 then
player:teleportTo(warConfig[1][town][2])
else
player:teleportTo(warConfig[1][town][3])
end

player:registerEvent("CityWar")
player:setStorageValue(warStorages.inArena, 1)
player:setStorageValue(warStorages.areaRunes, arearunes)
player:setStorageValue(warStorages.ueSpells, uespells)
player:setStorageValue(warStorages.ssaMight, ssamight)
player:setStorageValue(warStorages.summons, summons)
player:setStorageValue(warStorages.expLoss, exploss)
if summons == 2 then
local summons = player:getSummons()
if #summons > 0 then
for i=1, #summons do
summons[i]:remove()
end
end
end
return false
end


--[[if param == "outfit" then
if player:getGuildLevel() < 2 then
player:sendCancelMessage("You are not allowed to use this command")
return false
end
if player:getStorageValue(warStorages.inArena) ~= 1 then
player:sendCancelMessage("You must be inside a city war!")
return false
end
if player:getExhaustion(warStorages.exhChange) > 0 then
player:sendCancelMessage("You must wait 30 sec between outfit/color changes!")
return false
end
local newoutfit = player:getOutfit()
newoutfit.lookAddons = 0
for _, pid in pairs(playerguild:getMembersOnline()) do 
if pid:getStorageValue(warStorages.inArena) == 1 and pid ~= player then
pid:setOutfit(newoutfit)
end
end
player:setExhaustion(warStorages.exhChange, 30)
player:sendCancelMessage("Outfit change made with success!")
return false
end]]--

if param == "colors" then
if player:getGuildLevel() < 2 then
player:sendCancelMessage("You are not allowed to use this command")
return false
end
if player:getStorageValue(warStorages.inArena) ~= 1 then
player:sendCancelMessage("You must be inside a city war!")
return false
end
if player:getExhaustion(warStorages.exhChange) > 0 then
player:sendCancelMessage("You must wait 30 sec between outfit/color changes!")
return false
end
local newoutfit = player:getOutfit()
local oldoutfit
for _, pid in pairs(playerguild:getMembersOnline()) do 
if pid:getStorageValue(warStorages.inArena) == 1 and pid ~= player then
oldoutfit = pid:getOutfit()
oldoutfit.lookHead = newoutfit.lookHead
oldoutfit.lookBody = newoutfit.lookBody
oldoutfit.lookLegs = newoutfit.lookLegs
oldoutfit.lookFeet = newoutfit.lookFeet
pid:setOutfit(oldoutfit)
end
end
player:setExhaustion(warStorages.exhChange, 30)
player:sendCancelMessage("Color change made with success!")
return false
end

if player:getGuildLevel() ~= 3 then
player:sendCancelMessage("You are not the leader of your guild.")
return false
end

if param == "end" then

local warquery = db.storeQuery("SELECT id, guild1, guild2, name1, name2 FROM `guild_wars` WHERE (`guild1` = " .. player:getGuild():getId() .. " OR `guild2` = " .. player:getGuild():getId() .. ") AND `ended` = 0 AND `status` = 1")
if warquery == false then
player:sendCancelMessage("You are not in guild war.")
result.free(warquery)
return false
end
local guild1 = result.getNumber(warquery, "guild1")
local guild2 = result.getNumber(warquery, "guild2")
local name1 = result.getString(warquery, "name1")
local name2 = result.getString(warquery, "name2")
result.free(warquery)

local citywarinvite = db.storeQuery("SELECT warid FROM citywar WHERE (guild1 = "..playerguild:getId().." OR guild2 = "..playerguild:getId()..") AND state = 1")
if citywarinvite == false then
player:sendCancelMessage("You are not in a city war.")
result.free(citywarinvite)
return false
end
local warId = result.getNumber(citywarinvite, "warid")
result.free(citywarinvite)

db.query("UPDATE guild_wars SET status = "..(name1 == player:getGuild():getName() and 3 or 2).." WHERE id = "..warId)
endCityWar(nil, warId, nil, false)
broadcastMessage("[City War]\nWar between "..name1.." ("..getGuildKills(guild1, warId).." frags) and "..name2.." ("..getGuildKills(guild2, warId).." frags) was ended by the guild leader of "..playerguild:getName(), MESSAGE_EVENT_ADVANCE)

return false
end

-- Guild Leader commands




local split = param:split(",")
if #split == 1 then
local query = db.storeQuery("SELECT id, ownerid FROM guilds WHERE name = ('" .. param.."')")
if query == false then
player:sendCancelMessage("There is no guild with that name.")
result.free(query)
return false
end
local guildId = result.getNumber(query, "id")
local ownerId = result.getNumber(query, "ownerid")
result.free(query)

if playerguild:getId() == guildId then
player:sendCancelMessage("You can't invite your own guild")
return false
end

local warquery = db.storeQuery("SELECT id FROM citywar WHERE (guild1 = "..playerguild:getId().." OR guild2 = "..guildId.." OR guild1 = "..guildId.." OR guild2 = "..playerguild:getId()..") AND state = 1")
if warquery ~= false then
player:sendCancelMessage("Your guild or the other is already in a city war")
result.free(warquery)
return false
end
result.free(warquery)

local citywarinvite = db.storeQuery("SELECT id FROM citywar WHERE ((guild1 = "..playerguild:getId().." AND guild2 = "..guildId..") OR (guild1 = "..guildId.." AND guild2 = "..playerguild:getId()..")) AND state = 0")
if citywarinvite ~= false then
player:sendCancelMessage("There's already a pending invitation between the guilds!")
result.free(citywarinvite)
return false
end
result.free(citywarinvite)

local eguildleader = Player(ownerId)
if not eguildleader then
player:sendCancelMessage("Enemy leader must be online to declare war.")
return false
end

if player:getLevel() < warMinGuildLeaderLevel or eguildleader:getLevel() < warMinGuildLeaderLevel then
player:sendCancelMessage("Both leaders must be level "..warMinGuildLeaderLevel.." or higher.")
return false
end

warModalWindow(player, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, {guildId, param})
return false
end
if split[1] == "accept" then

local query = db.storeQuery("SELECT id, name FROM guilds WHERE name = ('" .. split[2]:gsub("%s+", "", 1).."')")
if query == false then
player:sendCancelMessage("There is no guild with that name.")
result.free(query)
return false
end

local enemyguildid = result.getNumber(query, "id")
local enemyguildname = result.getString(query, "name")
result.free(query)
local playerguild = player:getGuild()
local warquery = db.storeQuery("SELECT id, frags_limit FROM guild_wars WHERE guild1 = ".. enemyguildid .." AND guild2 = ".. playerguild:getId() .." AND status = 0 AND ended = 0")
if warquery == false then
player:sendCancelMessage("You don't have pending invitations with the guild "..split[2]:gsub("%s+", "", 1)..".")
result.free(warquery)
return false
end

local warId = result.getNumber(warquery, "id")
local frags = result.getNumber(warquery, "frags_limit")
result.free(warquery)
local citywarquery = db.storeQuery("SELECT id FROM citywar WHERE warid = "..warId)
if citywarquery == false then
player:sendCancelMessage("There is no pending invitation to city war with the guild "..split[2]:gsub("%s+", "", 1)..".")
result.free(citywarquery)
return false
end

result.free(citywarquery)
acceptWarWindow(player, warId, enemyguildname, frags)
return false
end



if split[1] == "cancel" then

local query = db.storeQuery("SELECT id FROM guilds WHERE name = ('" .. split[2]:gsub("%s+", "", 1).."')")
if query == false then
player:sendCancelMessage("There is no guild with that name.")
result.free(query)
return false
end

local enemyguildid = result.getNumber(query, "id")
result.free(query)
local playerguild = player:getGuild()
local warquery = db.storeQuery("SELECT id, name1, name2 FROM guild_wars WHERE ((guild1 = ".. enemyguildid .." AND guild2 = ".. playerguild:getId() ..") OR (guild1 = "..playerguild:getId().." AND guild2 = "..enemyguildid..")) AND status = 0 AND ended = 0")
if warquery == false then
player:sendCancelMessage("You don't have pending invitations with the guild "..split[2]:gsub("%s+", "", 1)..".")
result.free(warquery)
return false
end
local warId = result.getNumber(warquery, "id")
local name1 = result.getString(warquery, "name1")
local name2 = result.getString(warquery, "name2")
result.free(warquery)

local citywarquery = db.storeQuery("SELECT id FROM citywar WHERE warid = "..warId)
if citywarquery == false then
player:sendCancelMessage("There is no pending invitation to city war with the guild "..split[2]:gsub("%s+", "", 1)..".")
result.free(citywarquery)
return false
end
result.free(citywarquery)

broadcastMessage("[City War]\nThe war invitation between "..name1.." and "..name2.." was cancelled by the guild "..player:getGuild():getName()..".", MESSAGE_EVENT_ADVANCE)
db.query("UPDATE guild_wars SET status = "..(name1 == player:getGuild():getName() and 3 or 2).." WHERE id = "..warId)
db.query("UPDATE citywar SET state = "..(name1 == player:getGuild():getName() and 3 or 2).." WHERE warid = "..warId)
return false
end
    return false
end

cityWarCommand:separator(" ")
cityWarCommand:register()