local autosave = GlobalEvent("autosave")
local cleanMapAtSave = true

local function serverSave()
    if cleanMapAtSave then
        --cleanMap()
	Spdlog.info("Saving Hirelings")
	SaveHirelings()
	Game.broadcastMessage('Server Saved, next save in 1 hour.', MESSAGE_STATUS_WARNING)
    end

    saveServer()
end

function autosave.onThink(interval)
    Game.broadcastMessage('Server Save within 30 seconds, may cause a little freeze, do not worry.', MESSAGE_STATUS_WARNING)
    addEvent(serverSave, 60000)
    return true
end
autosave:interval(3600000)
autosave:register()
