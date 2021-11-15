local moreRegen = CreatureEvent("moreRegen")
local regenCondition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
regenCondition:setTicks(-1)
regenCondition:setParameter(CONDITION_PARAM_HEALTHGAIN, 25)
regenCondition:setParameter(CONDITION_PARAM_HEALTHTICKS, 1000)
regenCondition:setParameter(CONDITION_PARAM_MANAGAIN, 25)
regenCondition:setParameter(CONDITION_PARAM_MANATICKS, 1000)

function moreRegen.onLogin(player)
    if player:getVipDays() > 1 then
        player:addCondition(regenCondition)
 end
       return true
    end

moreRegen:register()