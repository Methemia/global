local destinations = {
    -- please use lower case names
    --["place name"] = { position=Position(100, 100, 7), inPz=true, level=100, infight=false }
    ["house"] = { house=true, inPz=true, infight=false }
}

local destString = "Available destinations:"
for name, _ in pairs(destinations) do
    destString = string.format("%s %s%s", destString, name, (next(destinations, name) and ',' or '.'))
end

local talkAction = TalkAction("!tp")

function talkAction.onSay(player, words, param, type)
    local destName = param:trim()
    local destination = destinations[destName] or destinations[destName:lower()]
    if not destination then
        player:sendCancelMessage(string.format("Destination %s does not exists.", destName))
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, destString)
        return false
    end

    local tile
    if destination.house then
        local house = player:getHouse()
        if not house then
            player:sendCancelMessage("You not have a house.")
            return false
        end

        tile = Tile(house:getExitPosition())
    else
        tile = Tile(destination.position)
    end

    if not tile then
        print(string.format("Destination %s dont have a correct position.", destName))
        player:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
        return false
    end

	if player:getItemCount(40343) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the key.")
		return false
	end

    local playerPos = player:getPosition()
    if destination.inPz and not playerPos:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage(string.format("Destination %s require you in PZ.", destName))
        return false
    end

    if destination.level and player:getLevel() < destination.level then
        player:sendCancelMessage(string.format("Destination %s only enabled for players level %d or higher.", destName, destination.level))
        return false
    end

    if not destination.infight and player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
        player:sendCancelMessage(string.format("Destination %s only work witout fight.", destName))
        return false
    end

    local destPos = tile:getPosition()
    playerPos:sendMagicEffect(CONST_ME_POFF)
    player:teleportTo(destPos, false)
    destPos:sendMagicEffect(CONST_ME_TELEPORT)
    player:sendCancelMessage("Teleported successfully!")
    return false
end

talkAction:separator(" ")
talkAction:register()