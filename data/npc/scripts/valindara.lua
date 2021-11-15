local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local function greetCallback(cid)
	npcHandler.topic[cid] = 0
	return true
end

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then return false end
	local player = Player(cid)
	if npcHandler.topic[cid] == 0 then
		if msgcontains('swan cloak', msg) then
			if player:getStorageValue(Storage.ThreatenedDreams.FinalMission) ~= 5 then
				selfSay("I'm sorry, I'm busy right now to be making cloaks.", cid)
			elseif player:getStorageValue(Storage.ThreatenedDreams.ReceivedFeatherCloak) == -1 then
				selfSay("You did us a great favour, mortal being! Well, as I promised I will craft you a feathery cloak. Bring me one hundred swan feathers and I will make them into a beautiful robe. Do you have enough feathers yet?", cid)
				npcHandler.topic[cid] = 1
			elseif player:getStorageValue(Storage.ThreatenedDreams.ReceivedFeatherCloak) == 0 then
				if player:getStorageValue(Storage.ThreatenedDreams.WaitingTime) > os.time() then
					selfSay("I'm still crafting it, you have to wait until then.", cid)
				else
					selfSay("You're returning just in time. Here, take the cloak I crafted for you. Thanks again for helping us, mortal being.", cid)
					player:setStorageValue(Storage.ThreatenedDreams.ReceivedFeatherCloak, 1)
					player:addItem(29079, 1)
				end
			else
				selfSay("You already received your feather cloak.", cid)
			end
		end
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains('yes', msg) then
			if player:removeItem(29417, 100) then
				selfSay("Very good. I will craft the cloak for you. This will take some time, so return tomorrow please.", cid)
				player:setStorageValue(Storage.ThreatenedDreams.WaitingTime, os.time() + 20*60*60)
				player:setStorageValue(Storage.ThreatenedDreams.ReceivedFeatherCloak, 0)
			else
				selfSay("I'm sorry, you don't have the swan feathers with you.", cid)
			end
		else
			selfSay("Then I guess not then.", cid)
		end
		npcHandler.topic[cid] = 0
	end
end
function onThink()
    npcHandler:onThink()
end

local voices = { {text = 'Im eager for a bath in the lake.'},{text = 'Im interested in shiny precious things, if you have some.'},{text = 'No, you cant have this cloak.'} }
npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setMessage(MESSAGE_GREET, "Greatings, mortal beigin.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Yes, i have some potions and runes if you are interested. Or do you want to buy only potions or only runes?oh if you want sell or buy gems, your may also ask me.")
npcHandler:setMessage(MESSAGE_FAREWELL, "May enlightenment be your path, |PLAYERNAME|.")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
