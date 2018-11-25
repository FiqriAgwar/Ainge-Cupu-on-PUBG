init_non :-
    asserta(position(non,1,1)),
    asserta(position(non,1,2)),
    asserta(position(non,1,3)),
    asserta(position(non,1,4)),
    asserta(position(non,1,5)),
    asserta(position(non,1,6)),
    asserta(position(non,1,7)),
    asserta(position(non,1,8)),
    asserta(position(non,1,9)),
    asserta(position(non,1,10)),
    asserta(position(non,2,1)),
    asserta(position(non,3,1)),
    asserta(position(non,4,1)),
    asserta(position(non,5,1)),
    asserta(position(non,6,1)),
    asserta(position(non,7,1)),
    asserta(position(non,8,1)),
    asserta(position(non,9,1)),
    asserta(position(non,10,1)),
    asserta(position(non,10,2)),
    asserta(position(non,10,3)),
    asserta(position(non,10,4)),
    asserta(position(non,10,5)),
    asserta(position(non,10,6)),
    asserta(position(non,10,7)),
    asserta(position(non,10,8)),
    asserta(position(non,10,9)),
    asserta(position(non,2,10)),
    asserta(position(non,3,10)),
    asserta(position(non,4,10)),
    asserta(position(non,5,10)),
    asserta(position(non,6,10)),
    asserta(position(non,7,10)),
    asserta(position(non,8,10)),
    asserta(position(non,9,10)),
    asserta(position(non,10,10)).

print_map1(ID, _, _) :-
    ID == non,
    write(' X '), !.

print_map1(ID, _, _) :-
    ID == player,
    write(' P '), !.

print_map1(_, _, _) :-
    write('   ').

print_map2(11,11) :- !.
print_map2(X,Y) :-
    Y == 11,
    Xi is X+1,
    print_map2(Xi,Y),!.
print_map2(X,Y) :-
    X == 11,
    Xi is 1,
    Yi is Y+1,
    print_map2(Xi,Yi),!.

print_map2(X,Y) :-
    position(ID,X,Y),
    print_map1(ID,X,Y),
    Xi is X+1,
    print_map2(Xi,Y),!.