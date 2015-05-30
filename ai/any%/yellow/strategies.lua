local lowerGameRun = string.lower(GAME_RUN)

local Strategies = require("ai."..lowerGameRun..".strategies")

local Combat = require "ai.combat"
local Control = require "ai.control"

local Battle = require "action.battle"
local Shop = require "action.shop"
local Textbox = require "action.textbox"
local Walk = require "action.walk"

local Bridge = require "util.bridge"
local Input = require "util.input"
local Memory = require "util.memory"
local Menu = require "util.menu"
local Player = require "util.player"
local Utils = require "util.utils"

local Inventory = require "storage.inventory"
local Pokemon = require "storage.pokemon"

local status = Strategies.status
local stats = Strategies.stats

local strategyFunctions = Strategies.functions

-- TIME CONSTRAINTS

Strategies.timeRequirements = {

	nidoran = function()
		local timeLimit = 8
		if Pokemon.inParty("pidgey") then
			timeLimit = timeLimit + 0.67
		end
		return timeLimit
	end,

	mt_moon = function()
		local timeLimit = 30
		if stats.nidoran.attack > 15 and stats.nidoran.speed > 14 then
			timeLimit = timeLimit + 0.25
		end
		if Pokemon.inParty("sandshrew") then
			timeLimit = timeLimit + 0.25
		end
		return timeLimit
	end,

}

-- HELPERS

local function depositPikachu()
	if not Textbox.isActive() then
		Player.interact("Up")
	else
		local pc = Memory.value("menu", "size")
		if Memory.value("battle", "menu") ~= 19 then
			local menuColumn = Menu.getCol()
			if menuColumn == 5 then
				Menu.select(Pokemon.indexOf("pikachu"))
			elseif menuColumn == 10 then
				Input.press("A")
			elseif pc == 3 then
				Menu.select(0)
			elseif pc == 5 then
				Menu.select(1)
			else
				Input.cancel()
			end
		else
			Input.cancel()
		end
	end
end

local function takeCenter(pp, startMap, entranceX, entranceY, finishX)
	local px, py = Player.position()
	local currentMap = Memory.value("game", "map")
	local sufficientPP = Pokemon.pp(0, "horn_attack") > pp
	if currentMap == startMap then
		if not sufficientPP then
			if px ~= entranceX then
				px = entranceX
			else
				py = entranceY
			end
		else
			if px == finishX then
				return true
			end
			px = finishX
		end
	else
		if Pokemon.inParty("pikachu") then
			if py > 5 then
				py = 5
			elseif px < 13 then
				px = 13
			elseif py ~= 4 then
				py = 4
			else
				return depositPikachu()
			end
		else
			if px ~= 3 then
				if Menu.close() then
					px = 3
				end
			elseif sufficientPP then
				if Textbox.handle() then
					py = 8
				end
			elseif py > 3 then
				py = 3
			else
				strategyFunctions.confirm({dir="Up"})
			end
		end
	end
	Walk.step(px, py)
end

-- STRATEGIES

-- dodgePalletBoy

strategyFunctions.shopViridianPokeballs = function()
	return Shop.transaction{
		buy = {{name="pokeball", index=0, amount=4}, {name="potion", index=1, amount=6}}
	}
end

strategyFunctions.catchNidoran = function()
	if not Control.canCatch() then
		return true
	end
	local pokeballs = Inventory.count("pokeball")
	local caught = Memory.value("player", "party_size") > 1
	if pokeballs < (caught and 1 or 2) then
		return Strategies.reset("Ran too low on PokeBalls", pokeballs)
	end
	if Battle.isActive() then
		local isNidoran = Pokemon.isOpponent("nidoran")
		if isNidoran and Memory.value("battle", "opponent_level") == 6 then
			if Strategies.initialize() then
				Bridge.pollForName()
			end
		end
		status.tries = nil
		if Memory.value("menu", "text_input") == 240 then
			Textbox.name()
		elseif Memory.value("battle", "menu") == 95 then
			if isNidoran then
				Input.press("A")
			else
				Input.cancel()
			end
		else
			Battle.handle()
		end
	else
		Pokemon.updateParty()
		local hasNidoran = Pokemon.inParty("nidoran")
		if hasNidoran then
			Bridge.caught("nidoran")
			return true
		end

		local timeLimit = Strategies.getTimeRequirement("nidoran")
		local resetMessage = "find a suitable Nidoran"
		if Strategies.resetTime(timeLimit, resetMessage) then
			return true
		end
		local px, py = Player.position()
		if py > 48 then
			py = 48
		elseif px < 9 then
			px = 9
		else
			px = 8
		end
		Walk.step(px, py) --TODO DSum
	end
end

-- leer

strategyFunctions.checkNidoStats = function()
	local nidx = Pokemon.indexOf("nidoran")
	if Pokemon.index(nidx, "level") == 8 then
		local att = Pokemon.index(nidx, "attack")
		local def = Pokemon.index(nidx, "defense")
		local spd = Pokemon.index(nidx, "speed")
		local scl = Pokemon.index(nidx, "special")
		Bridge.stats(att.." "..def.." "..spd.." "..scl)
		stats.nidoran = {
			attack = att,
			defense = def,
			speed = spd,
			special = scl,
		}

		local statDiff = (16 - att) + (15 - spd) + (13 - scl)
		local resets = att < 15 or spd < 14 or scl < 12 --RISK
		local nStatus = "Att: "..att..", Def: "..def..", Speed: "..spd..", Special: "..scl
		if resets then
			return Strategies.reset("Bad Nidoran - "..nStatus)
		end
		-- if def < 12 then
		-- 	statDiff = statDiff + 1
		-- end
		local superlative
		local exclaim = "!"
		if statDiff == 0 then
			if def == 14 then
				superlative = "God"
				exclaim = "! Kreygasm"
			else
				superlative = "Perfect"
			end
		elseif att == 16 and spd == 15 then
			if statDiff == 1 then
				superlative = "Great"
			elseif statDiff == 2 then
				superlative = "Good"
			else
				superlative = "Okay"
			end
		elseif statDiff == 1 then
			superlative = "Good"
		elseif statDiff == 2 then
			superlative = "Okay"
			exclaim = "."
		else
			superlative = "Min stat"
			exclaim = "."
		end
		nStatus = superlative.." Nidoran"..exclaim.." "..nStatus
		Bridge.chat(nStatus)
		return true
	end
end

strategyFunctions.centerViridian = function()
	return takeCenter(15, 2, 13, 25, 18)
end

strategyFunctions.fightBrock = function()
	local curr_hp = Pokemon.info("nidoran", "hp")
	if curr_hp == 0 then
		return Strategies.death()
	end
	if Battle.isActive() then
		status.canProgress = true
		local __, turnsToKill, turnsToDie = Combat.bestMove()
		if turnsToDie and turnsToDie < 2 and Inventory.contains("potion") then
			Inventory.use("potion", "nidoran", true)
		else
			local bideTurns = Memory.value("battle", "opponent_bide")
			if bideTurns > 0 then
				local onixHP = Memory.double("battle", "opponent_hp")
				if status.tries == 0 then
					status.tries = onixHP
					status.startBide = bideTurns
				end
				if turnsToKill then
					local forced
					if turnsToKill < 2 or status.startBide - bideTurns > 1 then
					-- elseif turnsToKill < 3 and status.startBide == bideTurns then
					elseif onixHP == status.tries then
						forced = "leer"
					end
					Battle.fight(forced)
				else
					Input.cancel()
				end
			else
				status.tries = 0
				strategyFunctions.leer({{"onix", 13}})
			end
		end
	elseif status.canProgress then
		return true
	elseif Textbox.handle() then
		Player.interact("Up")
	end
end

strategyFunctions.centerMoon = function()
	return takeCenter(5, 15, 11, 5, 12)
end

-- reportMtMoon

-- PROCESS

function Strategies.initGame(midGame)
	if not STREAMING_MODE then
		-- Strategies.setYolo("")
		if Pokemon.inParty("nidoking") then
			stats.nidoran = {
				attack = 55,
				defense = 45,
				speed = 50,
				special = 45,
			}
		else
			stats.nidoran = {
				attack = 16,
				defense = 12,
				speed = 15,
				special = 13,
				level4 = true,
			}
		end
	end
end

function Strategies.completeGameStrategy()
	status = Strategies.status
end

function Strategies.resetGame()
	status = Strategies.status
	stats = Strategies.stats
end

return Strategies
