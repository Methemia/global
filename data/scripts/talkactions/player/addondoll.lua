local addon = TalkAction("!addon")
local femaleOutfits = {
    ["citizen"] = {136},
    ["hunter"] = {137},
    ["druid"] = {148},
    ["wizard"] = {149},
    ["oriental"] = {150},
    ["pirate"] = {155},
    ["beggar"] = {157},
    ["shaman"] = {158},
    ["nightmare"] = {269},
    ["jester"] = {270},
    ["brotherhood"] = {279},
    ["demonhunter"] = {288},
    ["yalaharian"] = {324},
    ["wife"] = {329},
    ["warmaster"] = {336},
    ["wayfarer"] = {366},
    ["afflicted"] = {431},
    ["elementalist"] = {433},
    ["deepling"] = {464},
    ["insectoid"] = {466},
    ["crystal warlord"] = {513},
    ["soil guardian"] = {514},
    ["demon"] = {542},
    ["cave explorer"] = {575},
    ["glooth engineer"] = {618},
    ["jersey"] = {620},
    ["recruiter"] = {745},
    ["sea dog"] = {749},
    ["winter warden"] = {852},
    ["philosopher"] = {874}
}

local maleOutfits = {
    ["citizen"] = {128},
    ["hunter"] = {129},
    ["druid"] = {144},
    ["wizard"] = {145},
    ["oriental"] = {146},
    ["pirate"] = {151},
    ["beggar"] = {153},
    ["shaman"] = {154},
    ["nightmare"] = {268},
    ["jester"] = {273},
    ["brotherhood"] = {278},
    ["demonhunter"] = {289},
    ["yalaharian"] = {325},
    ["husband"] = {328},
    ["warmaster"] = {335},
    ["wayfarer"] = {367},
    ["afflicted"] = {430},
    ["elementalist"] = {432},
    ["deepling"] = {463},
    ["insectoid"] = {465},
    ["crystal warlord"] = {512},
    ["soil guardian"] = {516},
    ["demon"] = {541},
    ["cave explorer"] = {574},
    ["glooth engineer"] = {610},
    ["jersey"] = {619},
    ["recruiter"] = {746},
    ["sea dog"] = {750},
    ["winter warden"] = {853},
    ["philosopher"] = {873}
}

local addondoll_id = 248074

function addon.onSay(cid, words, param)
    local player, param = Player(cid), string.lower(param)
    if player:getItemCount(addondoll_id) > 0 then
        if param ~= "" and maleOutfits[param] and femaleOutfits[param] then
            local outfit = player:getSex() == 0 and femaleOutfits[param][1] or maleOutfits[param][1]
            if not player:hasOutfit(outfit, 3) then
                player:removeItem(addondoll_id, 1)
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Usted ha recibido "..param.." Outfit!")
                Position(getThingPos(cid)):sendMagicEffect(CONST_ME_GIFT_WRAPS)
                player:addOutfitAddon(outfit, 3)
            else
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Usted ya tiene ese addon.")
            end
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Por favor revise que el nombre sea correcto!")
        end
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "usted no tiene addon doll!")
    end
    return false
end
addon:separator(" ")
addon:register()