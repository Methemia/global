local info = {
	bossName = "Brain Head",
	leader = Position(31998, 32338, 10),
	fromPos = Position(31941, 32313, 10),
	toPos = Position(31968, 32337, 10),
	exitPos = Position(32001, 32345, 10),
	timer = Storage.FeasterOfSouls.BrainHead.BrainHeadTimer,
}

local monsters = {
	{position = Position(31953, 32324, 10)},
	{position = Position(31955, 32324, 10)},
	{position = Position(31955, 32326, 10)},
	{position = Position(31953, 32326, 10)},
	{position = Position(31945, 32320, 10)},
	{position = Position(31960, 32320, 10)},
	{position = Position(31961, 32331, 10)},
	{position = Position(31945, 32331, 10)}
}

local theBrainHead = Action()
function theBrainHead.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 63064 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.leader.x, info.leader.x + 4 do
				for y = info.leader.y, info.leader.y do
					local sqm = Tile(Position(x, y, 10))
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
					nPlayer:teleportTo(Position(31954, 32335, 10))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local brainHead = Game.createMonster("Brain Head", Position(31954, 32325, 10))
			if brainHead then
				brainHead:registerEvent('brainHeadThink')
				brainHead:registerEvent('brainHeadHealth')
				brainHead:setStorageValue(Storage.FeasterOfSouls.BrainHead.Questline, 1)
			end
			BRAINHEAD_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
			end
			for d = 1, #monsters do
			Game.createMonster('Cerebellum', monsters[d].position, true, true)
		end
	end
	return true
end

theBrainHead:uid(63064)
theBrainHead:register()