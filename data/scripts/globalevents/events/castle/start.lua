local config = {
    semana_mes = "semana",
    days = {1, 2, 3, 4, 5, 6, 7},
}

local function warnEvent(i, minutes)
    Game.broadcastMessage("[Castle]\nThe event will begin in ".. minutes .. " minutes! The teleport is located at event room.")
    if i > 1 then
        addEvent(warnEvent, 2 * 60 * 1000, i - 1, minutes - 2)
    end
end

local function openCastle()
    Castle:Open()
end

local function closeCastle()
    Castle:Close()
end

local startCastle = GlobalEvent("startCastle")
function startCastle.onTime(interval)
local time = os.date("*t")
    if (config.semana_mes == "semana" and isInArray(config.days,time.wday)) or (config.semana_mes == "mes" and isInArray(config.days,time.day)) or config.semana_mes == "" then
        Game.broadcastMessage("[Castle]\nThe event will begin in 10 minutes! The teleport is located at event room.")
        addEvent(warnEvent, 2 * 60 * 1000, 4, 8) 
        addEvent(openCastle, 10 * 60 * 1000)
        addEvent(closeCastle, (10 + 10) * 60 * 1000)
    end
    return true
end
startCastle:time("05:48:00")
startCastle:register()