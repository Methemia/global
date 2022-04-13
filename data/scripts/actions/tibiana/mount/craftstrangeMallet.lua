local craftstangeMallet = Action()
 
local craft = {
    level = 0, -- nivel necessario
    items = { -- itens necessários para que os players entrem.
        [1] = {item = 30760, count = 1}, -- spectral horseshoe
		[2] = {item = 30761, count = 1}, -- spectral saddle
		[3] = {item = 30759, count = 1}, -- spectral horse tack
    },
    craftedItem = {30758, 1}, -- item craftado, quantidade
}
 
function craftstangeMallet.onUse(player, item, fromPosition, itemEx, toPosition)
 
    if player:getLevel() < craft.level then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You do not have level 1.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end
 
    for k, v in pairs(craft.items) do
        if player:getItemCount(v.item) < v.count then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You do not have necessary items, items necessary .")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end
 
    for k, v in pairs(craft.items) do
        player:removeItem(v.item, v.count)
    end
 
    player:addItem(craft.craftedItem[1], craft.craftedItem[2])
    player:removeItem(item.itemid, 1)
    player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You have Crafted: "..craft.craftedItem[2].."x "..ItemType(craft.craftedItem[1]):getName()..".")
    player:getPosition():sendMagicEffect(50)
 
    return true
end
 
craftstangeMallet:id(30760)
craftstangeMallet:register()