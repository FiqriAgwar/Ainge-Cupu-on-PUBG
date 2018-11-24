# contoh inventory(InventoryID, MaxCap, [ListObjek], [BanyakObjek]). -> ListObjek[i] koresponden dengan BanyakObjek[i]
#inventory(player, 5, [], []).
#inventory(enemy1, 3, [], []).

# fakta weapon(WeaponName, Damage, AmmoType, MaxAmmo)
weapon('UMP9', 25, '9mm Ammo', 8).
weapon('M16A4', 30, '5.56mm Ammo', 5).
weapon('AKM', 35, '7.62mm Ammo', 5).
weapon('S12K', 45, '12 Gauge Ammo', 3).

# fakta medicine(MedicineName, HPrestored)
medicine('Bandage', 15).
medicine('First Aid Kit', 75).
medicine('Med Kit', 100).

# fakta ammo(Nama, JumlahPerMagazine).
ammo('9mm Ammo', 8).
ammo('5.56mm Ammo', 5).
ammo('7.62mm Ammo', 5).
ammo('12 Gauge Ammo', 3).

# fakta id(ID, NamaItem).
id(1, 'UMP9').
id(2, 'M16A4').
id(3, 'AKM').
id(4, 'S12K').
id(5, 'Bandage').
id(6, 'First Aid Kit').
id(7, 'Med Kit').
id(8, '9mm Ammo').
id(9, '5.56mm Ammo').
id(10, '7.62mm Ammo').
id(11, '12 Gauge Ammo').