
local config = {
	[1] = {
		mapName = "Alptramun",
		displayName = "Alptramun"
	},
	[2] = {
		mapName = "Izcandar",
		displayName = "Izcandar"
	},
	[3] = {
		mapName = "Malofur",
		displayName = "Malofur"
	},
	[4] = {
		mapName = "Maxxenius",
		displayName = "Maxxenius"
	},
	[5] = {
		mapName = "Plagueroot",
		displayName = "Plagueroot"
	}
}

local dreamCourts = GlobalEvent("DreamMap")
function dreamCourts.onStartup(interval)
	local select = config[math.random(#config)]
	Game.loadMap('data/world/dream_courts/' .. select.mapName .. '.otbm')
	print('>> Today Dream Courts Boss is '.. select.displayName ..'.')
	
	setGlobalStorageValue(GlobalStorage.Tibiana.DreamMap, 1)
		
	return true
end
dreamCourts:register()
