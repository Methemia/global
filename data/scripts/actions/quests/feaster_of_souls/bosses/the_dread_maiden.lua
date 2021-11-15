local info = {
	bossName = "The Dread Maiden",
	leader = Position(33739, 31506, 14),
	fromPos = Position(33703, 31495, 14),
	toPos = Position(33723, 31513, 14),
	exitPos = Position(33741, 31508, 14),
	timer = Storage.FeasterOfSouls.TheDreadMaiden.DreadTimer,
}

local dreadMaiden = Action()
function dreadMaiden.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63060 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.leader.x, info.leader.x + 4 do
				for y = info.leader.y, info.leader.y do
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
					nPlayer:teleportTo(Position(33711, 31508, 14))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local theDreadMaiden = Game.createMonster("The Dread Maiden", Position(33712, 31499, 14))
			if theDreadMaiden then
				theDreadMaiden:registerEvent('theDreadMaidenThink')
				theDreadMaiden:registerEvent('theDreadMaidenHealth')
				theDreadMaiden:setStorageValue(Storage.FeasterOfSouls.TheDreadMaiden.Questline, 1)
			end
			THEDREADMAIDEN_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

dreadMaiden:uid(63060)
dreadMaiden:register()