listObjCount([], Count) :- Count is 0.
listObjCount([Head|Tail], Count) :- 
	listObjCount(Tail, Temp),
	Count is Temp+1.
	
isInvFull :-
	inventory(player, MaxCap, ListObjek, BanyakObjek),
	listObjCount(ListObjek, ListCount),
	ListCount < MaxCap.
