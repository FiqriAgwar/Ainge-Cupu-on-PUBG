
print_opening_message :-
	print("Welcome to the battlefield!"), nl,
	print("You have been chosen as one of the lucky contestants. Be the last man standing"), nl,
	print("and you will be remembered as one of the victors."), nl.

print_help :-
	print("Available commands:"), nl,
	print("start. -- start the game!"), nl,
	print("help. -- show available commands"), nl,
	print("quit. -- quit the game"), nl,
	print("look. -- look around you"), nl,
	print("n. s. e. w. -- move"), nl,
	print("map. -- look at the map and detect enemies"), nl,
	print("take(Object). -- pick up an object"), nl,
	print("drop(Object). -- drop an object"), nl,
	print("use(Object). -- use an object"), nl,
	print("attack. -- attack enemy that crosses your path"), nl,
	print("status. -- show your status"), nl,
	print("save(Filename). -- save your game"), nl,
	print("load(Filename). -- load previously save game"), nl,

	print("Legends:"), nl,
	print("W = weapon"), nl,
	print("A = armor"), nl,
	print("M = medicine"), nl,
	print("O = ammo"), nl,
	print("P = player"), nl,
	print("E = enemy"), nl,
	print("- = accessible"), nl,
	print("X = inaccessible"), nl.

print_player_stat :-
	player_stat(Health, Armor),
	print("Health : ", X), nl,
	print("Armor : ", Y), nl,
	print("Inventory : ", Z), nl.