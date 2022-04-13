local MaliceKill = CreatureEvent("MaliceKill")

function MaliceKill.onKill(player, target)
    if target:isPlayer() or target:getMaster() then
        return true
    end
    if player:getLevel() >= 400 then
        if target:getName() == "Goshnar's Malice" then
            for cid, damage in pairs(target:getDamageMap()) do
                local participant = Player(cid)
                if participant and participant:isPlayer() then
                    participant:setStorageValue(Storage.Tibiana.GoshnarsMaliceKilled, 1)
                end
            end
        end
    end
    return true
end
MaliceKill:register()