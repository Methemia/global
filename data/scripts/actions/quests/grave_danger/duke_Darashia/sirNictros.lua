local info = {
	bossName = "Sir Nictros",
	leader = Position(33424, 31413, 13),
	fromPos = Position(33414, 31428, 13),
	toPos = Position(33434, 31450, 13),
	exitPos = Position(33425, 31408, 13),
	timer = Storage.GraveDanger.DukeDarashia.NictrosTimer,
}

local nictrosDarashia = Action()
function nictrosDarashia.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63204 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.leader.x, info.leader.x + 4 do
				for y = info.leader.y, info.leader.y do
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
					nPlayer:teleportTo(Position(33424, 31432, 13))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local sirNictros = Game.createMonster("Sir Nictros", Position(33425, 31439, 13))
			if sirNictros then
				sirNictros:registerEvent('sirNictrosThink')
				sirNictros:registerEvent('sirNictrosHealth')
				sirNictros:setStorageValue(Storage.GraveDanger.DukeDarashia.Questline, 1)
			end
			SIRNICTROS_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)

			local sirBaeloc = Game.createMonster("Sir Baeloc", Position(33424, 31439, 13))
			if sirBaeloc then
				sirBaeloc:registerEvent('sirBaelocThink')
				sirBaeloc:registerEvent('sirBaelocHealth')
				sirBaeloc:setStorageValue(Storage.GraveDanger.DukeDarashia.Questline, 1)
			end
			SIRBAELOC_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

nictrosDarashia:uid(63204)
nictrosDarashia:register()