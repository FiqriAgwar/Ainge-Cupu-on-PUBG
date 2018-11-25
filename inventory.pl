# contoh inventory(InventoryID, MaxCap, [ListObjek], [BanyakObjek]). -> ListObjek[i] koresponden dengan BanyakObjek[i]
#inventory(player, 5, [], []).
#inventory(enemy1, 3, [], []).

list_obj_count([], Count) :- Count is 0.
list_obj_count([Head|Tail], Count) :- 
	list_obj_count(Tail, Temp),
	Count is Temp+1.
	
is_inv_full :-
	inventory(player, MaxCap, ListObjek, BanyakObjek),
	list_obj_count(ListObjek, ListCount),
	ListCount < MaxCap.
