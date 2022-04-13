local config = {
    topCount = 1,
    messageType = MESSAGE_EVENT_ADVANCE,
    interval = 20 * 60 * 1000 -- 15 minutes for each
}

local globalTip = GlobalEvent("globalTip")
local message = {
    "We have automatic donations in paypal.",
    "To see full list of available commands type !commands.",
    "Please report bugs in the Discord - https://discord.gg/5SxFynCzyF",
    "Follow us on www.facebook.com/lunacoresmx",
    "All bugs are reported by discord, Staff does not respond to private messages.",
    }

local i = 0
function globalTip.onThink(interval, lastExecution)
local message = message[(i % #message) + 1]
    addEvent(Game.broadcastMessage, 150, 'Info: ' .. message .. '', MESSAGE_EVENT_ADVANCE)
    i = i + 1
    return true
end
globalTip:interval(config.interval)
globalTip:register()
