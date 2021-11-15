local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
arr = {
{0, 1, 0},
{1, 2, 1},
{0, 1, 0}
}


local area = createCombatArea(arr)
combat:setArea(area)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
