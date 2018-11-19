:- dynamic pemain/3
:- dynamic inventori/3


#insiasi pemain(Health, Armor, Weapon).
pemain(100, 0, none).

#inisiasi inventory(MaxCap, [ListObjek], [BanyakObjek]). -> ListObjek[i] koresponden dengan BanyakObjek[i]
inventory(5,[],[]).

#fakta weapon(Nama, Damage, JenisAmmo, MaxAmmo)
weapon(ak47, 35, kuning, 5).
weapon(m4a6, 30, hijau, 5).
weapon(ump, 25, jingga, 8).
weapon(s12k, 45, merah, 3).

#fakta medicine(Nama, HPrestored)
medicine(medkit, 100).
medicine(firstaid, 75).
medicine(bandage, 15).

#fakta ammo(Nama, Jumlah, LokasiX, LokasiY) ->khusus untuk drop
#di random

#inisiasi musuh(Senjata, LokasiX, LokasiY).
#di random

#beberapa rule dan fakta tambahan

#command
start() :- print("Welcome to the battlefield!
You have been chosen as one of the lucky contestants. Be the last man standing
and you will be remembered as one of the victors.
Available commands:
start. -- start the game!
help. -- show available commands
quit. -- quit the game
look. -- look around you
n. s. e. w. -- move
map. -- look at the map and detect enemies
take(Object). -- pick up an object
drop(Object). -- drop an object
use(Object). -- use an object
attack. -- attack enemy that crosses your path
status. -- show your status
save(Filename). -- save your game
load(Filename). -- load previously saved game"), nl,

print("Legends:
W = weapon
A = armor
M = medicine
O = ammo
P = player
E = enemy
- = accessible
X = inaccessible").

status :- pemain(X,Y,Z), print("Health : ", X), nl.
status :- pemain(X,Y,Z), print("Armor : ", Y), nl.
status :- pemain(X,Y,Z), print("Inventory : ", Z), nl.

generatepeta(List, N, [Head | Tail]) :-
	append(Head, Other, List),
	length(Start,N).
	gen(Other,N, Tail).

map :- generatepeta(listpeta, 10, peta), print(peta).