local bossDoll = Action()
local bosseye = {
	-- Config
	mainTitle = "Boss Timer",
	mainMsg = "Boss Status",
}
function bossDoll.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendBossWindow(bosseye)
    return true
end
bossDoll:id(18526)
bossDoll:register()