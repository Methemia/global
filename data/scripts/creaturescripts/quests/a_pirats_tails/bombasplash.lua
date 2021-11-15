local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

combat:setArea(createCombatArea({
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0}
}))

function spellCallback(param)
	local tile = Tile(Position(param.pos))
	if tile then
		if tile:getTopCreature() and tile:getTopCreature():isMonster() then
			if tile:getTopCreature():getName():lower() == "Weak Spot" then
				tile:getTopCreature():registerEvent("spawnBoss")
				tile:getTopCreature():addHealth(-math.random(3000, 6000))
			elseif tile:getTopCreature():getName():lower() == "Weak Spot" then
				tile:getTopCreature():addHealth(math.random(3000, 6000))
			end
		end
	end
end

function onTargetTile(cid, pos)
	local param = {}
	param.cid = cid
	param.pos = pos
	param.count = 0
	spellCallback(param)
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local BombaSplash = CreatureEvent("BombaSplash")
function BombaSplash.onThink(creature)
	local hp = (creature:getHealth()/creature:getMaxHealth())*100
	if hp < 60.0 then
		addEvent(function(cid)
			local creature = Creature(cid)
			if not creature then
				return
			end
			creature:say("Kabum!", TALKTYPE_ORANGE_2)
			local var = {type = 1, number = creature:getId()}
			combat:execute(creature, var)
			creature:remove(1)
			return true
		end, 100, creature:getId())
	end
end

BombaSplash:register()
