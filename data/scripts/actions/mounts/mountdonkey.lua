local ACTION_RUN, ACTION_BREAK, ACTION_NONE, ACTION_ALL = 1, 2, 3, 4
local TYPE_MONSTER, TYPE_NPC, TYPE_ITEM, TYPE_ACTION, TYPE_UNIQUE = 1, 2, 3, 4, 5

local config = {
[13537]	= {NAME = 'Donkey', ID = 13, BREAK = true, TYPE = TYPE_MONSTER, CHANCE = 40, FAIL_MSG = { {1, 'The donkey transformation suddenly wears off.'}, {2,  'Heeee-haaa-haaa-haaw!'}, {3, 'You did not manage to feed the donkey enough apple slices.'} }, SUCCESS_MSG = 'Heeee-haaaaw!', ACHIEV = "Loyal Lad"}
}

local function doFailAction(cid, mount, pos, item, itemEx, loseItem)
	local action, effect = mount.FAIL_MSG[math.random(#mount.FAIL_MSG)], CONST_ME_POFF
	if(action[1] == ACTION_RUN) then
		Creature(itemEx.uid):remove()
	elseif(action[1] == ACTION_BREAK) then
		effect = CONST_ME_BLOCKHIT
		if loseItem then
		Item(item.uid):remove(1)
		end
	elseif(action[1] == ACTION_ALL) then
		Creature(itemEx.uid):remove()
		if loseItem then
		Item(item.uid):remove(1)
		end
	end
	
	pos:sendMagicEffect(effect)
	Player(cid):say(action[2], TALKTYPE_MONSTER_SAY)
	return action
end

local donkeyMount = Action()

function donkeyMount.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetMonster = Monster(itemEx.uid)
	local targetNpc = Npc(itemEx.uid)
	local targetItem = Item(itemEx.uid)
	local mount = config[item.itemid]
	if mount == nil or player:hasMount(mount.ID) then
		return false
	end

	local rand = math.random(100)
	--Monster Mount
	if targetMonster ~= nil and mount.TYPE == TYPE_MONSTER then
		if Creature(itemEx.uid):getMaster() then
			player:say('You can\'t tame a summon!', TALKTYPE_MONSTER_SAY)
			return true
		end

		if mount.NAME == targetMonster:getName() then
			if rand > mount.CHANCE then
				doFailAction(cid, mount, toPosition, item, itemEx, mount.BREAK)
				return true
			end
			if mount.ACHIEV then
			player:addAchievement(mount.ACHIEV)
			end
			player:addAchievement("Natural Born Cowboy")
			player:addMount(mount.ID)
			player:say(mount.SUCCESS_MSG, TALKTYPE_MONSTER_SAY)
			targetMonster:remove()
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			Item(item.uid):remove(1)
			return true
		end
	--NPC Mount
	elseif targetNpc ~= nil and mount.TYPE == TYPE_NPC then
		if mount.NAME == targetNpc:getName() then
			if rand > mount.CHANCE then
				doFailAction(cid, mount, toPosition, item, itemEx, mount.BREAK)
				return true
			end
			if mount.ACHIEV then
			player:addAchievement(mount.ACHIEV)			
			end
			player:addAchievement("Natural Born Cowboy")
			player:addMount(mount.ID)
			player:say(mount.SUCCESS_MSG, TALKTYPE_MONSTER_SAY)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			Item(item.uid):remove(1)
			return true
		end
	--Item Mount
	elseif targetItem ~= nil and mount.TYPE == TYPE_ITEM then
		if mount.NAME == targetItem:getName() then
			if rand > mount.CHANCE then
				doFailAction(cid, mount, toPosition, item, itemEx, mount.BREAK)
				return true
			end
			if mount.ACHIEV then
			player:addAchievement(mount.ACHIEV)			
			end
			player:addAchievement("Natural Born Cowboy")
			player:addMount(mount.ID)
			player:say(mount.SUCCESS_MSG, TALKTYPE_MONSTER_SAY)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			Item(item.uid):remove(1)
			return true
		end
	--Action Mount
	elseif itemEx.actionid > 0 and mount.TYPE == TYPE_ACTION then
		if(mount.NAME == itemEx.actionid) then
			if rand > mount.CHANCE then
				doFailAction(cid, mount, toPosition, item, itemEx, mount.BREAK)
				return true
			end
			if mount.ACHIEV then
			player:addAchievement(mount.ACHIEV)			
			end
			player:addAchievement("Natural Born Cowboy")
			player:addMount(mount.ID)
			player:say(mount.SUCCESS_MSG, TALKTYPE_MONSTER_SAY)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			Item(item.uid):remove(1)
			return true
		end
	--Unique Mount
	elseif itemEx.uid <= 65535 and mount.TYPE == TYPE_UNIQUE then
		if mount.NAME == itemEx.uid then
			if rand > mount.CHANCE then
				doFailAction(cid, mount, toPosition, item, itemEx, mount.BREAK)
				return true
			end
			if mount.ACHIEV then
			player:addAchievement(mount.ACHIEV)			
			end
			player:addAchievement("Natural Born Cowboy")
			player:addMount(mount.ID)
			player:say(mount.SUCCESS_MSG, TALKTYPE_MONSTER_SAY)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			Item(item.uid):remove(1)
			return true
		end
	end
	return false
end

donkeyMount:id(13537)
donkeyMount:register()
