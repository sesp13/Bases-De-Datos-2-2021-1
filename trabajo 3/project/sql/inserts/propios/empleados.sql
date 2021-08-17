INSERT INTO empleado SELECT 101,  'Simon Cano', REF(c), vent_varray() FROM ciudad c WHERE c.cod = 1;
INSERT INTO empleado SELECT 102,  'Pepito', REF(c), vent_varray() FROM ciudad c WHERE c.cod = 1;
INSERT INTO empleado SELECT 103,  'Juanita', REF(c), vent_varray() FROM ciudad c WHERE c.cod = 2;
INSERT INTO empleado SELECT 104,  'Calo', REF(c), vent_varray() FROM ciudad c WHERE c.cod = 2;
INSERT INTO empleado SELECT 105,  'Hoox', REF(c), vent_varray() FROM ciudad c WHERE c.cod = 3;
INSERT INTO empleado SELECT 106,  'Simona', REF(c), vent_varray() FROM ciudad c WHERE c.cod = 4;