% pemain(Health, Armor).
:- dynamic player_stat/2.
% inventory(InventoryID, MaxCap, [ListObjek]).
:- dynamic inventory/3.
% position(ObjectID, X, Y).
:- dynamic position/3.
% enemy(EnemyID).
:- dynamic enemy/1.
% equipped_weapon(WielderID, WeaponName, AmmoCount).
:- dynamic equipped_weapon/3.
% map_matrix(MapID, [[Line1],[Line2]..[Line3]])
%:- dynamic map_matrix/2.
% jumlah_enemy(10).
:- dynamic jumlah_enemy/1.

%command
start :- g_read(started, X), X = 1, write('Game has already started'), nl, fail, !.
start :- 
	g_read(started, X), X = 0, !,
	g_assign(started, 1),
	print_opening_message,
	print_help, nl,
	init_player,
	init_non,
	init_items,
	init_enemies,
	init_godmode,
	game_loop.

game_loop :-
	write('> '),
	read(Input),
	call(Input), nl,
	turn_ticks(Input),
	finished(Input).

turn_ticks(help) :- !.
turn_ticks(status) :- !.
turn_ticks(look) :- !.
turn_ticks(map) :- !.
%turn_ticks(load) :- !.
%turn_ticks(save) :- !.
turn_ticks(_) :- 
	random_move,
	enemy_attack,
	!.

finished(quit) :- !.
finished(_) :- game_loop.