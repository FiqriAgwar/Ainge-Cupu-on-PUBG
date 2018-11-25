
print_opening_message :-
	write('Welcome to the battlefield!'), nl,
	write('You have been chosen as one of the lucky contestants. Be the last man standing'), nl,
	write('and you will be remembered as one of the victors.'), nl, nl.

print_help :-
	write('Available commands:'), nl,
	write('start. -- start the game!'), nl,
	write('help. -- show available commands'), nl,
	write('quit. -- quit the game'), nl,
	write('look. -- look around you'), nl,
	write('n. s. e. w. -- move'), nl,
	write('map. -- look at the map and detect enemies'), nl,
	write('take(Object). -- pick up an object'), nl,
	write('drop(Object). -- drop an object'), nl,
	write('use(Object). -- use an object'), nl,
	write('attack. -- attack enemy that crosses your path'), nl,
	write('status. -- show your status'), nl,
	write('save(Filename). -- save your game'), nl,
	write('load(Filename). -- load previously save game'), nl, nl,

	write('Legends:'), nl,
	write('W = weapon'), nl,
	write('A = armor'), nl,
	write('M = medicine'), nl,
	write('O = ammo'), nl,
	write('P = player'), nl,
	write('E = enemy'), nl,
	write('- = accessible'), nl,
	write('X = inaccessible'), nl.

print_player_stat :-
	player_stat(Health, Armor),
	equipped_weapon(player, Weapon, _),
	write('Health : '), write(Health), nl,
	write('Armor : '), write(Armor), nl,
	write('Weapon: '), write(Weapon), nl,
	print_ammo,
	print_player_inventory, nl.

print_ammo :- 
	equipped_weapon(player, Weapon, Ammo),
	Weapon \== none,
	write('Ammo: '),
	write(Ammo), nl, !.

print_ammo :-
	equipped_weapon(player, Weapon, _),
	Weapon == none.

print_player_inventory :-
	inventory(player, _, ListObject),
	ListObject == [],
	write('Your inventory is empty!').

print_player_inventory :-
	inventory(player, _, ListObject),
	ListObject \== [],
	write('Inventory: '), nl,
	print_list_inventory(ListObject).

print_list_inventory([]) :- !.

print_list_inventory([Head|Tail]) :-
	write('  '),
	write(Head),
	nl,
	print_list_inventory(Tail).

print_grid(_, X, Y) :-
    position(Type, X, Y),
	enemy(Type),
	write(' E '),!.

print_grid(_, X, Y) :-
    position(Type, X, Y),
	medicine(Type,_),
	write(' M '),!.

print_grid(_, X, Y) :-
    position(Type, X, Y),
	weapon(Type,_,_,_),
	write(' W '),!.

print_grid(_, X, Y) :-
    position(Type, X, Y),
	armor(Type,_),
	write(' A '),!.

print_grid(_, X, Y) :-
    position(Type, X, Y),
	ammo(Type,_),
	write(' O '),!.

print_grid(_, X, Y) :-
    position(Type, X, Y),
	Type = player,
	write(' P '),!.

print_grid(MapID, X, Y) :-
	get_elmt_map(MapID, X, Y, Elmt),
	format(' ~w ',[Elmt]), !.

print_grid(_, X, _) :-
	X < 1,
	write('BBB'),!.

print_grid(_, X, _) :-
	X > 10,
	write('BBB'),!.

print_grid(_, _, Y) :-
	Y < 1,
	write('BBB'),!.	

print_grid(_, _, Y) :-
	Y > 10,
	write('BBB'),!.	