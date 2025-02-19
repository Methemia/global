local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_UNDEFINEDDAMAGE)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setFormula(-1, 60, -1, 60)
combat:addCondition(condition)

function onCastSpell(creature, var)
    if not combat:execute(creature, var) then
        return false
    end

    creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    return true
end