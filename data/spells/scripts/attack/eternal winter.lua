local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 6)
	local max = (level / 5) + (maglevel * 12)
	if player:getStorageValue(warStorages.ueSpells) == 2 then
		min = min * 0.5
		max = max * 0.5
	end
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	if creature:getStorageValue(warStorages.ueSpells) == 3 then
		creature:sendCancelMessage("You can't use this spell in this city war.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	return combat:execute(creature, variant)
end
