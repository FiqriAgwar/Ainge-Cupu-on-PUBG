% contoh musuh(EnemyID).
% enemy(1).

init_enemies :-
    random(20,30,X),
    asserta(jumlah_enemy(X)),
    input_enemy(X).

input_enemy(0) :- !.
input_enemy(X) :-
    random(1,10,Absis),
    random(1,10,Ordinat),
    random(1,4,SenjataMusuh),
    id(SenjataMusuh,ItemMusuh),
    random(1,5,AmmoMusuh),
    asserta(equipped_weapon(X,ItemMusuh,AmmoMusuh)),
    asserta(position(X,Absis,Ordinat)),
    asserta(enemy(X)),
    Y is X-1,
    input_enemy(Y).


check_enemy(X, Y) :-
    position(EnemyId, X, Y),
    enemy(EnemyId).

check_enemy(X, Y) :-
    position(EnemyId, X, Y),
    \+ enemy(EnemyId),
    write('No Enemy! '),
    !, fail.

enemy_attack:-
    position(player, X, Y), !,
    position(EnemyID, X, Y),
    enemy(EnemyID),
    equipped_weapon(EnemyID, EnemyWeapon, EnemyAmmo),
    decrease_ammo(EnemyID, EnemyWeapon, EnemyAmmo),
    weapon(EnemyWeapon, Damage, _, _),
    damage_to_player(Damage).

decrease_enemy(EnemyID):- 
    retract(jumlah_enemy(JumlahEnemy)),
    JumlahNewEnemy is JumlahEnemy-1, !,
    asserta(jumlah_enemy(JumlahNewEnemy)),
    retract(enemy(EnemyID)),
    retract(position(EnemyID, _,_)), !.

random_move :-
    position(EnemyID,X,Y), enemy(EnemyID), position(player,X,Y).

random_move :- 
    position(EnemyID,_,_), enemy(EnemyID), random(1,8,MoveId), move_to(EnemyID, MoveId).    

move_to(Id,1) :-
    retract(position(Id,X,Y)),
    NewX is X-1, NewY is Y-1,
    asserta(position(Id,NewX,NewY)).
move_to(Id,2) :-
    retract(position(Id,X,Y)),
    NewX is X , NewY is Y-1,
    asserta(position(Id,NewX,NewY)).
move_to(Id,3) :-
    retract(position(Id,X,Y)),
    NewX is X+1, NewY is Y-1,
    asserta(position(Id,NewX,NewY)).
move_to(Id,4) :-
    retract(position(Id,X,Y)),
    NewX is X-1, NewY is Y,
    asserta(position(Id,NewX,NewY)).
move_to(Id,5) :-
    retract(position(Id,X,Y)),
    NewX is X+1, NewY is Y,
    asserta(position(Id,NewX,NewY)).
move_to(Id,6) :-
    retract(position(Id,X,Y)),
    NewX is X-1, NewY is Y+1,
    asserta(position(Id,NewX,NewY)).
move_to(Id,7) :-
    retract(position(Id,X,Y)),
    NewX is X, NewY is Y+1,
    asserta(position(Id,NewX,NewY)).
move_to(Id,8) :-
    retract(position(Id,X,Y)),
    NewX is X+1, NewY is Y+1,
    asserta(position(Id,NewX,NewY)).    

    
