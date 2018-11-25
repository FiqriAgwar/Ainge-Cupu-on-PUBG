% contoh pemain(Health, Armor).
%player_stat(100, 0).

init_godmode :-
    asserta(position(asd, 5, 5)),
    asserta(enemy(asd)),
    asserta(equipped_weapon(asd, 'UMP9', 1)),
    asserta(equipped_weapon(player, 'UMP9', 4)),
    retract(equipped_weapon(player, none, 0)),
    add_to_inventory(player, 'First Aid Kit').

init_player :-
    asserta(player_stat(100, 0)),
    asserta(equipped_weapon(player, none, 0)),
    asserta(inventory(player, 5, [])),
    asserta(position(player, 5, 5)).

print_player_info :-
    player_stat(Health, Armor),
    equipped_weapon(player, WeaponName, _),
    format("Health: ~w~nArmor: ~w~nWeapon: ~w~n", [Health, Armor, WeaponName]),
    print_player_inventory.


change_player_stat(HealthMod, ArmorMod) :-
    retract(player_stat(Health, Armor)),
    NewHealth is Health+HealthMod,
    NewArmor is Armor+ArmorMod,
    asserta(player_stat(NewHealth, NewArmor)).

damage_to_player(Damage) :-
    player_stat(_, Armor),
    Armor >= Damage,
    MinusArmor is 0-Damage,    
    change_player_stat(0, MinusArmor).

damage_to_player(Damage) :-
    player_stat(_, Armor),
    Armor < Damage,
    MinusArmor is 0-Armor,
    MinusHealth is Armor-Damage,
    change_player_stat(MinusHealth, MinusArmor).