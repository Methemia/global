local info = {
	bossName = "Faceless Bane",
	leader = Position(33638, 32562, 13),
	fromPos = Position(33609, 32555, 13),
	toPos = Position(33627, 32570, 13),
	exitPos = Position(33618, 32524, 15),
	timer = Storage.DreamCourts.FacelessBane.FacelessTimer,
}

local facelessBoss = Action()
function facelessBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63023 then
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
					nPlayer:teleportTo(Position(33617, 32567, 13))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local facelessBane = Game.createMonster("Faceless Bane", Position(33617, 32560, 13))
			if facelessBane then
				facelessBane:registerEvent('facelessBaneThink')
				facelessBane:registerEvent('facelessBaneHealth')
				facelessBane:setStorageValue(Storage.DreamCourts.FacelessBane.Questline, 1)
			end
			FACELESSBANE_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

facelessBoss:uid(63023)
facelessBoss:register()