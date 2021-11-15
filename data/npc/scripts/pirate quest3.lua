 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


local function greetCallback(cid)
	local player = Player(cid)
		npcHandler:setMessage(MESSAGE_GREET, 'Bienvenido a Feyrist, puede que necesitemos tu ayuda.')
	return true
end


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then return false end
	local player = Player(cid)
	local state = player:getStorageValue(Storage.PiratsTails.Questline)
	if msgcontains('mission', msg) then
	if state == -1 then
	npcHandler:say({"Por supuesto, necesitaremos de tu ayuda por aqui...", "Podrias partir por matar a TentuglyHead...", "Luego de eso podre entregarte misiones mas relevantes"}, cid)
	player:setStorageValue(Storage.PiratsTails.Questline, 1)
	player:setStorageValue(Storage.PiratsTails.RatMiral.FinalMission, 1)
	player:setStorageValue(Storage.PiratsTails.RatMiral.BossCounter, 0)
	return true
	elseif state == 1 then
	if player:getStorageValue(Storage.PiratsTails.RatMiral.BossCounter) < 1 or player:getStorageValue(Storage.PiratsTails.RatMiral.LastKilled) ~= 1 then
	selfSay("No tienes nada que reportar, recuerda que debes matar 3 bosses.", cid)
	return true
	else
	player:setStorageValue(Storage.PiratsTails.Questline, 2)
	player:setStorageValue(Storage.PiratsTails.RatMiral.FinalMission, 2)
	player:setStorageValue(Storage.PiratsTails.RatMiral.ClickCounter, 0)
		player:addMount(175)
	npcHandler:say({"Cumpliste con la mision? Genial! Pero todavia hay cosas por hacer aca en Pirate island...", "Ahora necesito que liberes a 5 de mis hadas, las cuales capturaron en los alrededores de Feyrist...", "Ademas necesito que recuperes el dark moon mirror, lo tienen que haber ocultado por ahi, confio en que lo lograras."}, cid)
	return true
	end
	elseif state == 2 then
	if player:getStorageValue(Storage.PiratsTails.RatMiral.ClickCounter) < 1 or player:getStorageValue(Storage.PiratsTails.RatMiral.BossKill) ~= 1 then
	selfSay("No tienes nada que reportar, necesito que obtengas el dark moon mirror y que liberes 5 hadas, lo recuerdas?", cid)
	return true
	else
	player:setStorageValue(Storage.PiratsTails.Questline, 3)
	player:setStorageValue(Storage.PiratsTails.RatMiral.FinalMission, 3)
	player:setStorageValue(Storage.PiratsTails.RatMiral.Counter, 0)
	player:addItem(29032, 1)
	player:addItem(29034, 1)
	npcHandler:say({"Lo lograste! Ya volvieron las hadas a casa, ahora necesito algo aun mas importante...", "Tienes que cargar con energia estos 2 objetos que te acabo de entregar, junto con el dark moon mirror que obtuviste antes. Reporta la mision cuando termines."}, cid)
	return true
	end
	elseif state == 3 then
	if player:getStorageValue(Storage.PiratsTails.RatMiral.Counter) < 1 or player:getStorageValue(Storage.PiratsTails.RatMiral.BossKill2) ~= 1 then
	selfSay("blablabla, necesito que obtengas el dark moon mirror y que liberes 5 hadas, lo recuerdas?", cid)
	return true
	else
	player:setStorageValue(Storage.PiratsTails.Questline, 4)
	player:setStorageValue(Storage.PiratsTails.RatMiral.FinalMission, 4)
	player:addItem(2160, 1)
	player:addItem(2160, 1)
	npcHandler:say({"Lo lograste! Ya volvieron las hadas a casa, ahora necesito algo aun mas importante...", "Tienes que cargar con energia estos 2 objetos que te acabo de entregar, junto con el dark moon mirror que obtuviste antes. Reporta la mision cuando termines."}, cid)
	return true
	end
	
	elseif state == 4 then
	selfSay("No hay mas misiones por aqui, lo lamento, pero eres libre de venir cuando gustes", cid)
	return true
	end
	end
	
		npcHandler.topic[cid] = 0
end	


npcHandler:setMessage(MESSAGE_FAREWELL, 'Feyrist necesita tu ayuda mas que nunca.')
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
