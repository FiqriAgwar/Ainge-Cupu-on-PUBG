# pemain(Health, Armor).
:- dynamic player_stat/2.
# inventory(InventoryID, MaxCap, [ListObjek], [BanyakObjek]). -> ListObjek[i] koresponden dengan BanyakObjek[i]
:- dynamic inventory/4.
# position(ObjectID, X, Y).
:- dynamic position/3.
# musuh(EnemyID, Senjata, InventoryID).
:- dynamic enemy/3.
# equipped_weapon(WielderID, WeaponID, AmmoCount).
:- dynamic equipped_weapon/3.

# contoh pemain(Health, Armor).
#player_stat(100, 0).

# contoh inventory(InventoryID, MaxCap, [ListObjek], [BanyakObjek]). -> ListObjek[i] koresponden dengan BanyakObjek[i]
#inventory(player, 5, [], []).
#inventory(enemy1, 3, [], []).

# contoh position(ObjectID, X, Y).
#position(player, 4, 5).
#position(player, 4, 5).

# fakta weapon(WeaponID, Damage, JenisAmmo, MaxAmmo)
weapon(ak47, 35, kuning, 5).
weapon(m4a6, 30, hijau, 5).
weapon(ump, 25, jingga, 8).
weapon(s12k, 45, merah, 3).

# fakta medicine(Nama, HPrestored)
medicine(medkit, 100).
medicine(firstaid, 75).
medicine(bandage, 15).

# fakta ammo(Nama, JumlahPerMagazine).
ammo(kuning, 5).
ammo(hijau, 5).
ammo(jingga, 8).
ammo(merah, 3).

# contoh musuh(EnemyID).
#enemy(enemy1).

#beberapa rule dan fakta tambahan

#command
start :- 
	opening_message.
	print_help.

opening_message :-
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
	player_stat(X,Y,Z),
	print("Health : ", X), nl,
	print("Armor : ", Y), nl,
	print("Inventory : ", Z), nl.


generatepeta(List, N, [Head | Tail]) :-
	append(Head, Other, List),
	length(Start,N).
	gen(Other,N, Tail).

map :- generatepeta(listpeta, 10, peta), print(peta).

look :- 
	position(X,Y,pemain),
	A is X-1, B is Y-1, position(A,B,Tipe), print(Tipe).
	A is X-1, B is Y  , position(A,B,Tipe), print(Tipe).
	A is X-1, B is Y+1, position(A,B,Tipe), print(Tipe).
	A is X  , B is Y-1, position(A,B,Tipe), print(Tipe).
	A is X  , B is Y  , position(A,B,Tipe), print(Tipe).
	A is X  , B is Y+1, position(A,B,Tipe), print(Tipe).
	A is X+1, B is Y-1, position(A,B,Tipe), print(Tipe).
	A is X+1, B is Y  , position(A,B,Tipe), print(Tipe).
	A is X+1, B is Y+1, position(A,B,Tipe), print(Tipe).

ubah_posisi(ObjectID, X, Y, deltaX, deltaY) :-
	retract(position(ObjectID,X,Y)),
	NewX is X + deltaX, NewY is Y + deltaY,
	asserta(position(ObjectID, NewX, NewY).
	
n :-
	position(player, X, Y), ubah_posisi(player,X,Y,0,1).
s :-
	position(player, X, Y), ubah_posisi(player,X,Y,0,-1).
e :-
	position(player, X, Y), ubah_posisi(player,X,Y,1,0).
w :-
	position(player, X, Y), ubah_posisi(player,X,Y,-1,0).

listObjCount([], Count) :- Count is 0.
listObjCount([Head|Tail], Count) :- 
	listObjCount(Tail, Temp),
	Count is Temp+1.
	
isInvFull :-
	inventory(player, MaxCap, ListObjek, BanyakObjek),
	listObjCount(ListObjek, ListCount),
	ListCount < MaxCap.

take(X) :-
	(weapon(_, X, _, _, _); medicine(X, _)),
	isInvFull,
	retract(inventory(MaxCap, ListObjek, BanyakObjek)),
	append(X, ListObjek),
	append(Jumlah, BanyakObjek),
	assert(inventory(MaxCap, ListObjek, BanyakObjek)).



quit :- stop.
