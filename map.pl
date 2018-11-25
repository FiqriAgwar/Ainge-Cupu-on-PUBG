:- dynamic current_map_id/1.

map_matrix(
		1,
		[
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
			"XXXXXXXXXX"
		]).

map_matrix(
		2,
		[
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XX-------X",
			"XX-------X",
			"XX-------X",
			"XX-------X",
			"XX-------X",
			"XX-------X",
			"XX-------X",
			"XXXXXXXXXX",
			"XXXXXXXXXX"
		]).

map_matrix(
		3,
		[
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XX-------X",
			"XX-------X",
			"XX-------X",
			"XX-------X",
			"XX-------X",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX"
		]).

map_matrix(
		4,
		[
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XX------XX",
			"XX------XX",
			"XX------XX",
			"XX------XX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX"
		]).

map_matrix(
		5,
		[
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXX----XXX",
			"XXX----XXX",
			"XXX----XXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX"
		]).

map_matrix(
		5,
		[
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXX---XXX",
			"XXXX---XXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX",
			"XXXXXXXXXX"
		]).

init_map :-
	asserta(map_matrix(
		1,
		[
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
			"XXXXXXXXXX"
		])),
	asserta(current_map_id(1)).


get_elmt_map(MapID, Row, Col, Res) :- map_matrix(MapID, X), get_elmt_matrix(X, Row, Col, Res), !.

get_elmt_matrix([Head|_], Row, Col, Res) :- Row == 1, get_elmt_list(Head, Col, Res).
get_elmt_matrix([_|Tail], Row, Col, Res) :- NewRow is Row-1, get_elmt_matrix(Tail, NewRow, Col, Res).

get_elmt_list([Head|_], Idx, Res) :- Idx == 1, char_code(Res, Head).	
get_elmt_list([_|Tail], Idx, Res) :- NewIdx is Idx-1, get_elmt_list(Tail, NewIdx, Res).

print_map(MapID) :-
	map_matrix(MapID, TheMap),
	print_matrix(TheMap).

print_matrix([]) :- !.
print_matrix([Head|Tail]) :- print_list(Head), nl, print_matrix(Tail).

print_list([]) :- !.
print_list([Head|Tail]) :- write(Head), print_list(Tail).

