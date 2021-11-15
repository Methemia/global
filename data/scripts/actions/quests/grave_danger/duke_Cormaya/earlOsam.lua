local info = {
	bossName = "Earl Osam",
	leader = Position(33516, 31444, 13),
	fromPos = Position(33479, 31429, 13),
	toPos = Position(33497, 31447, 13),
	exitPos = Position(33518, 31438, 13),
	timer = Storage.GraveDanger.DukeCormaya.OsamTimer,
}

local osamCormaya = Action()
function osamCormaya.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63206 then
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
					nPlayer:teleportTo(Position(33488, 31445, 13))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local earlOsam = Game.createMonster("Earl Osam", Position(33489, 31437, 13))
			if earlOsam then
				earlOsam:registerEvent('earlOsamThink')
				earlOsam:registerEvent('earlOsamHealth')
				earlOsam:setStorageValue(Storage.GraveDanger.DukeCormaya.Questline, 1)
			end
			EARLOSAM_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

osamCormaya:uid(63206)
osamCormaya:register()