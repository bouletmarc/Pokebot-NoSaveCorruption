# PokeBot Changelog

## Version 2 - Update 3 (2.3) -- 9 April 2015
* Start of the bot
* Created the No save Corruption Bot under 6days (blue version only)
* Included the Any% Speedrun Bot
* Allow Custom Name for Player/Rival/Pokemon
* Can choice Between Pidgey & PP Strats
* He remove automatically the last game save to improve speedrun time
* He can continue a game where you saved the last spot
* Updated to version 1.3 of Kylecoburn PokeBot (where the 2.3 start from)

## Version 2 - Update 4 (2.4) -- 10 April 2015
* Fixed Resetting issue
* Fixed issue while using Custom Path (when resetting to continue, he was resetting for newgame)
* Fixed Squirtle naming for the Any% run
* Fixed Strats issue, was not resetting
* Fixed Pidgey deposal if 16HP
* Fixed Forest Grabing Potion if we got an Encounter ?
* Updated the changelog
* Updated timeRequirement on the no save corruption run
* Updated the first startup "Print" text, being more comprehensible
* Added Red Routing to the No save Corruption (Abra cost higher, need to get more coins)
* Added 'PidgeyStrats.md'
* Added 'PPStrats.md'
* Added Back NoReset in Control, I miss removed it earlier
* Make the Bot reboot if not already running
* Renamed Glitchless repository to Any% which makes understanding easier, I hope
* Can use Upper&lower case letters for settings "STRING" which make less errors for beginner
* Removed Critical&Repel Painting for the No Save Corruption Run

## Version 2 - Update 5 (2.5) -- 10 April 2015
* Fixed possibly the issue that the bot stop working if we got only 1 ball and we still not caught Pidgey
* Fixed Red route for No save corruption was missing 10coins for abra
* Added printing the seed at the start of a run
* Updated 'Readme.md' file
* Updated time-related constants to `memoryNames.time`

## Version 2 - Update 6 (2.6) -- 11 April 2015
* Updated to the original PokeBot base code **v1.4**
* Updated Memory values in the glitch runs strategies file `(0xD to 0x1)`
* Updated custom path, continue game, remove game function
* Updated `readme.md`
* Fixed for good I hope the issue with Pidgey and 1 ball left in the inventory
* Added Bulbasaur Stats Checkup at Viridian Mart for the No save corruption
* Added Readme for Modified original files
* Added Git Release and/or Git tags of versions
* Cleaned control command (shouldCatch and CanCatch) no more need to use *"noReset"*
* Relocated Strategies function and `strategies.lua`
* Relocated Owners values
* Relocated Glitch Dir to No save corruption
* Removed *"local"* from any settings values, making understanding easier for beginner
* Replaced *"Running4Skip"* to *"Runing4Continue"*
* Will only buy 1 pokeball if we forced it to PP strats for the No save corruption run

## Version 2 - Update 6 (2.6.1 & 2.6.2) -- 11 April 2015
* Fixed minor issue which tempDir was missing from `strategies.lua`
* Updated `Readme_Modified_Files_List`

## Version 2 - Update 6 (2.6.3) -- 11 April 2015
* Fixed again minor issue with tempDir in `strategies.lua`
* Fixed issue with buffed attack in No save corruption run
* Fixed running4newgame issue, was not making a new game, if a save file existed and we rebooted manually
* Fixed Version values are now a string values instead of a number (can use exemple "2.6.3")

## Version 2 - Update 6 (2.6.4) -- 11 April 2015
* Fixed minor Memory value issue for the No Save Corruption run

## Version 2 - Update 6 (2.6.5) -- 11 April 2015
* Fixed minor Menu value issue for the No Save Corruption run
