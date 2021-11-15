local config = {
    monsterName = 'Guard Captain Quaid',
    bossPosition = Position(33391, 32661, 3),
    centerPosition = Position(33391, 32661, 3),

    rangeX = 5,
    rangeY = 5
}

local function checkBoss(centerPosition, rangeX, rangeY, bossName)
    local spectators, spec = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
    for i = 1, #spectators do
        spec = spectators[i]
        if spec:isMonster() then
            if spec:getName() == bossName then
                return true
            end
        end
    end
    return false
end

local Quaid = GlobalEvent("Quaid")
function Quaid.onThink(interval, lastExecution)
    if checkBoss(config.centerPosition, config.rangeX, config.rangeY, config.monsterName) then
        return true
    end
    local boss =
    Game.createMonster(config.monsterName, config.bossPosition, true, true)
    boss:setReward(true)
    return true
end
Quaid:interval(960000)
Quaid:register()
