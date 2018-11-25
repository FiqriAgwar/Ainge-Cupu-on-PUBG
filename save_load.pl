/* SAVE STATE */
save:-
	nl, write('Write the name of your file?'), nl,
	write('> '), read(File),
	atom_concat(File, '.txt', Filetxt),
	open(Filetxt, write, Stream),
	save_all_fact(Stream),
	close(Stream), 	write('Your file was saved !'), nl.

/* save all facts to external file */
save_all_fact(Stream) :-
	save_location(Stream).
save_all_fact(Stream) :-
	save_player(Stream).
save_all_fact(Stream) :-
	save_enemies(Stream).
save_all_fact(_) :- !.

save_location(Stream) :-
	location(X,Y,Item),
	write(Stream, location(X,Y,Item)), write(Stream, '.'), nl(Stream),
	fail.

save_enemies(Stream) :-
 	enemy(EnemyID, X, Y, Health, Atk),
	write(Stream, enemy(EnemyID, X, Y, Health, Atk)), write(Stream, '.'), nl(Stream),
	fail.

save_player(Stream) :-
	player(X,Y,Health,Hunger,Thirst,Weapon,ItemList),
	write(Stream, player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)), write(Stream, '.'), nl(Stream),
	fail.

/* LOAD STATE */
load :-
	nl, write('Please input the file load!'), nl,
	write('>'), read(File),
	atom_concat(File, '.txt', Filetxt),
	load_all_fact(Filetxt).

load_all_fact(Filetxt):-
	retractall(enemy(_,_,_,_,_)),
	retractall(player(_,_,_,_,_,_,_)),
	retractall(location(_,_,_)),
	open(Filetxt, read, Stream),
	repeat,
		read(Stream, In),
		asserta(In),
	at_end_of_stream(Stream),
	close(Stream),
	nl, write('Your File is loaded!'), nl, !.
load_all_fact(_):-
	nl, write('Your input is wrong!'), nl, fail.
