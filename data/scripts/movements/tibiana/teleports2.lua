local setting = {
[47130] = Position(33509, 31451, 9),
[47231] = Position(33482, 31452, 9),
[47232] = Position(33485, 31435, 8),
[47233] = Position(16829, 17198, 6),
[47270] = Position(33749, 32160, 15),
[47273] = Position(33603, 31448, 10),
[47274] = Position(33886, 31785, 8),
[14351] = Position(32271, 31385, 14),
[14353] = Position(32271, 31385, 14),
[14346] = Position(32339, 31289, 14),
[14323] = Position(32339, 31289, 14),
[14324] = Position(32214, 31384, 14),
[14342] = Position(32215, 31378, 14),
[14349] = Position(32202, 31285, 14),
[14354] = Position(32212, 31376, 14),
[14344] = Position(32213, 31380, 14),
[47470] = Position(32179, 31240, 14),
[47471] = Position(32245, 31253, 14),
[47472] = Position(32304, 31247, 14),
[47482] = Position(32528, 32786, 6),
[59312] = Position(33621, 31418, 10),

[48700] = Position(32660, 31830, 10),
[48701] = Position(32630, 31840, 10),
[48702] = Position(32630, 31840, 10),
[48703] = Position(32143, 31447, 14),
[48704] = Position(32675, 31787, 10),
[48705] = Position(32089, 31452, 11),
[48706] = Position(32653, 31817, 10),
[48707] = Position(32044, 31455, 14),
[48709] = Position(32532, 31120, 15),
[48710] = Position(32069, 31488, 14),
[48711] = Position(32535, 31157, 15),
[48716] = Position(32538, 31122, 15),
[48717] = Position(32539, 31159, 15),
[48718] = Position(32059, 31466, 12),
[48719] = Position(32069, 31451, 13),
[48720] = Position(32068, 31468, 14),
[48721] = Position(32663, 31821, 10),
[48722] = Position(32652, 31823, 10),
[48800] = Position(32397, 32496, 10),
[48801] = Position(32442, 32501, 10),

	}

local tibianaTeleport2 = MoveEvent()

function tibianaTeleport2.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local toPosition = setting[item.actionid]
	if not toPosition then
		return true
	end

	player:teleportTo(toPosition)
	toPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)
	return true
end

tibianaTeleport2:type("stepin")

for index, value in pairs(setting) do
	tibianaTeleport2:aid(index)
end

tibianaTeleport2:register()
