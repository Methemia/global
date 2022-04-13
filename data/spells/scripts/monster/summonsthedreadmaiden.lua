local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

local maxsummons = 4

function onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 4 then
		mid = Game.createMonster("Green Soul Stealer", "Red Soul Stealer", "Blue Soul Stealer", creature:getPosition())
    		if not mid then
				return
			end
		mid:setMaster(creature)
	end
	return combat:execute(creature, var)
end
