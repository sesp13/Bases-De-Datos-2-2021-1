INSERT INTO ciudad SELECT 1,  'Medellin', REF(d) FROM departamento d WHERE d.cod = 1;
INSERT INTO ciudad SELECT 2,  'Envigado', REF(d) FROM departamento d WHERE d.cod = 1;
INSERT INTO ciudad SELECT 3,  'Bogota', REF(d) FROM departamento d WHERE d.cod = 2;
INSERT INTO ciudad SELECT 4,  'Cali', REF(d) FROM departamento d WHERE d.cod = 3;
INSERT INTO ciudad SELECT 5,  'Bucaramanga', REF(d) FROM departamento d WHERE d.cod = 4;