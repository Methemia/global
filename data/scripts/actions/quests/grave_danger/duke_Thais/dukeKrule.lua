local info = {
	bossName = "Duke Krule",
	middle = Position(33455, 31493, 13),
	fromPos = Position(33447, 31463, 13),
	toPos = Position(33465, 31482, 13),
	exitPos = Position(33456, 31497, 13),
	timer = Storage.GraveDanger.DukeThais.KruleTimer,
}

local kruleThais = Action()
function kruleThais.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63202 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.middle.x, info.middle.x + 4 do
				for y = info.middle.y, info.middle.y do
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
					nPlayer:teleportTo(Position(33456, 31480, 13))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local duke = Game.createMonster("Duke Krule", Position(33457, 31472, 13))
			if duke then
				duke:registerEvent('dukeKruleThink')
				duke:registerEvent('dukeKruleHealth')
				duke:setStorageValue(Storage.GraveDanger.DukeThais.Questline, 1)
			end
			DUKEKRULE_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

kruleThais:uid(63202)
kruleThais:register()