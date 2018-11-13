:- dynamic pemain/3
:- dynamic inventori/3


#insiasi pemain(Health, Armor, Weapon).
pemain(100, 0, none).

#inisiasi inventory(MaxCap, [ListObjek], [BanyakObjek]). -> ListObjek[i] koresponden dengan BanyakObjek[i]
inventory(5,[],[]).

#fakta weapon(Nama, Damage, JenisAmmo, MaxAmmo)
weapon(ak47, 35, kuning, 5).
weapon(m4a6, 30, hijau, 5).
weapon(ump, 25, jingga, 8).
weapon(s12k, 45, merah, 3).

#fakta medicine(Nama, HPrestored)
medicine(medkit, 100).
medicine(firstaid, 75).
medicine(bandage, 15).

#fakta ammo(Nama, Jumlah, LokasiX, LokasiY) ->khusus untuk drop
#di random

#inisiasi musuh(Senjata, LokasiX, LokasiY).
#di random

#beberapa rule dan fakta tambahan