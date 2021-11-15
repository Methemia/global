local setting = {
	[40101] = Position(32870, 32724, 15),
	[40102] = Position(32870, 32724, 14),
	[40083] = Position(33329, 31332, 9),
	[11798] = Position(32332, 32093, 7),

[38002] = Position(32190, 32427, 9),


[48744] = Position(33494, 31545, 13),
[48727] = Position(33455, 31562, 13),
[48728] = Position(33450, 31562, 13),
[48730] = Position(33463, 31554, 13),
[48731] = Position(33463, 31537, 13),
[48732] = Position(33463, 31542, 13),
[48734] = Position(33455, 31529, 13),
[48735] = Position(33431, 31529, 13),
[48736] = Position(33436, 31529, 13),
[48738] = Position(33423, 31537, 13),
[48739] = Position(33423, 31555, 13),
[48740] = Position(33423, 31550, 13),
--libreria
[48750] = Position(32718, 32746, 10),
[48751] = Position(32744, 32746, 10),
[48752] = Position(32718, 32770, 10),
[48753] = Position(32744, 32770, 10),

[48760] = Position(32718, 32746, 10),
[48761] = Position(32744, 32746, 10),
[48762] = Position(32718, 32770, 10),
[48763] = Position(32744, 32770, 10),


[57747] = Position(33446, 31289, 14),
[57746] = Position(33478, 31314, 7),
--scarlett
[48743] = Position(33399, 32664, 6),

[50421] = Position(33463, 31554, 13),
[50422] = Position(33463, 31537, 13),
[50423] = Position(33463, 31542, 13),
[50425] = Position(33455, 31529, 13),
[50427] = Position(33431, 31529, 13),
[50428] = Position(33436, 31529, 13),
[50430] = Position(33423, 31537, 13),
[50431] = Position(33423, 31555, 13),
[50432] = Position(33423, 31550, 13),
[50433] = Position(33436, 31562, 13),
[50435] = Position(33455, 31562, 13),
[50436] = Position(33450, 31562, 13),
[50437] = Position(33489, 31545, 13),
[50438] = Position(33489, 31545, 13),

[50537] = Position(32369, 32241, 7),
[50538] = Position(34010, 31015, 9),
[50539] = Position(34007, 31081, 9),
[50540] = Position(34009, 31077, 9),
[50541] = Position(34012, 31051, 9),

[50407] = Position(33116, 32251, 12),
[50405] = Position(33123, 32264, 12),
[50406] = Position(33130, 32252, 12),
[50404] = Position(33122, 32239, 12),
[50414] = Position(32121, 32708, 7),

[50550] = Position(33442, 32052, 9),
[50551] = Position(33611, 31528, 10),
[50552] = Position(33741, 31541, 14),
[50553] = Position(33775, 31508, 14),
[50554] = Position(33747, 31506, 14),
[50555] = Position(33571, 31451, 10),
[50556] = Position(33558, 31524, 10),
[50557] = Position(33742, 31509, 14),
[50558] = Position(33609, 31499, 10),
[50559] = Position(33737, 31475, 14),
[50560] = Position(33781, 31504, 14),
[50570] = Position(33545, 31860, 7),

[50420] = Position(33463, 31549, 13),
[50421] = Position(33463, 31554, 13),
[50422] = Position(33463, 31537, 13),
[50423] = Position(33463, 31542, 13),
[50424] = Position(33450, 31529, 13),
[50425] = Position(33455, 31529, 13),
[50427] = Position(33431, 31529, 13),
[50428] = Position(33436, 31529, 13),
[50429] = Position(33423, 31542, 13),
[50430] = Position(33423, 31537, 13),
[50431] = Position(33423, 31555, 13),
[50432] = Position(33423, 31550, 13),
[50433] = Position(33436, 31562, 13),
[50434] = Position(33431, 31562, 13),
[50438] = Position(33490, 31545, 13),

[50439] = Position(33534, 31444, 8),
[50440] = Position(33545, 31444, 8),


[40036] = Position(33561, 31392, 13),
[40037] = Position(33584, 31390, 13),
[4601] = Position(33566, 31476, 8),

[59134] = Position(34064, 30992, 11),

[38458] = Position(33855, 31833, 3),
[38459] = Position(33855, 31833, 3),
[38460] = Position(33855, 31833, 3),
[38461] = Position(33855, 31833, 3),
[38462] = Position(33859, 31836, 3),
[38463] = Position(33880, 31872, 4),
[38464] = Position(33836, 31867, 5),
[38465] = Position(33869, 31865, 6)

}

local tibianaTeleport = MoveEvent()

function tibianaTeleport.onStepIn(creature, item, position, fromPosition)
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

tibianaTeleport:type("stepin")

for index, value in pairs(setting) do
	tibianaTeleport:aid(index)
end

tibianaTeleport:register()
