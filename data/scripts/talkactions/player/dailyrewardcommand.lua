local exerciseCharges = 10000
local rewardStorage = 29999

local reward = TalkAction("!reward")

function reward.onSay(player, words, param)
    if player then
        if player:getStorageValue(rewardStorage) >= os.time() then
            player:sendCancelMessage("You already collected your daily reward.")
        else
            player:setStorageValue(rewardStorage, os.time() + 24 * 24 * 60 * 60)
            player:getPosition():sendMagicEffect(CONST_ME_SMOKE)
            if player:isSorcerer() then
                player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32129, exerciseCharges)
            elseif player:isDruid() then
                player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32128, exerciseCharges)
            elseif player:isPaladin() then
                player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32127, exerciseCharges)
            elseif player:isKnight() then
                if player:getSkillLevel(SKILL_SWORD) > player:getSkillLevel(SKILL_CLUB) and
                player:getSkillLevel(SKILL_SWORD) > player:getSkillLevel(SKILL_AXE) then
                    player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32124, exerciseCharges)
                elseif player:getSkillLevel(SKILL_CLUB) > player:getSkillLevel(SKILL_SWORD) and
                    player:getSkillLevel(SKILL_CLUB) > player:getSkillLevel(SKILL_AXE) then
                    player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32126, exerciseCharges)
                elseif player:getSkillLevel(SKILL_AXE) > player:getSkillLevel(SKILL_SWORD) and
                    player:getSkillLevel(SKILL_AXE) > player:getSkillLevel(SKILL_CLUB) then
                    player:getSlotItem(CONST_SLOT_STORE_INBOX):addItem(32125, exerciseCharges)
                end
            end
        end
    end
end

reward:register()