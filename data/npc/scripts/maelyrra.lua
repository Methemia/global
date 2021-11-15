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
	local state = player:getStorageValue(Storage.ThreatenedDreams.FinalMission)
	if msgcontains('mission', msg) then
	if state == -1 then
	npcHandler:say({"Por supuesto, necesitaremos de tu ayuda por aqui...", "Podrias partir por matar 200 Enfeebled Silencers y Weakened Frazzlemaws, junto al jefe Kroazur...", "Luego de eso podre entregarte misiones mas relevantes"}, cid)
	player:setStorageValue(Storage.ThreatenedDreams.Start, 1)
	player:setStorageValue(Storage.ThreatenedDreams.FinalMission, 1)
	player:setStorageValue(Storage.ThreatenedDreams.MiniRoshaCounter, 0)
	return true
	elseif state == 1 then
	if player:getStorageValue(Storage.ThreatenedDreams.MiniRoshaCounter) < 200 or player:getStorageValue(Storage.ThreatenedDreams.KroazurKilled) ~= 1 then
	selfSay("No tienes nada que reportar, recuerda que debes matar 200 enfeebled silencers y/o weakened frazzlemaws y a Kroazur.", cid)
	return true
	else
	player:setStorageValue(Storage.ThreatenedDreams.FinalMission, 2)
	player:setStorageValue(Storage.ThreatenedDreams.FairyFreeCount, 0)
	npcHandler:say({"Cumpliste con la mision? Genial! Pero todavia hay cosas por hacer aca en Feyrist...", "Ahora necesito que liberes a 5 de mis hadas, las cuales capturaron en los alrededores de Feyrist...", "Ademas necesito que recuperes el dark moon mirror, lo tienen que haber ocultado por ahi, confio en que lo lograras."}, cid)
	return true
	end
	elseif state == 2 then
	if player:getStorageValue(Storage.ThreatenedDreams.FairyFreeCount) < 5 or player:getStorageValue(Storage.ThreatenedDreams.RewardFinal1) == -1 then
	selfSay("No tienes nada que reportar, necesito que obtengas el dark moon mirror y que liberes 5 hadas, lo recuerdas?", cid)
	return true
	else
	player:setStorageValue(Storage.ThreatenedDreams.FinalMission, 3)
	player:addItem(29032, 1)
	player:addItem(29034, 1)
	npcHandler:say({"Lo lograste! Ya volvieron las hadas a casa, ahora necesito algo aun mas importante...", "Tienes que cargar con energia estos 2 objetos que te acabo de entregar, junto con el dark moon mirror que obtuviste antes. Reporta la mision cuando termines."}, cid)
	return true
	end
	elseif state == 3 then
	if player:getItemCount(29031) < 1 or player:getItemCount(29033) < 1 or player:getItemCount(29035) < 1 then
	selfSay("No tienes nada que reportar, aun no tienes los 3 objetos, o simplemente no los tienes en tu bp.", cid)
	return true
	else
	player:setStorageValue(Storage.ThreatenedDreams.FinalMission, 4)
	player:setStorageValue(Storage.ThreatenedDreams.StoneMosaicCounter, 0)
	player:setStorageValue(Storage.ThreatenedDreams.DreamBirdTreeCounter, 0)
	player:setStorageValue(Storage.ThreatenedDreams.MoonSculptureCounter, 0)
	npcHandler:say({"Lo lograste! Bien, con estos objetos finalmente podremos reparar la barrera de Feyrist...", "Necesito que encuentres 15 puntos alrededor de Feyrist, 5 por objeto, los cuales reaccionaran con el poder del objeto en cierta hora del dia, asi podras reparar la barrera...", "Esta es tu ultima mision, si logras completarla te dare una Blossom Bag."}, cid)
	return true
	end
	elseif state == 4 then
	if player:getStorageValue(Storage.ThreatenedDreams.StoneMosaicCounter) < 5 or player:getStorageValue(Storage.ThreatenedDreams.DreamBirdTreeCounter) < 5 or player:getStorageValue(Storage.ThreatenedDreams.MoonSculptureCounter) < 5 then
	selfSay("La barrera sigue sin repararse, te falta algun punto por reparar, vuelve cuando termines.", cid)
	return true
	else
	player:setStorageValue(Storage.ThreatenedDreams.FinalMission, 5)
	player:addItem(29080, 1)
	selfSay("Lo lograste, reparaste la barrera y finalmente, aunque sea por un tiempo, estamos seguros de las bestias de Roshamuul. Gracias, ten como muestra de agradecimiento una Blossom Bag", cid)
	return true
	end
	elseif state == 5 then
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
