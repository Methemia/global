local info = {
	bossName = "Fugue",
	middle = Position(32374, 32484, 2),
	fromPos = Position(32364, 32474, 2),
	toPos = Position(32382, 32482, 2),
	exitPos = Position(32383, 32478, 2),
	timer = Storage.LionOrder.LionBastion.FugueTimer,
}

local lionFugue = Action()
function lionFugue.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63200 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.middle.x - 2, info.middle.x + 2 do
				for y = info.middle.y, info.middle.y do
					local sqm = Tile(Position(x, y, 2))
					if sqm and sqm:getGround():getId() == 20293 then
						local player_ = sqm:getTopCreature()
						if player_ and player_:isPlayer() then
							if player_:getStorageValue(info.timer) > os.time() then
								player_:getPosition():sendMagicEffect(CONST_ME_POFF)
								player_:sendCancelMessage('You are still exhausted from your last battle.')
								return true
							end
							table.insert(playersTable, player_:getId())
						end
					end
				end
			end
			for _, p in pairs(playersTable) do
				local nPlayer = Player(p)
				if nPlayer then
					nPlayer:teleportTo(Position(32374, 32479, 2))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local fugue = Game.createMonster("Fugue", Position(32365, 32479, 2))
			if fugue then
				fugue:registerEvent('fugueThink')
				fugue:registerEvent('fugueHealth')
				fugue:setStorageValue(Storage.LionOrder.LionBastion.Questline, 1)
			end
			FUGUE_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

lionFugue:uid(63200)
lionFugue:register()