local BrainHeadKills = CreatureEvent("BrainHeadKills")

function BrainHeadKills.onKill(player, target)
    if target:isPlayer() or target:getMaster() then
        return true
    end
    if player:getLevel() >= 300 then
        if target:getName() == "Brain Head" then
            for cid, damage in pairs(target:getDamageMap()) do
                local participant = Player(cid)
                if participant and participant:isPlayer() then
                    participant:setStorageValue(Storage.Quest.FeasterOfSouls.Bosses.BrainHead.Killed, 1)
                end
            end
        end
    end
    return true
end
BrainHeadKills:register()