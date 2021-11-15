local SkullPlayer = CreatureEvent("SkullPlayer")

function SkullPlayer.onDeath(player, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    if not killer:isPlayer() then
        return true
    end
    local heart = corpse:addItem(2229, 1)
    heart:setAttribute(ITEM_ATTRIBUTE_NAME, ''..player:getName().."'s Skull")
    heart:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ''..killer:getName()..' ['..killer:getLevel()..'] has killed '..player:getName()..' ['..player:getLevel()..']')
    return true
end
SkullPlayer:register()