local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STONES)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 1) + 6
	local max = (level / 5) + (magicLevel * 2.6) + 16
	if player:getStorageValue(warStorages.areaRunes) == 2 then
		min = min * 0.5
		max = max * 0.5
	end
	return -min * 1.1, -max * 1.1
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	if creature:getStorageValue(warStorages.areaRunes) == 3 then
		creature:sendCancelMessage("You can't use this rune in this city war.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	return combat:execute(creature, variant)
end
