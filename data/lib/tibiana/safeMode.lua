-- En /data/lib/lib.lua pon:
-- dofile('data/lib/safeMode.lua')

SAFE_MODE_OFF = 0
SAFE_MODE_ON = 1
SAFE_MODE_STORAGE = 60000

MAGIC_WALL_SAFE = 10546
WILD_GROWTH_SAFE = 11099

function Player.getPvPMode(self)
	resultId = db.storeQuery("SELECT `pvp_mode` FROM `players` WHERE `name` = '"..self:getName().."';")
	if not resultId then return 0 end
	return result.getDataInt(resultId, "pvp_mode")
end

function Player.setPvpMode(self, mode)
	return db.asyncQuery("UPDATE `players` SET `pvp_mode` = "..mode.." WHERE `name` = '"..self:getName().."';")
end

function Player.doPvPModeScan(self)
	if self:getPvPMode() == SAFE_MODE_ON then
		self:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You're currently protected by the Tibiana blessing, this bless will protect you from pvp situations but you aren't allowed participate on PvP fights aswell.")
		self:setStorageValue(SAFE_MODE_STORAGE, 1)
	else
		if self:getStorageValue(SAFE_MODE_STORAGE) == 1 then
			self:setStorageValue(SAFE_MODE_STORAGE, 0)
		end
	end
return true
end