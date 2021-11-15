local info = {
	bossName = "Lord Azaram",
	leader = Position(33422, 31493, 13),
	fromPos = Position(33415, 31463, 13),
	toPos = Position(33433, 31482, 13),
	exitPos = Position(33423, 31497, 13),
	timer = Storage.GraveDanger.DukeCarlin.AzaramTimer,
}

local azaramCarlin = Action()
function azaramCarlin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63203 then
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
					nPlayer:teleportTo(Position(33424, 31480, 13))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local lordAzaram = Game.createMonster("Lord Azaram", Position(33425, 31472, 13))
			if lordAzaram then
				lordAzaram:registerEvent('lordAzaramThink')
				lordAzaram:registerEvent('lordAzaramHealth')
				lordAzaram:setStorageValue(Storage.GraveDanger.DukeCarlin.Questline, 1)
			end
			LORDAZARAM_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

azaramCarlin:uid(63203)
azaramCarlin:register()