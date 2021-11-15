local guildTarget = TalkAction("!target")
function guildTarget.onSay(player, words, param)
    local creature = player:getTarget()
    local color = 11

    player:sendCreatureSquare(creature, color)
    creature:getPosition():sendMagicEffect(CONST_ME_TUTORIALSQUARE)
    creature:say("Target", TALKTYPE_MONSTER_SAY)
    return false
end

guildTarget:register()