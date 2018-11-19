:- dynamic pemain/3
:- dynamic inventori/3
:- dynamic posisi/3

#insiasi pemain(Health, Armor, Weapon).
pemain(100, 0, none).

#inisiasi inventory(MaxCap, [ListObjek], [BanyakObjek]). -> ListObjek[i] koresponden dengan BanyakObjek[i]
inventory(5,[],[]).

#fakta weapon(Index, Nama, Damage, JenisAmmo, MaxAmmo)
weapon(1, ak47, 35, kuning, 5).
weapon(2, m4a6, 30, hijau, 5).
weapon(3, ump, 25, jingga, 8).
weapon(4, s12k, 45, merah, 3).

#fakta medicine(Nama, HPrestored)
medicine(medkit, 100).
medicine(firstaid, 75).
medicine(bandage, 15).

#fakta ammo(Nama, Jumlah, LokasiX, LokasiY) ->khusus untuk drop
#di random

#inisiasi musuh(Senjata, Damage, LokasiX, LokasiY).
#di random
musuh(Senjata, Damage, X,Y) :- posisi(X,Y,enemy), random(1,4,N), weapon(N, Senjata, Damage, _, _).

#beberapa rule dan fakta tambahan

#command
start :- banner.
	print("Welcome to the battlefield!"), nl,
	print("You have been chosen as one of the lucky contestants. Be the last man standing"), nl,
	print("and you will be remembered as one of the victors."), nl,
	help.

help :-
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

status :-
	pemain(X,Y,Z),
	print("Health : ", X), nl,
	print("Armor : ", Y), nl,
	print("Inventory : ", Z), nl.



generatepeta(List, N, [Head | Tail]) :-
	append(Head, Other, List),
	length(Start,N).
	gen(Other,N, Tail).

map :- generatepeta(listpeta, 10, peta), print(peta).

look :- 
	posisi(X,Y,pemain),
	A is X-1, B is Y-1, posisi(A,B,Tipe), print(Tipe).
	A is X-1, B is Y  , posisi(A,B,Tipe), print(Tipe).
	A is X-1, B is Y+1, posisi(A,B,Tipe), print(Tipe).
	A is X  , B is Y-1, posisi(A,B,Tipe), print(Tipe).
	A is X  , B is Y  , posisi(A,B,Tipe), print(Tipe).
	A is X  , B is Y+1, posisi(A,B,Tipe), print(Tipe).
	A is X+1, B is Y-1, posisi(A,B,Tipe), print(Tipe).
	A is X+1, B is Y  , posisi(A,B,Tipe), print(Tipe).
	A is X+1, B is Y+1, posisi(A,B,Tipe), print(Tipe).

n :-
	posisi(X, Y, player), retract(posisi(X, Y, player)), 
	Temp is Y-1, assert(posisi(X, Temp, player)).
s :-
	posisi(X, Y, player), retract(posisi(X, Y, player)), 
	Temp is Y+1, assert(posisi(X, Temp, player)).
e :-
	posisi(X, Y, player), retract(posisi(X, Y, player)), 
	Temp is X+1, assert(posisi(Temp, Y, player)).
w :-
	posisi(X, Y, player), retract(posisi(X, Y, player)), 
	Temp is X-1, assert(posisi(Temp, Y, player)).

listObjCount([], Count) :- Count is 0.
listObjCount([Head|Tail], Count) :- 
	listObjCount(Tail, Temp),
	Count is Temp+1.
	
isInvFull :-
	inventory(MaxCap, ListObjek, BanyakObjek).
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
