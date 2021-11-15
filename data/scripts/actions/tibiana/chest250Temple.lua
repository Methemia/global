local config ={
level = 250, -- level to take the chest
storage = 82192, -- storage
alreadydonemsg = "You have already done this quest.", -- What message to say if you already done this quest!
tolowlevelmsg = "You need level 250 to take this chest!", -- What message to say if you are to low level!
donemsg = "You have found a sharp token.", -- What message to say if you take the chest!
qnt = 1, -- How much crystal coins you will get in the chest!
itemid = 25380 -- Item Id of crystal coin.
}

local welcomechest = Action()
function welcomechest.onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, config.storage) == 1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,config.alreadydonemsg)
	elseif getPlayerLevel(cid) >= config.level then
		setPlayerStorageValue(cid, config.storage, 1)
		doPlayerAddItem(cid, config.itemid, config.qnt)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,config.donemsg)
	elseif getPlayerLevel(cid) < config.level then
	        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,config.tolowlevelmsg)
	end
	return TRUE
end
welcomechest:aid(348900)
welcomechest:register()
