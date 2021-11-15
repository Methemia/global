local expPvp = CreatureEvent("ExpPvp")

function expPvp.onKill(creature, target, lastHit)

    local attackPlayer = Player(target)
    if not attackPlayer then
        return true
    end

    for id, damage in pairs(attackPlayer:getDamageMap()) do
        local player = Player(id)
        if player then
            if player:getIp() ~= target:getIp() then
                local experience = attackPlayer:getExperience()
                local expFormula = ((experience / 100) * 0.010)
                player:addExperience(math.floor(expFormula), true)
            else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You may not get a reward and experience by killing a player with the same IP as yours.')
            end
        end
    end
end
expPvp:register()