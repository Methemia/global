local configRoom = {
    centerRoom = Position(16823, 17189, 6),
    raidTime = "03:00:00", -- 0:00:00 to 23:59:59
    fromPos = Position(16798, 17162, 6),
    toPos = Position(16846, 17203, 5),
   --interval = 60 * 60 * 1000, -- 15 minutes for each
    rangeX = 20,
    rangeY = 20
}

local configBosses = {
    [1] = {
        bossName = "The Many",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },

    [2] = {
        bossName = "Orshabaal",
        summon = {
            name = "Demon",
            amount = 30
        },
    },
    [3] = {
        bossName = "Alptramun",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [4] = {
        bossName = "Apprentice Sheng",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [5] = {
        bossName = "Big Boss Trolliver",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [6] = {
        bossName = "Black Vixen",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [7] = {
        bossName = "Bloodback",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [8] = {
        bossName = "Boogey",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [9] = {
        bossName = "Boreth",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [10] = {
        bossName = "Brain Head",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [11] = {
        bossName = "Bretzecutioner",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [12] = {
        bossName = "Brokul",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [13] = {
        bossName = "Bullwark",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [14] = {
        bossName = "Brutus Bloodbeard",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [15] = {
        bossName = "Captain Jones",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [16] = {
        bossName = "Cave Spider",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [17] = {
        bossName = "Chizzoron the Distorter",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [18] = {
        bossName = "Count Vlarkorth",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [19] = {
        bossName = "Custodian",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [20] = {
        bossName = "Darkfang",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [21] = {
        bossName = "Death Priest Shargon",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [22] = {
        bossName = "Deathbine",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [23] = {
        bossName = "Deathstrike",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [24] = {
        bossName = "Demodras",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [25] = {
        bossName = "Dharalion",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [26] = {
        bossName = "Diblis the Fair",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [27] = {
        bossName = "Dirtbeard",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [28] = {
        bossName = "Diseased Bill",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [29] = {
        bossName = "Diseased Dan",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [30] = {
        bossName = "Diseased Fred",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [31] = {
        bossName = "Doctor Perhaps",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [32] = {
        bossName = "Dracola",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [33] = {
        bossName = "Dreadmaw",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [34] = {
        bossName = "Duke Krule",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [35] = {
        bossName = "Earl Osam",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [36] = {
        bossName = "Ekatrix",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [37] = {
        bossName = "Eradicator",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [38] = {
        bossName = "Essence of Malice",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [39] = {
        bossName = "Ethershreck",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [40] = {
        bossName = "Faceless Bane",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [41] = {
        bossName = "Feroxa4",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [42] = {
        bossName = "Ferumbras",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [43] = {
        bossName = "Morgaroth",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [44] = {
        bossName = "Fleshcrawler",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [45] = {
        bossName = "Furyosa",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [46] = {
        bossName = "Gaz'haragoth",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [47] = {
        bossName = "General Murius",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [48] = {
        bossName = "Ghazbaran",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [49] = {
        bossName = "Ghulosh",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [50] = {
        bossName = "Gnomevil",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [51] = {
        bossName = "Glooth Fairy",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [52] = {
        bossName = "Gorzindel",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [53] = {
        bossName = "Grand Canon Dominus",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [54] = {
        bossName = "Grand Chaplain Gaunder",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [55] = {
        bossName = "Grand Commander Soeren",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [56] = {
        bossName = "Groam",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [57] = {
        bossName = "Hellgorak",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [58] = {
        bossName = "Hide",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [59] = {
        bossName = "Horestis",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [60] = {
        bossName = "Irgix the Flimsy",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [61] = {
        bossName = "Izcandar Champion of Summer",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [62] = {
        bossName = "Izcandar Champion of Winter",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [63] = {
        bossName = "Izcandar the Banished",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [64] = {
        bossName = "Jaul",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [65] = {
        bossName = "Tanjis",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [66] = {
        bossName = "Obujos",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [67] = {
        bossName = "Grand Canon Dominus",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [68] = {
        bossName = "Katex Blood Tongue",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [69] = {
        bossName = "King Zelos",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [70] = {
        bossName = "Grand Canon Dominus",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [71] = {
        bossName = "Lord Azaram",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [72] = {
        bossName = "Man in the Cave",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [73] = {
        bossName = "Mawhawk",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [74] = {
        bossName = "Maxxenius",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [75] = {
        bossName = "Mazoran",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [76] = {
        bossName = "Mazzinor",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [77] = {
        bossName = "Necropharus",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [78] = {
        bossName = "Omrafir",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [79] = {
        bossName = "Ratmiral Blackwhiskers",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [80] = {
        bossName = "Rotworm Queen",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
    [81] = {
        bossName = "Reflection of Obujos",
        summon = {
            name = "Hydra",
            amount = 30  
        },
    },
  
	[82] = {
        bossName = "Annihilon",
        summon = {
            name = "Hydra",
            amount = 30
        },
    },
	[83] = {
        bossName = "Abyssador",
        summon = {
            name = "Hydra",
            amount = 30
        },
    }
}

local function startBossRoom()
    local specs = Game.getSpectators(configRoom.centerRoom, false, false, configRoom.rangeX, configRoom.rangeX, configRoom.rangeY, configRoom.rangeY)
    for _, spec in pairs(specs) do
        if spec:isMonster() then
            spec:remove()
        end
    end

    -- Create Boss:
    local bossIndex = math.random(1, 83)
    local boss = configBosses[bossIndex]
    local bossName = boss.bossName
    Game.createMonster(bossName, configRoom.centerRoom, true, true)
   Game.broadcastMessage("The boss is active " .. bossName.. " was spawned.", MESSAGE_STATUS_WARNING)


    -- Create Summons:
    local summon = boss.summon
    if summon then
        local summonName = boss.summon.name
        local summonAmount = boss.summon.amount
        for i = 1, summonAmount do
            local randomPos = getRandomSpawnPosition(configRoom.fromPos, configRoom.toPos)
            Game.createMonster(summonName, randomPos, true, true)
        end
    end
	    Game.broadcastMessage("The boss room was cleaned and the boss " .. bossName.. " was spawned.", MESSAGE_STATUS_WARNING)
end

local bossRoom = GlobalEvent("Random Boss Room")

function bossRoom.onTime(interval)
    startBossRoom()
    return false
end

--bossRoom:interval(configRoom.raidTime)
bossRoom:interval(18000000000000)
bossRoom:register()

local startBossRoomTalk = TalkAction("/startBoss")

function startBossRoomTalk.onSay(player, words, param)
    if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
        return true
    end

	if player:getItemCount(26144) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the doll.")
		return false
	end

    startBossRoom()
    return false
end

startBossRoomTalk:register()

local startBossRoomItem = Action()
function startBossRoomItem.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		item:remove(1)
		 startBossRoom()
		else
		player:sendCancelMessage("You can't use this when you're in a fight and in protection zone.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end


startBossRoomItem:id(26144) -- id vip scroll
startBossRoomItem:register()