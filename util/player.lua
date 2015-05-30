local Player = {}

local Textbox = require "action.textbox"

local Input = require "util.input"
local Memory = require "util.memory"

local yellow = YELLOW
local facingDirections = {Up=8, Right=1, Left=2, Down=4}

function Player.isFacing(direction)
	return Memory.value("player", "facing") == facingDirections[direction]
end

function Player.face(direction)
	if Player.isFacing(direction) then
		return true
	end
	if Textbox.handle() then
		Input.press(direction, 0)
	end
end

function Player.interact(direction)
	if Player.face(direction) then
		Input.press("A", yellow and 3 or 2)
		return true
	end
end

function Player.disinteract(direction)
	if Player.face(direction) then
		Input.press("B", yellow and 3 or 2)
		return true
	end
end

function Player.isMoving()
	return Memory.value("player", "moving") ~= 0
end

function Player.position()
	return Memory.value("player", "x"), Memory.value("player", "y")
end

return Player
