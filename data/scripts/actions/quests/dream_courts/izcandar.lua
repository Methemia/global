local info = {
	bossName = "Izcandar The Banished",
	leader = Position(32208, 32021, 13),
	fromPos = Position(32199, 32039, 14),
	toPos = Position(32216, 32056, 14),
	exitPos = Position(32210, 32035, 13),
	timer = Storage.DreamCourts.DreamIzcandar.IzcandarTimer,
}

local izcandar = Action()
function izcandar.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63024 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.leader.x, info.leader.x do
				for y = info.leader.y, info.leader.y + 4 do
					local sqm = Tile(Position(x, y, 13))
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
					nPlayer:teleportTo(Position(32223, 32048, 14))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local izcandarChampionOfSummer = Game.createMonster("Izcandar Champion of Summer", Position(32205, 32047, 14))
			if izcandarChampionOfSummer then
				izcandarChampionOfSummer:registerEvent('izcandarChampionOfSummerThink')
				izcandarChampionOfSummer:registerEvent('izcandarChampionOfSummerHealth')
				izcandarChampionOfSummer:setStorageValue(Storage.DreamCourts.DreamIzcandar.Questline, 1)
			end
			IZCANDARCHAMPIONOFSUMMER_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)

			local izcandarChampionOfWinter = Game.createMonster("Izcandar Champion of Winter", Position(32209, 32047, 14))
			if izcandarChampionOfWinter then
				izcandarChampionOfWinter:registerEvent('izcandarChampionOfWinterThink')
				izcandarChampionOfWinter:registerEvent('izcandarChampionOfWinterHealth')
				izcandarChampionOfWinter:setStorageValue(Storage.DreamCourts.DreamIzcandar.Questline, 1)
			end
			IZCANDARCHAMPIONOFWINTER_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

izcandar:uid(63024)
izcandar:register()