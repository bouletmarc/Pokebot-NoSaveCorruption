local paths = {
	-- Red's room
	{38, {3,6}, {1,6}, {1,5}, {0,5}, {0,2}, {s="grabPCPotion"}, {7,2}, {7,1}},
	-- Red's house
	{39, {7,1}, {7,6}, {3,6}, {3,8}},
	-- Into the Wild
	{0, {5,6}, {s="checkStrats"}, {10,6}, {10,1}},
	-- Choose your character!
	{40, {5,3}, {c="a",a="Pallet Rival"}, {5,4}, {8,4}, {s="bulbasaurIChooseYou"}, {8,5}, {5,5}, {5,6}, {s="fightCharmander"}, {s="split"}, {5,12}},

-- 1: RIVAL 1

	-- Let's try this escape again
	{0, {12,12}, {c="a",a="Pallet Town"}, {c="viridianExpGlitch"}, {c="encounters",limit=4}, {9,12}, {9,2}, {10,2}, {10,-1}},
	-- First encounters
	{12, {10,35}, {10,30}, {8,30}, {8,24}, {12,24}, {12,20}, {9,20}, {9,14}, {14,14}, {s="dodgePalletBoy"}, {14,2}, {11,2}, {11,-1}},
	-- To the Mart
	{1, {21,35}, {21,30}, {19,30}, {19,20}, {29,20}, {29,19}},
	-- Viridian Mart
	{42, {2,5}, {3,5}, {3,8}},
	-- Backtracking
	{1, {29,20}, {c="encounters",limit=5}, {29,21}, {26,21}, {26,30}, {20,30}, {20,36}},
	-- Parkour
	{12, {10, 0}, {10,3}, {8,3}, {8,18}, {9,18}, {9,22}, {12,22}, {12,24}, {10,24}, {10,36}},
	-- To Oak's lab
	{0, {10,0}, {10,7}, {9,7}, {9,12}, {12,12}, {12,11}},
	-- Parcel delivery
	{40, {5,11}, {5,3}, {4,3}, {4,1}, {5,1}, {s="interact",dir="Down"}, {4,1}, {4,12}},
	-- Leaving home
	{0, {12,12}, {c="viridianBackupExpGlitch"}, {9,12}, {9,2}, {10,2}, {10,-1}},
	-- The grass again!?
	{12, {10,35}, {10,30}, {8,30}, {8,24}, {12,24}, {12,20}, {9,20}, {9,14}, {14,14}, {s="dodgePalletBoy"}, {14,2}, {11,2}, {11,-1}},
	-- Back to the Mart
	{1, {21,35}, {c="a",a="Viridian City"}, {c="encounters",limit=8}, {21,30}, {19,30}, {19,20}, {29,20}, {29,19}},
	-- Viridian Mart redux
	{42, {3,7}, {3,5}, {2,5}, {s="shopViridian"}, {3,5}, {3,8}},
	-- To the forest
	{1, {29,20}, {18,20}, {18,6}, {s="dodgeViridianOldMan"}, {17,4}, {s="healTreePotion"}, {15,4}, {s="speak"}, {17,4}, {17, 0}, {17, -1}},
	-- Out of Viridian City
	{13, {7,71}, {7,57}, {4,57}, {4,52}, {8,52}, {c="a",a="Pidgey grass"}, {c="pidgeyBackupExp"}, {c="catchPidgey"}, {s="catchPidgey"}, {8,46}, {s="split"}, {c="disableCatch"}, {3,46}, {3,43}},
	
-- 2. PIDGEY	
	
	-- Forest entrance
	{50, {4,7}, {c="a",a="Viridian Forest"}, {c="encounters",limit=9}, {4,1}, {5,1}, {5,0}},
	-- Viridian Forest
	{51, {17,47}, {17,43}, {26,43}, {26,34}, {25,34}, {25,32}, {27,32}, {27,20}, {25,20}, {25,12}, {s="grabAntidote"}, {25,9}, {17,9}, {17,16}, {13,16}, {13,3}, {7,3}, {7,22}, {1,22}, {1,19}, {s="grabForestPotion"}, {1,18}, {s="fightWeedle"}, {c="encounters",limit=12}, {1,16}, {s="checkSpec"}, {1,15}, {s="equipForGlitch"}, {1,5}, {s="checkInventory"}, {1,-1}},
	-- Forest exit
	{47, {4,7}, {4,1}, {5,1}, {5,0}},
	-- Road to Pewter City
	{13, {3,11}, {c="a",a="Pewter City"}, {3,8}, {8,8}, {8,-1}},
	-- Pewter City
	{2, {18,35}, {18,26}, {s="checkForPidgey"}, {s="split"}, {18,22}, {19,22}, {19,18}, {36,18}, {s="prepareSave"}, {37,18}, {s="performSkip"}, {s="performReset"}, {s="speak"}, {40,18}},
	
-- 3: READY FOR SKIP
	
	-- Route3 #1
	{14, {0,10}, {c="a",a="Route 3"}, {0,8}, {-1,8}},
	-- Back to Pewter City to talk
	{2, {39,16}, {36,16}, {s="openPokemonMenu"}, {s="closeMenu"}, {s="speakToGlithGuy"}, {s="split"}, {s="leaveGlitchGuy"}},
	
-- 4: SKIP DONE

	-- Saffron City Poke Center
	{182, {3,7}, {c="a",a="Saffron City Brock Skip"}, {3,4}, {s="checkPidgeyHP"}, {s="walkBack"}, {s="split"}, {3,3}, {s="confirm",dir="Up"}, {3,8}},
	-- Saffron City
	{10, {9,30}, {2,30}, {2,18}, {-1,18}},
	-- Enter Guard
	{18, {19,10}, {17,10}},
	-- Guard House
	{76, {5,4}, {3,4}, {s="speak"}, {2,4}, {-1,4}},
	-- To Celadon City
	{18, {11,10}, {8,10}, {8,9}, {4,9}, {4,3}, {-1,3}},
	-- Celadon City
	{6, {49,11}, {36,11}, {36,23}, {25,23}, {25,28}, {31,28}, {31,27}},
	-- Getting Coin Case
	{138, {3,7}, {3,1}, {1,1}, {s="speak"}, {3,1}, {3,8}},
	-- Celadon City #2
	{6, {31,28}, {25,28}, {25,23}, {36,23}, {36,20}, {28,20}, {28,19}},
	-- Game Center
	{135, {15,17}, {16,17}, {16,15}, {s="speak"}, {16,13}, {s="interact",dir="Right"}, {16,11}, {15,11}, {s="interact",dir="Left"}, {15,9}, {s="speak"}, {15,8}, {9,8}, {9,11}, {s="speak"}, {10,11}, {10,15}, {s="speak"}, {10,17}, {15,17}, {15,18}},	
	-- Celadon City #3
	{6, {28,20}, {33,20}, {33,19}},
	-- Buy Abra
	{137, {4,7}, {4,4}, {2,4}, {2,3}, {s="getAbra"}, {c="a",a="Celadon City Abra"}, {s="split"}, {4,3}, {4,8}},
	
-- 5. ABRA
	
	-- Celadon City #4
	{6, {33,20}, {s="teleport",map=10}},
	-- Saffron City after teleport
	{10, {9,30}, {9,29}},
	-- Poke Center depose
	{182, {3,7}, {3,4}, {13,4}, {s="deposeAll",keep="abra"}, {4,4}, {4,8}},
	-- Saffron City after depose
	{10, {9,30}, {9,32}, {20,32}, {20,36}},
	-- Leave Saffron City
	{17, {10,0}, {10,2}},
	-- South Guard
	{73, {3,0}, {3,2}, {s="speak"}, {3,3}, {3,6}},
	-- Route6
	{17, {10,8}, {10,10}, {7,10}, {7,13}, {5,13}, {5,15}, {s="performTeleportGlitch"}, {s="swapItem",item="coin_case",pos1=5}, {s="teleport",map=10}},
	
-- 6. TELEPORT GLITCH #1

	-- To the Dojo
	{10, {9,30}, {c="a",a="Saffron City Teleport #1"}, {s="split"}, {3,30}, {3,7}, {23,7}, {23,4}, {26,4}, {26,3}},
	-- Dojo Gym
	{177, {4,11}, {4,10}, {2,10}, {2,7}, {s="allowDeath",on=true}, {s="fightGymGuy"}},
	-- Saffron City after death
	{10, {9,30}, {s="allowDeath",on=false}, {s="openMenu"}, {s="closeMenu"}, {9,32}, {20,32}, {20,36}},
	-- MissingNo
	{17, {10,0}, {s="closingAutomation"}, {s="battleMissingNo"}, {10,2}},
	-- South Guard #2
	{73, {3,0}, {3,2}, {s="speak"}, {3,3}, {3,6}},
	-- Route6 #2
	{17, {10,8}, {10,10}, {7,10}, {7,13}, {5,13}, {5,15}, {s="performTeleportGlitch"}, {s="tossItem",pos=6,amount=2}, {s="teleport",map=10}},
	
-- 7. TELEPORT GLITCH #2

	-- To the Dojo #2
	{10, {9,30}, {c="a",a="Saffron City Teleport #2"}, {s="split"}, {3,30}, {3,7}, {23,7}, {23,4}, {26,4}, {26,3}},
	-- Dojo Gym #2
	{177, {4,11}, {4,10}, {2,10}, {2,7}, {s="allowDeath",on=true}, {s="fightGymGuy"}},
	-- Saffron City after death #2
	{10, {9,30}, {s="allowDeath",on=false}, {s="openMenu"}, {s="closeMenu"}, {9,32}, {20,32}, {20,36}},
	-- MissingNo #2
	{17, {10,0}, {s="closingAutomation"}, {s="battleMissingNo"}, {10,2}},
	-- South Guard #3
	{73, {3,0}, {c="a",a="Hall Of Fame"}, {s="swapItem",pos1=3,pos2=6}, {s="tossItem",pos=6}, {s="tossItem",pos=1}, {s="tossItem",pos=1}, {s="tossItem",pos=1}, {s="tossItem",pos=1}, {s="tossItem",pos=1,amount=253}, {s="swapItem",pos1=1,pos2=2}, {s="swapItem",pos1=2,pos2=1}, {s="tossItem",pos=28,amount=1}, {s="swapItem",pos1=23,pos2=36}, {s="tossTM",pos=36,amount=9}, {s="closeMenu"}, {3,-1}},
	
-- 8. HALL OF FAME

	-- Champion
	{118, {s="champion"}}
}

return paths
