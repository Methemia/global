
local rascacconTeleport = Action()
function rascacconTeleport.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getActionId() == 59700 then
		if player:getLevel() < 1 then
			player:sendCancelMessage("You need at least level 150.")
			toPosition:sendMagicEffect(CONST_ME_POFF)
		else
			player:teleportTo({x = 32942, y = 32030, z = 7})
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			Position({x = 32942, y = 32030, z = 7}):sendMagicEffect(CONST_ME_TELEPORT)
		end
	elseif item:getActionId() == 59701 then		
		player:teleportTo({x = 33774, y = 31347, z = 7})
		Position({x = 33774, y = 31347, z = 7}):sendMagicEffect(CONST_ME_TELEPORT)
		toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end	
	return true
end
rascacconTeleport:aid(59700)
rascacconTeleport:aid(59701)
rascacconTeleport:register()