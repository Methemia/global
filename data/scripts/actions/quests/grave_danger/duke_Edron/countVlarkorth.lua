local info = {
	bossName = "Count Vlarkorth",
	leader = Position(33455, 31413, 13),
	fromPos = Position(33447, 31428, 13),
	toPos = Position(33465, 31447, 13),
	exitPos = Position(33456, 31409, 13),
	timer = Storage.GraveDanger.DukeEdron.VlarkorthTimer,
}

local vlarkorthEdron = Action()
function vlarkorthEdron.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63205 then
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
					nPlayer:teleportTo(Position(33456, 31430, 13))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local countVlarkorth = Game.createMonster("Count Vlarkorth", Position(33456, 31437, 13))
			if countVlarkorth then
				countVlarkorth:registerEvent('countVlarkorthThink')
				countVlarkorth:registerEvent('countVlarkorthHealth')
				countVlarkorth:setStorageValue(Storage.GraveDanger.DukeEdron.Questline, 1)
			end
			COUNTVLARKORTH_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

vlarkorthEdron:uid(63205)
vlarkorthEdron:register()