local talk = TalkAction("!show")

function talk.onSay(player, words, param)
  
local config = {
    ['criticalchance'] = { text = "Your critical chance : "..player:getSpecialSkill(SPECIALSKILL_CRITICALHITCHANCE)..""},
    ['criticalamount'] = { text = "Your critical amount : "..player:getSpecialSkill(SPECIALSKILL_CRITICALHITAMOUNT)..""},
    ['lifeleechchance'] = { text = "Your life leech chance : "..player:getSpecialSkill(SPECIALSKILL_LIFELEECHCHANCE)..""},
    ['lifeleechamount'] = { text = "Your life leech amount : "..player:getSpecialSkill(SPECIALSKILL_LIFELEECHAMOUNT)..""},
    ['manaleechchance'] = { text = "Your mana leech chance : "..player:getSpecialSkill(SPECIALSKILL_MANALEECHCHANCE)..""},
    ['manaleechamount'] = { text = "Your mana leech amount : "..player:getSpecialSkill(SPECIALSKILL_MANALEECHAMOUNT.."")}
}
  
    local p = config[param:lower()]
    if not p then
        player:sendCancelMessage("Does not exists")
        return false
    end
    player:sendTextMessage(MESSAGE_INFO_DESCR, p.text)
    return false
end

talk:separator(" ")
talk:register()