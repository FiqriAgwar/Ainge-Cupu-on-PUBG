/*SELURUH BENTUK COMMAND SELAIN URUSAN PETA*/

has_started:- g_read(started,0), write('Game hasn\'t started yet!'),nl,!, fail.
has_started:- g_read(started,1),!.

/*ATTACK*/
attack :-
    has_started,
    equipped_weapon(player,_,0),
    write('No ammo'),nl,!.

attack :-
    has_started,
    position(player, X, Y), !,
    position(EnemyID, X, Y),
    enemy(EnemyID),
    %check_enemy(X, Y), 
    enemy_attack,!,
    decrease_enemy(EnemyID), 
    decrease_ammo(player, _, _), 
    write('Enemy down.'),nl,!.
    
attack :-
    has_started,
    position(player, X, Y),
    position(EnemyID, X, Y),
    \+ enemy(EnemyID),
    no_attack, !.

decrease_ammo(Id,WeaponName,AmmoCount) :-
    retract(equipped_weapon(Id, WeaponName, AmmoCount)),
    NewAmmoCount is AmmoCount-1,
    asserta(equipped_weapon(Id, WeaponName, NewAmmoCount)).

no_attack :-
    write('Attack failed!'), nl.
/*
steps by steps : 
1. mengecek posisi player
2. mengecek ada enemy di X dan Y yang sama dengan player
3. memberikan damage kepada player
4. melakukan attack auto-death kepada enemy
5. menghilangkan  
*/

/*MOVEMENT*/
n :-
    has_started,
    position(player, X, Y),
    change_position(player,X,Y,0,-1).
s :-
    has_started,
    position(player, X, Y),
    change_position(player,X,Y,0,1).
e :-
    has_started,
	position(player, X, Y),
    change_position(player,X,Y,1,0).
w :-
    has_started,
    position(player, X, Y),
    change_position(player,X,Y,-1,0).

change_position(ObjectID, X, Y, DeltaX, DeltaY) :-
	retract(position(ObjectID, X, Y)),
	NewX is X + DeltaX, NewY is Y + DeltaY,
	asserta(position(ObjectID, NewX, NewY)).

/*TAKE*/
take(Object) :-
    has_started,
    position(player,X,Y),
    position(Object,X,Y),
    is_inv_exist,
    take_object(Object),
    format('You took ~w', [Object]),!.

take(_) :-
    has_started,
    write('Nothing here'), nl,
    fail.

take_object(Object) :-
    is_inv_exist,
    position(player, X, Y),
    position(Object, X, Y),
    add_to_inventory(player, Object).

/*
steps by steps:
1. mengecek posisi player
2. mengecek ada objek di X dan Y yang sama
3. jika ada, melakukan penghapusan benda di posisi tersebut
4. lalu ditambahkan ke inventory, jika masih ada ruang
5. jika tidak ada, keluarkan pesan
*/

/*DROP*/
drop(Object) :-
    has_started,
    inventory(player, _, ListObject),
    member(Object, ListObject),
    position(player,X,Y),
    drop_object(Object,X,Y),
    format('You dropped ~w', [Object]), !.

drop(_) :-
    has_started,
    write('You have nothing about this object'),nl,
    fail.

drop_object(Object,X,Y) :-
    position(player,X,Y),
    asserta(position(Object,X,Y)),
    delete_from_inventory(player, Object).

/* delete_object(ObjectName, OldList, NewList). */
delete_object(_,[],[]).
delete_object(Object, [Object|Remain], Remain) :- !.
delete_object(Object, [First|Remain], [First|NewList]) :- 
    delete_object(Object, Remain, NewList).

/*USE*/
use(Object) :-
    has_started,
    inventory(player, _, ListObject),
    member(Object, ListObject),
    weapon(Object,_,_,AmmoCount),
    equipped_weapon(player, Object, AmmoCount),
    delete_from_inventory(player, Object),
    format("You equipped ~w", [Object]),
    !.

use(Object) :-
    has_started,
    inventory(player, _, ListObject),
    member(Object, ListObject),
    medicine(Object,Health),
    change_player_stat(Health, 0),
    delete_from_inventory(player, Object),
    format("You used ~w", [Object]),
    !.

use(Object) :-
    has_started,
    inventory(player, _, ListObject),
    member(Object, ListObject),
    armor(Object,Armor),
    change_player_stat(0, Armor),
    delete_from_inventory(player, Object),
    format("You wore ~w", [Object]),
    !.
use(_) :-
    has_started,
    write('You have nothing about this item.'),nl.

help :-
    has_started,
    print_help.

status :- 
    has_started,
    print_player_stat.

look :- 
    has_started.
	%position(player, X, Y).
	%print_look_area(MapID, X, Y).

map :-
    has_started,
    print_map2(1,1).

quit :- stop.
