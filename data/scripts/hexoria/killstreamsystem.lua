-- Shared on Otland, continue to share scripts with eachother. Regards, Klonera/Joriku.
local storage = 8003
local intervalStorage = 8004
local maxTime = 10 -- max 10 seconds between kill before reset

local streaks = {
    [2] = "DOUBLE KILL!",
    [3] = "TRIPLE KILL!",
    [5] = "M-M-M-MONSTER KILL!!",
    [7] = "RAMPAGE!",
    [9] = "UNSTOPPABLE!",
    [12] = "HOLY SHIT!",
    [15] = "GODLIKE!!"
}

local creatureevent = CreatureEvent("kill_streak")

function creatureevent.onKill(creature, target)
    if creature:isPlayer() and target:isPlayer() then
        if os.time() >= creature:getStorageValue(intervalStorage) then
            creature:setStorageValue(storage, 0)
        end
        creature:setStorageValue(storage, creature:getStorageValue(storage) + 1)
        target:setStorageValue(storage, 0)
        creature:setStorageValue(intervalStorage, os.time() + maxTime)

        for _, pid in ipairs(Game.getPlayers()) do
            local s = {"killed", "cut into pieces", "detonated", "slaughted"}
            --Game.broadcastMessage("".. creature:getName() .." ".. s[math.random(1, #s)] .." ".. target:getName() ..".", MESSAGE_EVENT_ADVANCE)
        end
        local k = streaks[creature:getStorageValue(storage)]
        if k then
            creature:say(creature:getName() .. " - ".. k, TALKTYPE_MONSTER_SAY)
        end
    end
    return true
end

creatureevent:register()

local creatureevent2 = CreatureEvent("register")

function creatureevent2.onLogin(player)
    player:registerEvent("kill_streak")
    return true
end

creatureevent2:register()