init_map :-
	asserta(map_matrix([
		"XXXXXXXXXX",
		"X--------X",
		"X--------X",
		"X--------X",
		"X--------X",
		"X--------X",
		"X--------X",
		"X--------X",
		"X--------X",
		"X--------X",
		"XXXXXXXXXX"])).

get_elmt_map(Row, Col, Res) :- map_matrix(X), get_elmt_matrix(X, Row, Col, Res), !.

get_elmt_matrix([Head|_], Row, Col, Res) :- Row == 1, get_elmt_list(Head, Col, Res).
get_elmt_matrix([_|Tail], Row, Col, Res) :- NewRow is Row-1, get_elmt_matrix(Tail, NewRow, Col, Res).

get_elmt_list([Head|_], Idx, Res) :- Idx == 1, char_code(Res, Head).	
get_elmt_list([_|Tail], Idx, Res) :- NewIdx is Idx-1, get_elmt_list(Tail, NewIdx, Res).

print_map_matrix(Map) :- 

ubah_posisi(ObjectID, X, Y, deltaX, deltaY) :-
	retract(position(ObjectID, X, Y)),
	NewX is X + deltaX, NewY is Y + deltaY,
	asserta(position(ObjectID, NewX, NewY).
