/*SELURUH BENTUK COMMAND SELAIN URUSAN PETA*/

/*ATTACK*/
attack :-
    position(player, X, Y).
    check_enemy(EnemyID, X, Y), 
    enemy_attack(EnemyID, Damage),
    decrease_hp_player(player, Damage).
    decrease_enemy(EnemyID, JumlahEnemy), !.
attack :- 
    no_attack, fail.
#steps by steps : 
#1. mengecek posisi player
#2. mengecek ada enemy di X dan Y yang sama dengan player
#3. memberikan damage kepada player
#4. melakukan attack auto-death kepada enemy
#5. menghilangkan  

/*MOVEMENT*/
n :-
    move(n).
	#position(player, X, Y), ubah_posisi(player,X,Y,0,1).
s :-
    move(s).    
	#position(player, X, Y), ubah_posisi(player,X,Y,0,-1).
e :-
    move(e).    
	#position(player, X, Y), ubah_posisi(player,X,Y,1,0).
w :-
    move(w).    
	#position(player, X, Y), ubah_posisi(player,X,Y,-1,0).

/*TAKE*/
take(Object) :-
    position(player,X,Y),
    position(Object,X,Y),
	take_object(Object),
    write('You took ~w', [Object]),!.

take(_) :-
    write('Nothing here'), nl,
    fail.

take_object(Object) :-
    isInvFull,
    position(player,X,Y),
    retract(position(Object,X,Y)),
	retract(inventory(MaxCap, ListObjek, BanyakObjek)),
	append(Object, ListObjek),
	append(Jumlah, BanyakObjek),
	assert(inventory(MaxCap, ListObjek, BanyakObjek)).
    
#steps by steps:
#1. mengecek posisi player
#2. mengecek ada objek di X dan Y yang sama
#3. jika ada, melakukan penghapusan benda di posisi tersebut
#4. lalu ditambahkan ke inventory, jika masih ada ruang
#5. jika tidak ada, keluarkan pesan

/*DROP*/
drop(Object) :-
    position(player,X,Y),
    drop_object(Object),
    write('You dropped ~w', [Object]),!.

drop(_) :-
    write('You have nothing about this object'),nl,
    fail.

drop_object(Object) :-
    position(player,X,Y),
    retract(inventory(MaxCap, ListObjek, BanyakObjek)),
    delete_object(Object,ListObjek,ListObjekBaru),
    count_object(ListObjekBaru, BanyakObjekBaru),
    asserta(inventory(MaxCap, ListObjekBaru, BanyakObjekBaru)).

delete_object(_,[],[]).
delete_object(Object, [Object|Remain], Remain) :- !.
delete_object(Object, [First|Remain], [First|NewList]) :- 
    delete_object(Object, Remain, NewList).

/*