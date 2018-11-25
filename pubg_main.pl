# pemain(Health, Armor).
:- dynamic player_stat/2.
# inventory(InventoryID, MaxCap, [ListObjek], [BanyakObjek]). -> ListObjek[i] koresponden dengan BanyakObjek[i]
:- dynamic inventory/4.
# position(ObjectID, X, Y).
:- dynamic position/3.
# musuh(EnemyID, Senjata, InventoryID).
:- dynamic enemy/3.
# equipped_weapon(WielderID, WeaponName, AmmoCount).
:- dynamic equipped_weapon/3.
# map_matrix([[Line1],[Line2]..[Line3]])
:- dynamic map_matrix/1.

#command
start :- 
	print_opening_message,
	print_help
	init_player,
	init_map,
	init_items,
	init_enemies.

