local info = {
	bossName = "The Nightmare Beast",
	leader = Position(32212, 32070, 15),
	fromPos = Position(32196, 32027, 15),
	toPos = Position(32226, 32049, 15),
	exitPos = Position(32213, 32083, 15),
	timer = Storage.DreamCourts.NightmareBeast.NightmareTimer,
}

local nightmareBeast = Action()
function nightmareBeast.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63030 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.leader.x - 2, info.leader.x + 2 do
				for y = info.leader.y, info.leader.y + 1 do
					local sqm = Tile(Position(x, y, 15))
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
					nPlayer:teleportTo(Position(32211, 32044, 15))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local theNightmareBeast = Game.createMonster("The Nightmare Beast", Position(32211, 32037, 15))
			if theNightmareBeast then
				theNightmareBeast:registerEvent('theNightmareBeastThink')
				theNightmareBeast:registerEvent('theNightmareBeastHealth')
				theNightmareBeast:setStorageValue(Storage.DreamCourts.NightmareBeast.Questline, 1)
			end
			THENIGHTMAREBEAST_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

nightmareBeast:uid(63030)
nightmareBeast:register()