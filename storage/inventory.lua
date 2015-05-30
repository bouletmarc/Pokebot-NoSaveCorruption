local Inventory = {}

local Input = require "util.input"
local Memory = require "util.memory"
local Menu = require "util.menu"
local Utils = require "util.utils"

local Pokemon = require "storage.pokemon"

local items = {
	pokeball = 4,
	bicycle = 6,
	moon_stone = 10,
	antidote = 11,
	burn_heal = 12,
	paralyze_heal = 15,
	full_restore = 16,
	super_potion = 19,
	potion = 20,
	escape_rope = 29,
	carbos = 38,
	repel = 30,

	rare_candy = 40,
	helix_fossil = 42,
	nugget = 49,
	pokedoll = 51,
	super_repel = 56,
	fresh_water = 60,
	soda_pop = 61,
	coin_case = 69,
	pokeflute = 73,
	ether = 80,
	max_ether = 81,
	elixer = 82,

	x_accuracy = 46,
	x_speed = 67,
	x_special = 68,

	cut = 196,
	fly = 197,
	surf = 198,
	strength = 199,

	horn_drill = 207,
	bubblebeam = 211,
	water_gun = 212,
	ice_beam = 213,
	thunderbolt = 224,
	earthquake = 226,
	dig = 228,
	tm34 = 234,
	rock_slide = 248,
}

local ITEM_BASE = 0x131E

-- Data

function Inventory.indexOf(name)
	local searchID = items[name]
	for i=0,19 do
		local iidx = ITEM_BASE + i * 2
		if Memory.raw(iidx) == searchID then
			return i
		end
	end
	return -1
end

function Inventory.count(name)
	local index = Inventory.indexOf(name)
	if index ~= -1 then
		return Memory.raw(ITEM_BASE + index * 2 + 1)
	end
	return 0
end

function Inventory.contains(...)
	for i,name in ipairs(arg) do
		if Inventory.count(name) > 0 then
			return name
		end
	end
end

-- Actions

function Inventory.teach(item, poke, replaceIdx, altPoke)
	local main = Memory.value("menu", "main")
	local column = Menu.getCol()
	if main == 144 then
		if column == 5 then
			Menu.select(replaceIdx, true)
		else
			Input.press("A")
		end
	elseif main == 128 then
		if column == 5 then
			Menu.select(Inventory.indexOf(item), "accelerate", true)
		elseif column == 11 then
			Menu.select(2, true)
		elseif column == 14 then
			Menu.select(0, true)
		end
	elseif main == Menu.pokemon then
		Input.press("B")
	elseif main == 64 or main == 96 or main == 192 then
		if column == 5 then
			Menu.select(replaceIdx, true)
		elseif column == 14 then
			Input.press("A")
		elseif column == 15 then
			Menu.select(0, true)
		else
			local idx = 0
			if poke then
				idx = Pokemon.indexOf(poke, altPoke)
			end
			Menu.select(idx, true)
		end
	else
		return false
	end
	return true
end

function Inventory.isFull()
	return Memory.raw(0x131D) == 20
end

function Inventory.use(item, poke, midfight)
	if midfight then
		local battleMenu = Memory.value("battle", "menu")
		if battleMenu == 94 then
			local rowSelected = Memory.value("menu", "row")
			if Menu.getCol() == 9 then
				if rowSelected == 0 then
					Input.press("Down")
				else
					Input.press("A")
				end
			else
				Input.press("Left")
			end
		elseif battleMenu == 233 then
			Menu.select(Inventory.indexOf(item), "accelerate", true)
		elseif Utils.onPokemonSelect(battleMenu) then
			if poke then
				if type(poke) == "string" then
					poke = Pokemon.indexOf(poke)
				end
				Menu.select(poke, true)
			else
				Input.press("A")
			end
		else
			Input.press("B")
		end
		return
	end

	local main = Memory.value("menu", "main")
	local column = Menu.getCol()
	if main == 144 then
		if Memory.value("battle", "menu") == 95 then
			Input.press("B")
		else
			local idx = 0
			if poke then
				idx = Pokemon.indexOf(poke)
			end
			Menu.select(idx, true)
		end
	elseif main == 128 or main == 60 then
		if column == 5 then
			Menu.select(Inventory.indexOf(item), "accelerate", true)
		elseif column == 11 then
			Menu.select(2, true)
		elseif column == 14 then
			Menu.select(0, true)
		else
			local index = 0
			if poke then
				index = Pokemon.indexOf(poke)
			end
			Menu.select(index, true)
		end
	elseif main == 228 then
		if column == 14 and Memory.value("battle", "menu") == 95 then
			Input.press("B")
		end
	elseif main == Menu.pokemon then
		Input.press("B")
	else
		return false
	end
	return true
end

return Inventory

