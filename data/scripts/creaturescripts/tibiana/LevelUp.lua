local levelUp = CreatureEvent("levelUp")

local table = {
  
        -- [1,5] = ID DA VOCACAO
        -- [LEVEL] = {items = {{itemid = ID_ITEM, count = QUANTIDADE}}, storage = VOCE_ESCOLHE, msg = "MENSAGEM QUE APARECERA PARA O PLAYER"},

   [{1, 5, 9}] = {
     [18] = {items = {{itemid = 2191, count = 1}}, storage = 40100, msg = "You gain a wand!"},
     [19] = {items = {{itemid = 2188, count = 1}}, storage = 40101, msg = "You gain a wand!"},
[20] = {items = {{itemid = 2160, count = 3}}, storage = 40171, msg = "You win 3 crystal coins por alcancar o level 20!"},      
     [22] = {items = {{itemid = 8921, count = 1}}, storage = 40102, msg = "You gain a wand!"},
     [26] = {items = {{itemid = 2189, count = 1}}, storage = 40103, msg = "You gain a wand!"},
     [33] = {items = {{itemid = 2187, count = 1}}, storage = 40104, msg = "You gain a wand!"},
     [37] = {items = {{itemid = 8920, count = 1}}, storage = 40105, msg = "You gain a wand!"},
     [42] = {items = {{itemid = 8922, count = 1}}, storage = 40106, msg = "You gain a wand!"},
[50] = {items = {{itemid = 2160, count = 5}}, storage = 40172, msg = "You win 5 crystal coins por alcancar o level 50!"},
[130] = {items = {{itemid = 2160, count = 10}}, storage = 40173, msg = "You win 10 crystal coins por alcancar o level 130!"},
--[200] = {items = {{itemid = 25380, count = 1}}, storage = 82192, msg = "You win 1 Destruction Token por alcancar o level 200!"}     
      
   },
   [{2, 6, 10}] = {
     [13] = {items = {{itemid = 2186, count = 1}}, storage = 40201, msg = "You gain a rod!"},
     [19] = {items = {{itemid = 2185, count = 1}}, storage = 40202, msg = "You gain a rod!"},
[35] = {items = {{itemid = 2160, count = 3}}, storage = 40171, msg = "You win 3 crystal coins por alcancar o level 20!"},      
[22] = {items = {{itemid = 8911, count = 1}}, storage = 40203, msg = "You gain a rod!"},
     [26] = {items = {{itemid = 2181, count = 1}}, storage = 40204, msg = "You gain a rod!"},
     [33] = {items = {{itemid = 2183, count = 1}}, storage = 40205, msg = "You gain a rod!"},
     [37] = {items = {{itemid = 8912, count = 1}}, storage = 40206, msg = "You gain a rod!"},
     [42] = {items = {{itemid = 8910, count = 1}}, storage = 40207, msg = "You gain a rod!"},
[50] = {items = {{itemid = 2160, count = 5}}, storage = 40172, msg = "You win 5 crystal coins por alcancar o level 50!"},
[130] = {items = {{itemid = 2160, count = 10}}, storage = 40173, msg = "You win 10 crystal coins por alcancar o level 130!"},    
--[200] = {items = {{itemid = 25380, count = 1}}, storage = 82192, msg = "You win 1 Destruction Token por alcancar o level 200!"}     

   },
   [{3, 7, 11}] = {
     [20] = {items = {{itemid = 2389, count = 5}}, storage = 40301, msg = "you gain a spear!"},
     [30] = {items = {{itemid = 7378, count = 10}}, storage = 40304, msg = "you gain a royal spear!"},
[35] = {items = {{itemid = 2160, count = 3}}, storage = 40171, msg = "You win 3 crystal coins por alcancar o level 20!"},
[50] = {items = {{itemid = 2160, count = 5}}, storage = 40172, msg = "You win 5 crystal coins por alcancar o level 50!"},
[80] = {items = {{itemid = 7368, count = 100}}, storage = 40175, msg = "You win 100 assassin stars por alcancar o level 80!"},
[130] = {items = {{itemid = 2160, count = 10}}, storage = 40173, msg = "You win 10 crystal coins por alcancar o level 130!"},   
--[200] = {items = {{itemid = 25380, count = 1}}, storage = 82192, msg = "You win 1 Destruction Token por alcancar o level 200!"}     
     
   },
   [{4, 8, 12}] = {

     [20] = {items = {{itemid = 2409, count = 1}}, storage = 40401, msg = "you gain a snake sword!"},
     [30] = {items = {{itemid = 2392, count = 1}}, storage = 40402, msg = "you gain a fire sword!"},
 [35] = {items = {{itemid = 2160, count = 3}}, storage = 40171, msg = "You win 3 crystal coins por alcancar o level 20!"},
[50] = {items = {{itemid = 2160, count = 5}}, storage = 40172, msg = "You win 5 crystal coins por alcancar o level 50!"},
[130] = {items = {{itemid = 2160, count = 10}}, storage = 40173, msg = "You win 10 crystal coins por alcancar o level 130!"}, 
--[200] = {items = {{itemid = 25380, count = 1}}, storage = 82192, msg = "You win 1 Destruction Token por alcancar o level 200!"}     
   }
}


function levelUp.onAdvance(player, skill, oldLevel, newLevel)


    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        
        return true
    
    end

        for voc, x in pairs(table) do
            if isInArray(voc, player:getVocation():getId()) then
            	for level, z in pairs(x) do
            		if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
                		for v = 1, #z.items do
                			local ret = ", "
                			if v == 1 then
                			ret = ""
                		
                                        end
				        player:addItem(z.items[v].itemid, z.items[v].count)
            				player:sendTextMessage(MESSAGE_INFO_DESCR, z.msg)
            				player:setStorageValue(z.storage, 1)
                		end
                        end
                end
      
   			player:save()

   			return true
   
            end
         end
end

levelUp:register()