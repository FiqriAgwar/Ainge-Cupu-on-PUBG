print_look_area(MapID, X, Y) :-
    look_grid(MapID, X, Y, -1, -1), look_grid(MapID, X, Y, 0, -1), look_grid(MapID, X, Y, 1, -1), nl, nl,
    look_grid(MapID, X, Y, -1, 0), look_grid(MapID, X, Y, 0, 0), look_grid(MapID, X, Y, 1, 0), nl, nl,
    look_grid(MapID, X, Y, -1, 1), look_grid(MapID, X, Y, 0, 1), look_grid(MapID, X, Y, 1, 1), nl, nl.

look_grid(MapID, X, Y, DeltaX, DeltaY) :-
    NewX is X+DeltaX,
    NewY is Y+DeltaY,
    print_grid(MapID, NewX, NewY).