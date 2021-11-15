local guildLevel = CreatureEvent("GuildLevelK")
function guildLevel.onKill(player, creature, target)
	
	if not player:isPlayer() or not creature:isMonster() or creature:hasBeenSummoned() or creature:isPlayer() then
		return true
	end
	
	-- remove event if player wasn't in a guild
	local g = player:getGuild()
	if not g then
		player:unregisterEvent('GuildLevelK')
		return true
	end
	
	-- adding points
	local monsterType = creature:getType()
	if monsterType:isRewardBoss() then -- points for killing bosses (must have isrewardboss tag)
		sendKillingPoints(creature:getId(), "boss")
	elseif monsterType:experience() >= CONFIG_GUILD_MONSTERS.minMonsterExp then -- points for killing normal monsters (with exp higher than X)
		sendKillingPoints(creature:getId(), "monster")
	end
	return true
end
guildLevel:register()

local guildLevel_e = CreatureEvent("GuildLevel_e")
function guildLevel_e.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if not creature:isPlayer() then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
	
	-- remove event if player wasn't in a guild or guild level was under max level 
	local g = creature:getGuild()
	if not g or g:getGuildLevel() < CONFIG_GUILD_LEVEL.maxLevel then
		creature:unregisterEvent('GuildLevel_e')
		return true
	end
	
	-- get reward percent
	local rewards = {}
	local percent = false
	rewards = getReward(creature:getId()) or {}
	for i = 1, #rewards do
		if rewards[i].type == GUILD_LEVEL_BONUS_ELEMENTAL then
			percent = rewards[i].quantity
		end
	end
	
	-- decrease damage
	if percent and primaryType ~= COMBAT_PHYSICALDAMAGE then
		primaryDamage = primaryDamage - (primaryDamage*percent)
		creature:sendCancelMessage("Elemental damage decreased in 25% due to guild level bonus.")
	end
	
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
guildLevel_e:register()

local guild = TalkAction("!guild")
function guild.onSay(player, words, param)
	local guild = player:getGuild()
	
	if not guild then
		player:popupFYI("You must be member of a guild to use this command.")
	else
		player:popupFYI('Guild name: '.. guild:getName() .. '\n\nGuild level: ' .. player:getGuild():getLevel() .. '\n\nGuild points: ' .. player:getGuild():getPoints() .. ' points\n\nTo next level: '.. CONFIG_GUILD_LEVEL.quantityToLevel - player:getGuild():getPoints() ..' points')
	end
	return false
end
guild:register()
