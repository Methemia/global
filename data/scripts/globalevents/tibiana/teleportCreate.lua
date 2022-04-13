local config = {
    raidTime = "02:50:00", -- 0:00:00 to 23:59:59
    remainTime = 15, -- how long until teleporter disappears (in seconds)
    teleporterPosition = Position(32373, 32236, 7),
    teleportDestination = Position(16829, 17198, 6),
    bossName = "demon",
    bossPosition = Position(16824, 17183, 6)
}

local function removeTeleporter(position)
    Tile(position):getItemById(1387):remove()
end

local global = GlobalEvent("globalEvent_demonRaidTeleporter")

function global.onTime()
    Game.createMonster(config.bossName, config.bossPosition, false, true)
 Game.broadcastMessage("The teleport to colisseum room now is open! - the teleport will close in 15 minutes", MESSAGE_STATUS_WARNING)
    Game.createItem(1387, 1, config.teleporterPosition):setDestination(config.teleportDestination)
    addEvent(removeTeleporter, 60 * 1000 * config.remainTime, config.teleporterPosition)
    return true
end

--global:time(config.raidTime)
--global:interval(1620000)
--global:register()