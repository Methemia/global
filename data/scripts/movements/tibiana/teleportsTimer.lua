local UniqueTable = {
	-- Darkfang entrance
	[30801] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.DarkfangTimer,
		newPos = {x = 33055, y = 31889, z = 9},
		bossName = "Darkfang",
		bossPos = {x = 33059, y = 31891, z = 9}
	},
	-- bloodback entrance
	[30802] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.BloodbackTimer,
		newPos = {x = 33180, y = 32012, z = 8},
		bossName = "bloodback",
		bossPos = {x = 33182, y = 32014, z = 8}
	},
	-- Bloodback entrance
	[30803] = {
		value = 3,
		range = 1,
		timer = Storage.Tibiana.BloodvixenTimer,
		newPos = {x = 33447, y = 32040, z = 9},
		bossName = "Black Vixen",
		bossPos = {x = 33449, y = 32035, z = 9}
	},
	-- ShadowPelt entrance
	[30804] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.ShadowPeltTimer,
		newPos = {x = 33395, y = 32112, z = 9},
		bossName = "ShadowPelt",
		bossPos = {x = 33387, y = 32114, z = 9}
	},
	-- Sharpclaw entrance
	[30805] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.SharpclawTimer,
		newPos = {x = 33120, y = 31997, z = 9},
		bossName = "Sharpclaw",
		bossPos = {x = 33120, y = 32001, z = 9}
	},
	-- Unaz the Mean entrance
	[30806] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.UnazTheMeanTimer,
		newPos = {x = 33562, y = 31493, z = 8},
		bossName = "Unaz The Mean",
		bossPos = {x = 33575, y = 31494, z = 8}
	},
	-- Irgix The Flimpsy entrance
	[30807] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.IrgixTheFlimsyTimer,
		newPos = {x = 33467, y = 31397, z = 8},
		bossName = "Irgix The Flimsy",
		bossPos = {x = 33467, y = 31403, z = 8}
	},
	-- Vok The Freakish entrance
	[30808] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.VokTheFreakishTimer,
		newPos = {x = 33562, y = 31493, z = 8},
		bossName = "Vok The Freakish",
		bossPos = {x = 33575, y = 31494, z = 8}
	},
	-- Yirkas Blue Scales entrance
	[30809] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.YirkasBlueScalesTimer,
		newPos = {x = 33154, y = 32247, z = 12},
		bossName = "Yirkas Blue Scales",
		bossPos = {x = 33160, y = 32253, z = 12}
	},
	-- Katex Blood Tongue entrance
	[30810] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.SrezzYellowEyesTimer,
		newPos = {x = 33119, y = 32279, z = 12},
		bossName = "Srezz Yellow Eyes",
		bossPos = {x = 33122, y = 32285, z = 12}
	},
	-- Katex Blood Tongue entrance
	[30811] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.UtuaStoneStingTimer,
		newPos = {x = 33087, y = 32240, z = 12},
		bossName = "Utua Stone Sting",
		bossPos = {x = 33087, y = 32246, z = 12}
	},
	-- Katex Blood Tongue entrance
	[30812] = {
		value = 1,
		range = 1,
		timer = Storage.Tibiana.KatexBloodTongueTimer,
		newPos = {x = 33148, y = 32284, z = 12},
		bossName = "Katex Blood Tongue",
		bossPos = {x = 33152, y = 32286, z = 12}
	}
}

local BossesTeleport = MoveEvent()
function BossesTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if roomIsOccupied(setting.bossPos, setting.range, setting.range) then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("Someone is fighting against the boss! You need wait a while.", TALKTYPE_MONSTER_SAY)
		return true
	end

	if player:getStorageValue(setting.timer) >= os.time() then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You have to wait to challenge this enemy again!", TALKTYPE_MONSTER_SAY)
		return true
	end

	if player:getStorageValue(setting.storage) >= setting.value then
		local monster = Game.createMonster(setting.bossName, setting.bossPos, true, true)
		if not monster then
			return true
		end

		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(setting.newPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You have ten minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.", TALKTYPE_MONSTER_SAY)
		player:setStorageValue(setting.timer, os.time() + 2 * 3600)
		addEvent(clearBossRoom, 60 * 30 * 1000, player.uid, monster.uid, setting.bossPos, setting.range, fromPosition)
		return true
	end
	return true
end

for index, value in pairs(UniqueTable) do
	BossesTeleport:uid(index)
end

BossesTeleport:register()
