local raids = {
	-- Weekly
	--Terça-Feira
	['Tuesday'] = {
		['10:00'] = {raidName = 'Tanjis'}
	},

	--Quarta-Feira
	['Wednesday'] = {
		['11:00'] = {raidName = 'Obujos'}
	},

	--Quinta-Feira
	['Thursday'] = {
		['12:00'] = {raidName = 'Tanjis'}
	},

	--Sexta-feira
	['Friday'] = {
		['13:00'] = {raidName = 'Obujos'}
	},

	--Sábado
	['Saturday'] = {
		['14:00'] = {raidName = 'Jaul'}
	},

	--Domingo
	['Sunday'] = {
		['15:00'] = {raidName = 'Jaul'}
	}
}

local spawnRaidsDep = GlobalEvent("spawn raids dep")
function spawnRaidsDep.onThink(interval, lastExecution, thinkInterval)
	local day, date = os.date('%A'), getRealDate()

	local raidDays = {}
	if raids[day] then
		raidDays[#raidDays + 1] = raids[day]
	end
	if raids[date] then
		raidDays[#raidDays + 1] = raids[date]
	end
	if #raidDays == 0 then
		return true
	end

	for i = 1, #raidDays do
		local settings = raidDays[i][getRealTime()]
		if settings and not settings.alreadyExecuted then
			Game.startRaid(settings.raidName)
			settings.alreadyExecuted = true
		end
	end
	return true
end

spawnRaidsDep:interval(60000)
spawnRaidsDep:register()
