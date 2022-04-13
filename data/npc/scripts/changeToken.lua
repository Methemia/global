local talkState = {}
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end



function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  
    local item = 25380
    local player = Player(cid)
    local accountId = player:getAccountId()
    local points = 5
  
    if(msgcontains(msg, 'change token')) then
        if player:getItemCount(item) >= 1 then
            selfSay('you want to change tokens for tournament coins?.', cid)
            talkState[talkUser] = 1
        else
            selfSay('you dont have any tokens.', cid)
            talkState[talkUser] = 0
        end
        elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
            if not player:removeItem(item, 1) then
                selfSay('Your token must be gone, come back when you found it.', cid)
                talkState[talkUser] = 0
                return true
            end       
            db.query("UPDATE `accounts` SET `tournament_coins` = `tournament_coins` + " .. points .. " WHERE `id` = " .. accountId) -- For gesior user
        --    db.query("UPDATE znote_accounts SET points = points + " .. points .. " WHERE account_id = " .. accountId) -- For znote user
            selfSay('You have successful changed 1 token for 5 tournament coins.', cid)
            talkState[talkUser] = 0
            player:save()
        end
        if(msgcontains(msg, 'chajsdjnge coinsjdhjshdsjk')) then
            selfSay('you sure you want to buy a token for store coins?.', cid)
            talkState[talkUser] = 2
        elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
            if player:getPremiumPoints() <= points then -- For gesior user
            --if player:getZnotePoints() <= points then -- For znote user
               selfSay('You dont have enough points.', cid)
               return true
            end
            db.query("UPDATE `accounts` SET `coins` = `coins` - " .. points .. " WHERE `id` = " .. accountId) -- For gesior user
        --    db.query("UPDATE znote_accounts SET points = points - " .. points .. " WHERE account_id = " .. accountId) -- For znote user
            player:addItem(item, 1)
            talkState[talkUser] = 0
            selfSay('You have successful changed 5 tournament coins for 1 token.', cid)
            player:save()
        end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())