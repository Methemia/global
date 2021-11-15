local info = {
	bossName = "The Fear Feaster",
	leader = Position(33734, 31471, 14),
	fromPos = Position(33704, 31462, 14),
	toPos = Position(33719, 31477, 14),
	exitPos = Position(33736, 31474, 14),
	timer = Storage.FeasterOfSouls.TheFearFeaster.FearTimer,
}

local fearFeaster = Action()
function fearFeaster.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63062 then
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
					nPlayer:teleportTo(Position(33712, 31474, 14))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local theFearFeaster = Game.createMonster("The Fear Feaster", Position(33711, 31466, 14))
			if theFearFeaster then
				theFearFeaster:registerEvent('theFearFeasterThink')
				theFearFeaster:registerEvent('theFearFeasterHealth')
				theFearFeaster:setStorageValue(Storage.FeasterOfSouls.TheFearFeaster.Questline, 1)
			end
			THEFEARFEASTER_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

fearFeaster:uid(63062)
fearFeaster:register()