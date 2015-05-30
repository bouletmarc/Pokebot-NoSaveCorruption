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

	local nidx = Pokemon.indexOf("nidoran", "nidorino", "nidoking")
	if nidx ~= -1 then
		local att = Pokemon.index(nidx, "attack")
		local def = Pokemon.index(nidx, "defense")
		local spd = Pokemon.index(nidx, "speed")
		local scl = Pokemon.index(nidx, "special")
		drawText(100, 0, att.." "..def.." "..spd.." "..scl)
	end
	local enc = " encounter"
	if encounters ~= 1 then
		enc = enc.."s"
	end
	drawText(0, 116, Memory.value("battle", "critical"))
	drawText(0, 125, Memory.value("player", "repel"))
	drawText(0, 134, encounters..enc)
	return true
end

function Paint.wildEncounters(count)
	encounters = count
end

function Paint.reset()
	encounters = 0
end

return Paint
