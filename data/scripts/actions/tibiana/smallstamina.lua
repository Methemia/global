local smallstaminarefill = Action()
function smallstaminarefill.onUse(player, item, ...)
    local stamina = player:getStamina()
    if stamina >= 2520 then
        player:sendCancelMessage("You have a full stamina.")
        return true
    end
    player:setStamina(math.min(2520, stamina + 360))
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:sendCancelMessage("You have regenerate 6 hours of stamina.")
    item:remove(1)
    return true
end

smallstaminarefill:id(41563)
smallstaminarefill:register()