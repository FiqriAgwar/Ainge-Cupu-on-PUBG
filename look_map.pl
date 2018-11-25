look :- 
	position(player, X, Y),
	print_look_area(X, Y).

print_look_area(X, Y) :-
    look_grid(X, Y, -1, -1), look_grid(X, Y, 0, -1), look_grid(X, Y, 1, -1), nl, nl,
    look_grid(X, Y, -1, 0), look_grid(X, Y, 0, 0), look_grid(X, Y, 1, 0), nl, nl,
    look_grid(X, Y, -1, 1), look_grid(X, Y, 0, 1), look_grid(X, Y, 1, 1), nl, nl.

look_grid(X, Y, DeltaX, DeltaY) :-
    NewX is X+DeltaX,
    NewY is Y+DeltaY,
    print_grid(NewX, NewY).