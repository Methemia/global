local config = {
    [1] = {event = "Castle", map = "castle"},
}

local loadEventMaps = GlobalEvent("CastleMap")
function loadEventMaps.onStartup()
    
    for i = 1, #config do
        Game.loadMap('data/world/worldchanges/additionals/' .. config[i].map ..'.otbm')
        print('>> ['..config[i].event..'] Map ' .. config[i].map .. ' loaded.')
    end
    return true
end
loadEventMaps:register()
