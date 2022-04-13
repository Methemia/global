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
	local state = player:getStorageValue(Storage.Tibiana.SoulWarEnd)
	if msgcontains('mission', msg) then
	if state == -1 then
	npcHandler:say({"We need your help...", "I need you to go kill Goshnars Malice 1 times...", "then come back to give you another mission"}, cid)
	player:setStorageValue(Storage.Tibiana.SoulWarEnd, 1)
	return true
	elseif state == 1 then
	if player:getStorageValue(Storage.Tibiana.GoshnarsMaliceKilled) ~= 1 then
	selfSay("You have nothing to report, remember that you must kill Goshnars Malice 1 times.", cid)
	return true
	else
	player:setStorageValue(Storage.Tibiana.SoulWarEnd, 2)
	npcHandler:say({"Did you accomplish the mission? Brilliant! But there are still things to do here  ...", "I need you to go kill Goshnars Spice 1 times..."}, cid)
	return true
	end
	elseif state == 2 then
	if player:getStorageValue(Storage.Tibiana.GoshnarsSpiceKilled) ~= 1 then
	selfSay("You have nothing to report, remember that you must kill Goshnars Spice 1 times", cid)
	return true
	else
	player:setStorageValue(Storage.Tibiana.SoulWarEnd, 3)
	npcHandler:say({"Did you accomplish the mission? Brilliant! But there are still things to do here  ...", "I need you to go kill Goshnars Hatred 1 times..."}, cid)
		return true
	end
	elseif state == 3 then
	if player:getStorageValue(Storage.Tibiana.GoshnarsHatredKilled) ~= 1 then
	selfSay("You have nothing to report, remember that you must kill Goshnars Hatred 1 times", cid)
	return true
	else
	player:setStorageValue(Storage.Tibiana.SoulWarEnd, 4)
	npcHandler:say({"Did you accomplish the mission? Brilliant! But there are still things to do here  ...", "I need you to go kill Goshnars Cruelty 1 times..."}, cid)
		return true
	end
	elseif state == 4 then
	if player:getStorageValue(Storage.Tibiana.GoshnarsCrueltyKilled) ~= 1 then
	selfSay("You have nothing to report, remember that you must kill Goshnars Cruelty 1 times", cid)
	return true
	else
	player:setStorageValue(Storage.Tibiana.SoulWarEnd, 5)
	npcHandler:say({"Did you accomplish the mission? Brilliant! But there are still things to do here  ...", "I need you to go kill Goshnars Greed 1 times..."}, cid)
	return true
	end
	elseif state == 5 then
	if player:getStorageValue(Storage.Tibiana.GoshnarsGreedKilled) ~= 1 then
	selfSay("You have nothing to report, remember that you must kill Goshnars Greed 1 times", cid)
	return true
	else
	player:setStorageValue(Storage.Tibiana.SoulWarEnd, 6)
	npcHandler:say({"Did you accomplish the mission? Brilliant! But there are still things to do here  ...", "I need you to go kill Goshnars Megalomania 1 times..."}, cid)
	return true
	end
	elseif state == 6 then
	if player:getStorageValue(Storage.Tibiana.GoshnarsMegalomaniaKilled) ~= 1 then
	selfSay("You have nothing to report, remember that you must kill Goshnars Megalomania 1 times", cid)
	return true
	else
	player:setStorageValue(Storage.Tibiana.SoulWarEnd, 7)
	npcHandler:say({"Congratulations you made it, now get these rewards..."}, cid)
	return true
	end	
	elseif state == 7 then
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
