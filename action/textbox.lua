local Textbox = {}

local Input = require "util.input"
local Memory = require "util.memory"
local Menu = require "util.menu"

local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ *():;[]ab-?!mf/.,"
-- local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ *():;[]ポモ-?!♂♀/.,"

local nidoName = "A"
local nidoIdx = 1

local TableNumber = 1
local ActualUpper = 1

local function getLetterAt(index)
	return alphabet:sub(index, index)
end

local function getIndexForLetter(letter)
	return alphabet:find(letter, 1, true)
end

function Textbox.name(letter, randomize)
	local inputting = Memory.value("menu", "text_input") == 240
	if inputting then
		-- Values
		local lidx
		local crow
		local drow
		local ccol
		local dcol
		local NameTable = {}
		local Waiting
		
		if letter then
			RUNNING4NEWGAME = false	--make sure it's not running if we begin a game
			local StringLenght = string.len(letter)
			letter:gsub(".",function(letter2)
				table.insert(NameTable,letter2)
				
				if NameTable[TableNumber] then
					local GetUpper
					--Set Special Chars & Get UpperCase
					if NameTable[TableNumber] == "<" then
						GetUpper = true
						lidx = 35
					elseif NameTable[TableNumber] == ">" then
						GetUpper = true
						lidx = 36
					elseif NameTable[TableNumber] == "{" then
						GetUpper = true
						lidx = 40
					elseif NameTable[TableNumber] == "}" then
						GetUpper = true
						lidx = 41
					else
						GetUpper = string.match(NameTable[TableNumber], '%u')
						lidx = getIndexForLetter(string.upper(NameTable[TableNumber]))
					end
					--Check For Waiting
					Waiting = Input.isWaiting()
					--Proceed
					if not Waiting then
						--Get/set Lower/Upper
						if GetUpper == nil and ActualUpper == 1 or GetUpper ~= nil and ActualUpper == 0 then
							crow = Memory.value("menu", "input_row")
							if Menu.balance(crow, 6, true, 6, true) then
								ccol = math.floor(Memory.value("menu", "column") / 2)
								if Menu.sidle(ccol, 0, 9, true) then
									Input.press("A")
									if ActualUpper == 1 then
										ActualUpper = 0
									elseif ActualUpper == 0 then
										ActualUpper = 1
									end
								end
							end
						--Get/Set Letter
						else
							crow = Memory.value("menu", "input_row")
							drow = math.ceil(lidx / 9)
							if Menu.balance(crow, drow, true, 6, true) then
								ccol = math.floor(Memory.value("menu", "column") / 2)
								dcol = math.fmod(lidx - 1, 9)
								if Menu.sidle(ccol, dcol, 9, true) then
									Input.press("A")
									if Memory.value("menu", "text_length") == TableNumber then
										TableNumber = TableNumber + 1
									end
								end
							end
						end
					end
				end
			end)
			Waiting = Input.isWaiting()
			if TableNumber > StringLenght and not Waiting then
				if Memory.value("menu", "text_length") > 0 then
					Input.press("Start")
					TableNumber = 1
					ActualUpper = 1
					NameTable = {}
					return true
				end
			end
		else
			if Memory.value("menu", "text_length") > 0 then
				Input.press("Start")
				return true
			end
			
			lidx = nidoIdx
			
			crow = Memory.value("menu", "input_row")
			drow = math.ceil(lidx / 9)
			if Menu.balance(crow, drow, true, 6, true) then
				ccol = math.floor(Memory.value("menu", "column") / 2)
				dcol = math.fmod(lidx - 1, 9)
				if Menu.sidle(ccol, dcol, 9, true) then
					Input.press("A")
				end
			end
		end
	else
		-- TODO cancel when menu isn't up
		
		--Reset Values
		TableNumber = 1
		ActualUpper = 1
		NameTable = {}
		
		if Memory.raw(0x10B7) == 3 then
			Input.press("A", 2)
		elseif randomize then
			Input.press("A", math.random(1, 5))
		else
			Input.cancel()
		end
	end
end

function Textbox.getName()
	if nidoName == "a" then
		return "ポ"
	end
	if nidoName == "b" then
		return "モ"
	end
	if nidoName == "m" then
		return "♂"
	end
	if nidoName == "f" then
		return "♀"
	end
	return nidoName
end

function Textbox.setName(index)
	if index >= 0 and index < #alphabet then
		nidoIdx = index + 1
		nidoName = getLetterAt(index)
	end
end

function Textbox.isActive()
	return Memory.value("game", "textbox") == 1
end

function Textbox.handle()
	if not Textbox.isActive() then
		return true
	end
	Input.cancel()
end

return Textbox
