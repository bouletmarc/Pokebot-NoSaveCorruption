local Paths = {
	-- Red's room
	{38, {3,6}, {5,6}, {5,1}, {7,1}},
	-- Red's house
	{39, {7,1}, {7,6}, {3,6}, {3,8}},
	-- Into the Wild
	{0, {5,6}, {10,6}, {10,0}},
	-- Choose your character!
	{40, {5,3}, {c="a",a="Pallet Rival"}, {5,4}, {7,4}, {s="confirm",dir="Up",type="A"}, {5,3}, {s="confirm",dir="Up",type="B"}, {5,6}, {s="waitToFight"}, {5,12}},
	-- Let's try this escape again
	{0, {12,12}, {c="a",a="Pallet Town"}, {c="encounters",limit=4}, {9,12}, {9,2}, {10,2}, {10,-1}},
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
	{0, {12,12}, {9,12}, {9,2}, {10,2}, {10,-1}},
	-- The grass again!?
	{12, {10,35}, {10,30}, {8,30}, {8,24}, {12,24}, {12,20}, {9,20}, {9,14}, {14,14}, {s="dodgePalletBoy"}, {14,2}, {11,2}, {11,-1}},
	-- Back to the Mart
	{1, {21,35}, {21,30}, {19,30}, {19,20}, {29,20}, {29,19}},
	-- Viridian Mart redux
	{42, {3,7}, {3,5}, {2,5}, {s="shopViridianPokeballs"}, {3,5}, {3,8}},

}

return Paths
