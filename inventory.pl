% contoh inventory(InventoryID, MaxCap, [ListObjek], [BanyakObjek]).
%inventory(player, 5, []).
%inventory(enemy1, 3, []).

list_obj_count([], Count) :- Count is 0, !.
list_obj_count([_|Tail], Count) :- 
	list_obj_count(Tail, Temp),
	Count is Temp+1.
	
is_inv_exist :-
	inventory(player, MaxCap, ListObjek),
	list_obj_count(ListObjek, ListCount),
	ListCount < MaxCap.

add_to_inventory(InventoryID, Object) :-
	retract(inventory(InventoryID, MaxCap, ObjectList)),
    append(ObjectList, [Object], NewObjectList),
    asserta(inventory(InventoryID, MaxCap, NewObjectList)).

delete_from_inventory(InventoryID, Object) :-
    retract(inventory(InventoryID, MaxCap, ObjectList)),
    subtract(ObjectList, [Object], NewObjectList),
    asserta(inventory(InventoryID, MaxCap, NewObjectList)).
