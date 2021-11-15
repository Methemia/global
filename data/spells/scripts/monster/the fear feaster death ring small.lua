local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
arr = {
{1, 0, 1},
{0, 2, 0},
{1, 0, 1}
}


local area = createCombatArea(arr)
combat:setArea(area)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
