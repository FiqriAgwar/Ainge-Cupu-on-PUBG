# contoh musuh(EnemyID).
#enemy(enemy1).

check_enemy(EnemyId, X, Y) :-
    position(EnemyId, X, Y),
    enemy(EnemyId),!.

check_enemy(_, X, Y) :-
    write('No Enemy'), nl,fail.

