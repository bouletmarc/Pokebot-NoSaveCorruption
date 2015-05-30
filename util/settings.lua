local Settings = {}

local Textbox = require "action.textbox"

local Bridge = require "util.bridge"
local Input = require "util.input"
local Memory = require "util.memory"
local Menu = require "util.menu"
local Utils = require "util.utils"

local START_WAIT = 99

local yellow = YELLOW
local tempDir

local settings_menu
if yellow then
	settings_menu = 93
else
	settings_menu = 94
end

local desired = {}
if yellow then
	desired.text_speed = 1
	desired.battle_animation = 128
	desired.battle_style = 64
else
	desired.text_speed = 1
	desired.battle_animation = 10
	desired.battle_style = 10
end

local function isEnabled(name)
	if yellow then
		local matching = {
			text_speed = 0xF,
			battle_animation = 128,
			battle_style = 64
		}
		local settingMask = Memory.value("setting", "yellow_bitmask", true)
		return bit.band(settingMask, matching[name]) == desired[name]
	else
		return Memory.value("setting", name) == desired[name]
	end
end

-- PUBLIC

function Settings.set(...)
	for i,name in ipairs(arg) do
		if not isEnabled(name) then
			if Menu.open(settings_menu, 1) then
				Menu.setOption(name, desired[name])
			end
			return false
		end
	end
	return Menu.cancel(settings_menu)
end

function Settings.startNewAdventure(startWait)
	local startMenu, withBattleStyle
	withBattleStyle = "battle_style"
	if yellow then
		startMenu = Memory.raw(0x0F95) == 0
	else
		startMenu = Memory.value("player", "name") ~= 0
	end
	if startMenu and Menu.getCol() ~= 0 then
		if Settings.set("text_speed", "battle_animation", withBattleStyle) then
			Menu.select(0)
		end
	elseif math.random(0, startWait) == 0 then
		Input.press("Start")
	end
end

function Settings.RemoveLastAdventure(startWait)
	if not tempDir then
		if Memory.value("menu", "size") ~= 2 and math.random(0, startWait) == 0 then
			Input.press("Start")
		elseif Memory.value("menu", "size") == 2 then
			Input.press("B")
			tempDir = true
		end
	else
		if Utils.ingame() then
			if Memory.value("menu", "pokemon") ~= 0 then
				Input.press("B")
			elseif Memory.value("menu", "pokemon") == 0 then
				if Memory.value("menu", "size") == 2 then
					Input.press("", 0, false, true)
				else
					if Memory.value("menu", "row") == 1 then
						Input.press("A")
					else
						Input.press("Down")
					end
				end
			end
		else
			tempDir = false
			RUNNING4NEWGAME = false		--stop the function after removed
		end
	end
end

function Settings.ContinueAdventure()
	local current = Memory.value("menu", "current")
	local row = Memory.value("menu", "row")
	if row == 0 then
		if current == 32 then
			RUNNING4CONTINUE = false	--stop ContinueAdventure
		elseif current ~= 55 then
			Input.press("A")
		end
	else
		Input.press("Up")
	end
end

function Settings.choosePlayerNames()
	local name = PLAYER_NAME
	if dirText ~= "glitch" then
		if (Memory.value("player", "name") ~= 141) or (Memory.value("player", "name2") ~= 136) then
			name = RIVAL_NAME
		end
	else
		if (Memory.value("player", "name") ~= 141) or (Memory.value("player", "name2") ~= 136) then
			name = "> "
		end
	end
	Textbox.name(name, true)
end

function Settings.pollForResponse()
	local response = Bridge.process()
	if response then
		Bridge.polling = false
		Textbox.setName(tonumber(response))
	end
end

return Settings
