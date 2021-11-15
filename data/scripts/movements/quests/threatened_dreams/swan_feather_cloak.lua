local exhaust = 20 * 60 * 60 -- 20h
local totalFeathersPerStep = 5
local locations = {
	{{x = 33589, y = 32196, z = 7}, Storage.ThreatenedDreams.SwanFeatherCloak1},
	{{x = 33499, y = 32193, z = 7}, Storage.ThreatenedDreams.SwanFeatherCloak2},
	{{x = 33464, y = 32230, z = 7}, Storage.ThreatenedDreams.SwanFeatherCloak3},
	{{x = 33470, y = 32251, z = 7}, Storage.ThreatenedDreams.SwanFeatherCloak4},
	{{x = 33550, y = 32222, z = 7}, Storage.ThreatenedDreams.SwanFeatherCloak5},
	{{x = 33526, y = 32256, z = 7}, Storage.ThreatenedDreams.SwanFeatherCloak6},
	{{x = 33459, y = 32293, z = 7}, Storage.ThreatenedDreams.SwanFeatherCloak7},
	{{x = 33494, y = 32318, z = 7}, Storage.ThreatenedDreams.SwanFeatherCloak8},
}
local swanFeatherCloak = MoveEvent()

function swanFeatherCloak.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	local actualFeathers = player:getStorageValue(Storage.ThreatenedDreams.TotalSwanFeathers)
	if actualFeathers >= 99 then
		return true
	end
	local config
	for _, data in pairs(locations) do
		if position == Position(data[1]) then
			config = data
			break
		end
	end
	if not config then return true end
	if player:getStorageValue(config[2]) < os.time() then
		player:addItem(29417, totalFeathersPerStep)
		player:setStorageValue(Storage.ThreatenedDreams.TotalSwanFeathers, actualFeathers + totalFeathersPerStep)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found some swan feathers.")
		player:setStorageValue(config[2], os.time() + exhaust)
	end
	return true
end

swanFeatherCloak:aid(38930)
swanFeatherCloak:register()