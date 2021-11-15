local info = {
	bossName = "The Unwelcome",
	leader = Position(33736, 31537, 14),
	fromPos = Position(33697, 31529, 14),
	toPos = Position(33722, 31551, 14),
	exitPos = Position(33740, 31540, 14),
	timer = Storage.FeasterOfSouls.TheUnwelcome.UnwelcomeTimer,
}

local unwelcome = Action()
function unwelcome.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63063 then
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
					nPlayer:teleportTo(Position(33709, 31545, 14))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local theUnwelcome = Game.createMonster("The Unwelcome", Position(33708, 31534, 14))
			if theUnwelcome then
				theUnwelcome:registerEvent('theUnwelcomeThink')
				theUnwelcome:registerEvent('theUnwelcomeHealth')
				theUnwelcome:setStorageValue(Storage.FeasterOfSouls.TheUnwelcome.Questline, 1)
			end
			THEUNWELCOME_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

unwelcome:uid(63063)
unwelcome:register()