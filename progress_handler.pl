save(Filename) :-
    open(Filename, write, Stream),

    player_stat(Health, Armor),
    equipped_weapon(player, AmmoLeft, 0),
    inventory(MaxCap, ListObjek, BanyakObjek),

    write(Stream, Health), write(Stream,'.'), nl(Stream),
    write(Stream, Armor), write(Stream,'.'), nl(Stream),
    write(Stream, AmmoLeft), write(Stream,'.'), nl(Stream),
    
    forall(position(player, X, Y), (
        write(Stream, X), write(Stream,'.'), nl(Stream),
        write(Stream, Y), write(Stream,'.'), nl(Stream),
    )),

    forall(position(enemy, X, Y), (
        write(Stream, X), write(Stream,'.'), nl(Stream),
        write(Stream, Y), write(Stream,'.'), nl(Stream),
    )),

    
    forall(position(object, X, Y), (
        write(Stream, X), write(Stream,'.'), nl(Stream),
        write(Stream, Y), write(Stream,'.'), nl(Stream),
    )),