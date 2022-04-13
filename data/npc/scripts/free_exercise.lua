local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
npcHandler:onThink()
end

local voices = {
{ text = "Get your free exercise weapon here!!" }
}

local config = {
str = 54839,
charges = 2000
}

local function creatureSayCallback(cid, type, msg)
if not npcHandler:isFocused(cid) then
return false
end
local player = Player(cid)

if msgcontains(msg, "yes") or msgcontains(msg, "reward") or msgcontains(msg, "axe") or msgcontains(msg, "sword") or msgcontains(msg, "club") then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end

if player:getVocation():getBaseId() == VOCATION.BASE_ID.KNIGHT then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end
npcHandler:say("Would you like an {axe}, {sword} or a {club}?", cid)
npcHandler.topic[cid] = 2
end


if player:getVocation():getBaseId() == VOCATION.BASE_ID.PALADIN then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end
npcHandler:say("Here you go.", cid)
player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32127, config.charges)
player:getStorageValue(config.str)
player:setStorageValue(config.str, os.time() + (24000 * 60 * 60))
npcHandler.topic[cid] = 0
end

if player:getVocation():getBaseId() == VOCATION.BASE_ID.SORCERER then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end
npcHandler:say("Here you go.", cid)
player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32129, config.charges)
player:getStorageValue(config.str)
player:setStorageValue(config.str, os.time() + (24000 * 60 * 60))
npcHandler.topic[cid] = 0
end

if player:getVocation():getBaseId() == VOCATION.BASE_ID.DRUID then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end
npcHandler:say("Here you go.", cid)
player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32128, config.charges)
player:getStorageValue(config.str)
player:setStorageValue(config.str, os.time() + (24000 * 60 * 60))
npcHandler.topic[cid] = 0
end


if npcHandler.topic[cid] == 2 then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end
if msgcontains(msg, 'axe') then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end
npcHandler:say("Here you go.", cid)
player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32125, config.charges)
player:setStorageValue(config.str, os.time() + (24000 * 60 * 60))
end

if msgcontains(msg, 'club') then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end
npcHandler:say("Here you go.", cid)
player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32126, config.charges)
player:setStorageValue(config.str, os.time() + (24000 * 60 * 60))
end

if msgcontains(msg, 'sword') then
if player:getStorageValue(config.str) > os.time() then
npcHandler:say("Rewards can only be collected only a 1 time", cid)
npcHandler.topic[cid] = 0
return true
end

npcHandler:say("Here you go.", cid)
player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32124, config.charges)
player:setStorageValue(config.str, os.time() + (24000 * 60 * 60))
end
end
end
end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|!, Would you like to receive a {reward} exercise weapon?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "This ungraceful haste is most suspicious!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())