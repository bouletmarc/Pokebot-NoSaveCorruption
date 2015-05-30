local Paint = {}

local Memory = require "util.memory"
local Player = require "util.player"
local Utils = require "util.utils"

local Pokemon = require "storage.pokemon"

local encounters = 0
local elapsedTime = Utils.elapsedTime
local drawText = Utils.drawText

function Paint.draw(currentMap)
	local px, py = Player.position()
	drawText(0, 14, currentMap..": "..px.." "..py)
	drawText(0, 0, elapsedTime())

	if Memory.value("battle", "our_id") > 0 then
		local curr_hp = Pokemon.index(0, "hp")
		local hpStatus
		if curr_hp == 0 then
			hpStatus = "DEAD"
		elseif curr_hp <= math.ceil(Pokemon.index(0, "max_hp") * 0.2) then
			hpStatus = "RED"
		end
		if hpStatus then
			drawText(120, 7, hpStatus)
		end
	end

	local bidx = Pokemon.indexOf("bulbasaur")
	local pidx = Pokemon.indexOf("pidgey")
	if bidx ~= -1 then
		local scl = Pokemon.index(bidx, "special")
		local PP1 = Memory.raw(0xD02D)
		local PP2 = Memory.raw(0xD02E)
		local PP3 = Memory.raw(0xD02F)
		drawText(0, 134, scl.."scl  "..PP1.."/"..PP2.."/"..PP3)
	end
	if pidx ~= -1 then
		local hp = Pokemon.index(pidx, "hp")
		drawText(100, 134, hp.."HP")
	end
	local enc = " encounter"
	if encounters ~= 1 or encounters ~= 0 then
		enc = enc.."s"
	end
	drawText(0, 125, encounters..enc)
	return true
end

function Paint.wildEncounters(count)
	encounters = count
end

function Paint.reset()
	encounters = 0
end

return Paint
