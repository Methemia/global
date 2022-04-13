-- Boss teleport spawn script by mdwilliams.
-- https://otland.net/threads/tfs-1-2-portal-created-on-monster-death.265567/#post-2567024
-- Converted to TFS 1.3 Revscriptsys by Evil Hero.

local teleportToPosition = Position(32111, 31372, 14)
local teleportCreatePosition = Position(32270, 31349, 14)
local bossName = "World Devourer"
local killMessage = "You have killed Boss Monster! A teleport has been created but it will disappear in 5 minutes!"

-- Function that will remove the teleport after a given time
local function removeTeleport(position)
    local teleportItem = Tile(position):getItemById(1387)
    if teleportItem then
        teleportItem:remove()
        position:sendMagicEffect(CONST_ME_POFF)
    end
end

local event = CreatureEvent("BosswKill")

function event.onKill(creature, target)
    if target:isPlayer() or target:getMaster()  or target:getName():lower() ~= bossName:lower() then
        return true
    end

    local position = target:getPosition()
    position:sendMagicEffect(CONST_ME_TELEPORT)
    local item = Game.createItem(1387, 1, teleportCreatePosition)

    if item:isTeleport() then
        item:setDestination(teleportToPosition)
    end

    target:say(killMessage, TALKTYPE_MONSTER_SAY, 0, 0, position)

    -- Remove portal after 5 minutes
    addEvent(removeTeleport, 5 * 60 * 1000, teleportCreatePosition)

    return true
end

event:register()

local login = CreatureEvent("RegisterwBossKill")

function login.onLogin(player)
    player:registerEvent("BosswKill")
    return true
end

login:register()