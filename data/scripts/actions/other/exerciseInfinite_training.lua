local skills = {
    [40120] = {id=SKILL_SWORD,voc=4,range=CONST_ANI_WHIRLWINDSWORD}, -- KNIGHT
    [40121] = {id=SKILL_AXE,voc=4,range=CONST_ANI_WHIRLWINDAXE}, -- KNIGHT
    [40122] = {id=SKILL_CLUB,voc=4,range=CONST_ANI_WHIRLWINDCLUB}, -- KNIGHT
    [40123] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [40124] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [40125] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE} -- SORCERER
}

local houseDummies = {32143, 32144, 32145, 32146, 32147, 32148}
local freeDummies = {32142, 32149}
local skillRateDefault = configManager.getNumber(configKeys.RATE_SKILL)
local magicRateDefault = configManager.getNumber(configKeys.RATE_MAGIC)

local function removeExerciseWeapon(player, exercise)
    exercise:remove(1)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training weapon vanished.")
    stopEvent(training)
    player:setStorageValue(Storage.isTraining,0)
    player:setTraining(false)
end

local function startTraining(playerId, startPosition, itemid, tilePosition, bonusDummy, dummyId)
    local player = Player(playerId)
    if player ~= nil then
        if Tile(tilePosition):getItemById(dummyId) then
            local playerPosition = player:getPosition()
            if startPosition:getDistance(playerPosition) == 0 and getTilePzInfo(playerPosition) then
                if player:getItemCount(itemid) >= 1 then
                    local exercise = player:getItemById(itemid,true)
                    if exercise:isItem() then
                        if exercise:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
                            local charges_n = exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES)
                            if charges_n >= 1 then
                                exercise:setAttribute(ITEM_ATTRIBUTE_CHARGES,(charges_n+1))

                                local voc = player:getVocation()

                                if skills[itemid].id == SKILL_MAGLEVEL then
                                    local magicRate = getRateFromTable(magicLevelStages, player:getBaseMagicLevel(), magicRateDefault)
                                    if not bonusDummy then
                                        player:addManaSpent(math.ceil(500*magicRate))
                                    else
                                        player:addManaSpent(math.ceil(500*magicRate)*1.3) -- 10%
                                    end
                                else
                                    local skillRate = getRateFromTable(skillsStages, player:getSkillLevel(skills[itemid].id), skillRateDefault)
                                    if not bonusDummy then
                                        player:addSkillTries(skills[itemid].id, 7*skillRate)
                                    else
                                        player:addSkillTries(skills[itemid].id, (7*skillRate)*1.3) -- 10%
					player:addSkillTries(SKILL_SHIELD, 7*skillRate)
                                    end
                                end
                                    tilePosition:sendMagicEffect(CONST_ME_HITAREA)
                                if skills[itemid].range then
                                    playerPosition:sendDistanceEffect(tilePosition, skills[itemid].range)
                                end
                                if exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES) == 0 then
                                    removeExerciseWeapon(player, exercise)
                                else
                                    local training = addEvent(startTraining, voc:getAttackSpeed(), playerId,startPosition,itemid,tilePosition,bonusDummy,dummyId)
                                    player:setStorageValue(Storage.isTraining,1)
                                    player:setTraining(true)
                                end
                            else
                                removeExerciseWeapon(player, exercise)
                            end
                        end
                    end
                end
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training has stopped.")
                stopEvent(training)
                player:setStorageValue(Storage.isTraining,0)
                player:setTraining(false)
            end
        else
            stopEvent(training)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training has stopped.")
            player:setStorageValue(Storage.isTraining, 0)
            player:setTraining(false)
        end
    else
        stopEvent(training)
        if player then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training has stopped.")
            player:setStorageValue(Storage.isTraining,0)
            player:setTraining(false)
        end
    end
    return true
end

local InfiniteexerciseTraining = Action()

function InfiniteexerciseTraining.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local startPos = player:getPosition()
    if player:getStorageValue(Storage.isTraining) == 1 then
        player:sendTextMessage(MESSAGE_FAILURE, "You are already training.")
        return false
    end
    if target:isItem() then
        if isInArray(houseDummies,target:getId()) then
            if not skills[item.itemid].range and (startPos:getDistance(target:getPosition()) > 1) then
                player:sendTextMessage(MESSAGE_FAILURE, "Get closer to the dummy.")
                stopEvent(training)
                return true
            end
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You started training.")
            startTraining(player:getId(),startPos,item.itemid,target:getPosition(), true, target:getId())
        elseif isInArray(freeDummies, target:getId()) then
            if not skills[item.itemid].range and (startPos:getDistance(target:getPosition()) > 1) then
                player:sendTextMessage(MESSAGE_FAILURE, "Get closer to the dummy.")
                stopEvent(training)
                return true
            end
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You started training.")
            startTraining(player:getId(),startPos,item.itemid,target:getPosition(), false, target:getId())
        end
    end
    return true
end

for id = 40120, 40122 do
    InfiniteexerciseTraining:id(id)
end

for id = 40123, 40125 do
    InfiniteexerciseTraining:id(id)
    InfiniteexerciseTraining:allowFarUse(true)
end

InfiniteexerciseTraining:register()
