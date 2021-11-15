 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


local function greetCallback(cid)
	local player = Player(cid)
		npcHandler:setMessage(MESSAGE_GREET, 'welcome, we need your help.')
	return true
end


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then return false end
	local player = Player(cid)
	local state = player:getStorageValue(Storage.PiratsTails.Questline)
	if msgcontains('mission', msg) then
	if state == -1 then
	npcHandler:say({"We need your help...", "I need you to go kill Tentuglys Head 1 times...", "then come back to give you another mission"}, cid)
	player:setStorageValue(Storage.PiratsTails.Questline, 1)
	player:setStorageValue(Storage.PiratsTails.RatMiral.FinalMission, 1)
	player:setStorageValue(Storage.PiratsTails.RatMiral.BossCounter, 0)
	return true
	elseif state == 1 then
	if player:getStorageValue(Storage.PiratsTails.RatMiral.BossCounter) < 1 or player:getStorageValue(Storage.PiratsTails.RatMiral.LastKilled) ~= 1 then
	selfSay("You have nothing to report, remember that you must kill Tentuglys Head 1 times.", cid)
	return true
	else
	player:setStorageValue(Storage.PiratsTails.Questline, 2)
	player:setStorageValue(Storage.PiratsTails.RatMiral.FinalMission, 2)
	player:setStorageValue(Storage.PiratsTails.RatMiral.ClickCounter, 0)
	npcHandler:say({"Did you accomplish the mission? Brilliant! But there are still things to do here on Pirate island ...", "I need you to go kill Ratmiral Blackwhiskers 2 times..."}, cid)
	return true
	end
	elseif state == 2 then
	if player:getStorageValue(Storage.PiratsTails.RatMiral.ClickCounter) < 2 or player:getStorageValue(Storage.PiratsTails.RatMiral.BossKill) ~= 1 then
	selfSay("You have nothing to report, remember that you must kill Ratmiral Blackwhiskers 2 times", cid)
	return true
	else
	player:setStorageValue(Storage.PiratsTails.Questline, 3)
	player:setStorageValue(Storage.PiratsTails.RatMiral.FinalMission, 3)
	player:setStorageValue(Storage.PiratsTails.RatMiral.Counter, 0)
	player:addItem(40412, 1)
	player:addMount(175)
	player:addOutfitAddon(1372, 3)	
	player:addOutfitAddon(1371, 3)
	npcHandler:say({"Congratulations you made it, now get these rewards..."}, cid)
	return true
	end	
	elseif state == 3 then
	selfSay("There are no more missions around here, I'm sorry, but you are free to come whenever you like.", cid)
	return true
	end
	end
	
		npcHandler.topic[cid] = 0
end	


npcHandler:setMessage(MESSAGE_FAREWELL, 'Feyrist necesita tu ayuda mas que nunca.')
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
