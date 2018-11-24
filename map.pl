
generatepeta(List, N, [Head | Tail]) :-
	append(Head, Other, List),
	length(Start,N).
	gen(Other,N, Tail).

map :- generatepeta(listpeta, 10, peta), print(peta).

ubah_posisi(ObjectID, X, Y, deltaX, deltaY) :-
	retract(position(ObjectID,X,Y)),
	NewX is X + deltaX, NewY is Y + deltaY,
	asserta(position(ObjectID, NewX, NewY).
