local info = {
	bossName = "The Pale Worm",
	leader = Position(33774, 31504, 14),
	fromPos = Position(33793, 31495, 14),
	toPos = Position(33820, 31517, 14),
	exitPos = Position(33775, 31508, 14),
	timer = Storage.FeasterOfSouls.ThePaleWorm.PaleTimer,
}

local paleWorm = Action()
function paleWorm.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63061 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.leader.x - 2, info.leader.x + 1 do
				for y = info.leader.y - 1, info.leader.y + 1 do
					local sqm = Tile(Position(x, y, 14))
					if sqm and sqm:getGround():getId() == 424 then
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
					nPlayer:teleportTo(Position(33806, 31512, 14))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local thePaleWorm = Game.createMonster("The Pale Worm", Position(33805, 31500, 14))
			if thePaleWorm then
				thePaleWorm:registerEvent('thePaleWormThink')
				thePaleWorm:registerEvent('thePaleWormHealth')
				thePaleWorm:setStorageValue(Storage.FeasterOfSouls.ThePaleWorm.Questline, 1)
			end
			THEPALEWORM_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

paleWorm:uid(63061)
paleWorm:register()