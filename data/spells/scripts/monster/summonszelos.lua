local config = {
centerpos = Position(33443, 31544, 13),
rangeX = 13,
rangeY = 13,
}
local spawns = {
[1] = {"Risen Soldier", {Position(33447, 31545, 13), Position(33439, 31545, 13)}},
}
local function createSummon(spawnpos, number, name)
if number == 4 then
Game.createMonster(name, spawnpos, false, true)
else
spawnpos:sendMagicEffect(CONST_ME_TELEPORT)
addEvent(createSummon, 1000, spawnpos, number + 1, name)
end
end
function onCastSpell(creature, var)
 local spawn = spawns[math.random(1, #spawns)]
 local spectators = Game.getSpectators(config.centerpos, false, false, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
 if #spectators > 0 then
 local total = 0
 for i=1, #spectators do
 if spectators[i]:isMonster() and spectators[i]:getName() == spawn[1] then
 total = total + 1
 end
 end
 if total < 4 then
	createSummon(spawn[2][math.random(1, #spawn[2])], 1, spawn[1])
end
 end
 return true
end
