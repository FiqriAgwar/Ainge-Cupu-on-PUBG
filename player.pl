# contoh pemain(Health, Armor).
#player_stat(100, 0).

init_player :-
    asserta(player_stat(100, 0)),
    asserta(equipped_weapon(player, none, 0)).

print_player_info :-
    write('')