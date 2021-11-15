local teleportPoints = {
[0] = {x = 32369, y = 32241, z = 7},
[1] = {x = 32339, y = 32242, z = 7},
[2] = {x = 243, y = 188, z = 7},
[3] = {x = 254, y = 180, z = 7},
[4] = {x = 231, y = 160, z = 7},
[5] = {x = 212, y = 158, z = 7},
[6] = {x = 212, y = 170, z = 7},
[7] = {x = 227, y = 171, z = 7},
[8] = {x = 266, y = 149, z = 7},
[9] = {x = 234, y = 140, z = 7},
[10] = {x = 205, y = 143, z = 7},
[11] = {x = 177, y = 126, z = 7},
[12] = {x = 290, y = 177, z = 6},
[13] = {x = 219, y = 185, z = 6},
[14] = {x = 261, y = 167, z = 6},
[15] = {x = 270, y = 167, z = 8}
}
local teleportRandom = MoveEvent()
function teleportRandom.onStepIn(cid, item, position)
	if isPlayer(cid) then
		local position = teleportPoints[math.random(0,1)]
		doTeleportThing(cid, position)
		
	end
	return true
end
teleportRandom:aid(26938)
teleportRandom:register()