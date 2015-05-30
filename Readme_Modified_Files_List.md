# Modified files from the original bot


## Not modified files :

**Action :**

`action/battle.lua`

`action/shop.lua`


**Ai :**

`ai/combat.lua`

**Data :**

`data/any%/red-blue/paths.lua`

`data/any%/yellow/paths.lua`

`data/movelist.lua`

`data/opponents.lua`


**Util :**

`util/any%/paint.lua`

`util/bridge.lua`

`util/memory.lua`

`util/menu.lua`

`util/utils.lua`


## Modified files (with description) :

`main.lua`							--Added tons of settings also newGame and continueGame function


**Action :**

`action/textbox.lua`				--Added 1-7 letters naming function

`action/walk.lua`					--Added Custom path function + holding B on walk function


**Ai :**

`ai/any%/strategies.lua` 			--Added reset running values for newGame and continueGame

`ai/any%/red-blue/strategies.lua`	--Added Squirtle custom name function

`ai/control.lua`					--Added NoSaveCorruption Exp, Catch pidgey and require function at the bottom


**Storage :**

`storage/inventory.lua`				--Added burn_heal and coin_case to the list

`storage/pokemon.lua`				--Added Abra and Bulbasaur, added attack leech_seed and teleport


**Util :**

`util/input.lua`					--Added hold B, removeGame and waiting functions

`util/player.lua`					--Added player disinteract command (pressing B instead of A)

`util/settings.lua`					--Added battle_style = SET if not yellow, newGame, continueGame and setName function


## Modified folder path in files (dir) :

`main.lua`			-- strategies.lua and paint.lua

`action/walk.lua`	-- paths.lua

`ai/control.lua`	-- strategies.lua and paint.lua

