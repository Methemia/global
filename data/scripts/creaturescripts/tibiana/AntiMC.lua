
local AccPorIp = 5

local antiMcScript = CreatureEvent("antiMcScript")
function antiMcScript.onLogin(player)

    local mc = 0
    for _, verificar in ipairs(Game.getPlayers()) do
        if player:getIp() == verificar:getIp() then
            mc = mc + 1
            if mc > AccPorIp then return false end
        end
    end
 
    return true
end
antiMcScript:register()