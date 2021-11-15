local outfits = {
    {136, 128, "Citizen"},
    {137, 129, "Hunter"},
    {139, 131, "Knight"},
    {140, 132, "Nobleman"},
    {142, 134, "Warrior"},
    {147, 143, "Barbarian"},
    {148, 144, "Druid"},
    {149, 145, "Wizard"},
    {150, 146, "Oriental"},
    {155, 151, "Pirate"},
    {156, 152, "Assassin"},
    {157, 153, "Beggar"},
    {158, 154, "Shaman"},
    {252, 251, "Norsewoman"},
    {269, 268, "Nightmare"},
    {270, 273, "Jester"},
    {279, 278, "Brotherhood"},
    {288, 289, "Demon Hunter"},
    {324, 325, "Yalaharian"},
    {336, 335, "Warmaster"},
    {466, 367, "Wayfarer"},
    {431, 430, "Afflicted"}
}

local randOutfit = CreatureEvent("RandomOutfitForNewPlayers")

function randOutfit.onLogin(player)
    if player:getLastLoginSaved() <= 0 then
        local outfit = outfits[math.random(1, #outfits)]
        local addon = math.random(1, 2)
        player:addOutfitAddon(outfit[1], addon)
        player:addOutfitAddon(outfit[2], addon)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You obtained the %s outfit with addon %d.", outfit[3], addon))
    end
    return true
end

randOutfit:register()