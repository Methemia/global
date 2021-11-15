local info = {
	bossName = "Ratmiral Blackwhiskers",
	leader = Position(33888, 31467, 15),
	fromPos = Position(33883, 31422, 15),
	toPos = Position(33919, 31456, 15),
	exitPos = Position(33891, 31197, 7),
	timer = Storage.PiratsTails.RatMiral.RatMiralTimeer,
}

local ratMiral = Action()
function ratMiral.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 64343 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.leader.x, info.leader.x + 4 do
				for y = info.leader.y, info.leader.y do
					local sqm = Tile(Position(x, y, 15))
					if sqm and sqm:getGround():getId() == 20293 then
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
					nPlayer:teleportTo(Position(33896, 31452, 15))
					nPlayer:setStorageValue(info.timer, os.time() + 20*60*60)
				end
			end
			local ratmiralBlackwhiskers = Game.createMonster("Ratmiral Blackwhiskers", Position(33901, 31431, 14))
			Game.createMonster("Weak Spot", Position(33897, 31442, 15))

			Game.createMonster("Smelly Cheese", Position(33895, 31448, 15))
			Game.createMonster("Smelly Cheese", Position(33889, 31444, 15))
			Game.createMonster("Smelly Cheese", Position(33902, 31453, 15))
			Game.createMonster("Smelly Cheese", Position(33899, 31443, 15))
			Game.createMonster("Smelly Cheese", Position(33896, 31433, 15))
			Game.createMonster("Smelly Cheese", Position(33905, 31433, 15))
			Game.createMonster("Smelly Cheese", Position(33894, 31424, 15))
			Game.createMonster("Smelly Cheese", Position(33902, 31424, 15))
			Game.createMonster("Smelly Cheese", Position(33907, 31430, 15))
			Game.createMonster("Smelly Cheese", Position(33896, 31425, 14))
			Game.createMonster("Smelly Cheese", Position(33905, 31428, 14))
			Game.createMonster("Smelly Cheese", Position(33901, 31435, 14))

			Game.createMonster("Pirat Artillerist", Position(33905, 31452, 15))
			Game.createMonster("Pirat Artillerist", Position(33888, 31446, 15))

			Game.createMonster("Elite Pirat", Position(33897, 31449, 15))
			Game.createMonster("Elite Pirat", Position(33900, 31445, 15))
			Game.createMonster("Elite Pirat", Position(33902, 31448, 15))
			Game.createMonster("Elite Pirat", Position(33897, 31428, 15))
			Game.createMonster("Elite Pirat", Position(33902, 31428, 15))
			Game.createMonster("Elite Pirat", Position(33900, 31434, 15))


			Game.createMonster("Rum Barrel", Position(33905, 31443, 15))
			Game.createMonster("Rum Barrel", Position(33909, 31448, 15))
			Game.createMonster("Rum Barrel", Position(33901, 31453, 15))
			Game.createMonster("Rum Barrel", Position(33891, 31452, 15))
			Game.createMonster("Rum Barrel", Position(33887, 31448, 15))
			Game.createMonster("Rum Barrel", Position(33890, 31443, 15))

			Game.createMonster("Rateye Ric", Position(33892, 31445, 15))
			Game.createMonster("Rateye Ric", Position(33895, 31445, 15))
			if ratmiralBlackwhiskers then
				ratmiralBlackwhiskers:registerEvent('ratmiralBlackwhiskersThink')
				ratmiralBlackwhiskers:registerEvent('ratmiralBlackwhiskersHealth')
				ratmiralBlackwhiskers:setStorageValue(Storage.PiratsTails.RatMiral.Questline, 1)
			end
			RATMIRALBLACKWHISKERS_MAY_TRANSFORM = 0
			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

ratMiral:uid(64343)
ratMiral:register()