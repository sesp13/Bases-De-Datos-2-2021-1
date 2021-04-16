CREATE TABLE cerdo(
    cod NUMBER(8) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    pesokilos NUMBER(8) NOT NULL CHECK (pesokilos > 0)
);

CREATE TABLE camion(
    idcamion NUMBER(8) PRIMARY KEY,
    maximacapacidadkilos NUMBER(8) NOT NULL CHECK (maximacapacidadkilos > 0)
);

INSERT INTO cerdo VALUES (2, 'Ana Criado', 3);
INSERT INTO cerdo VALUES (4, 'Dua Lipa', 3);
INSERT INTO cerdo VALUES (8, 'Saffron', 3);
INSERT INTO cerdo VALUES (11, 'Ava Max', 3);
INSERT INTO cerdo VALUES (15, 'Esthero', 8);

INSERT INTO camion VALUES (13, 10);
INSERT INTO camion VALUES (38, 7);
INSERT INTO camion VALUES (22, 8);

/*
Se ejecuta el programa pidiendo 16 kilos.
Informe para Mi Cerdito.
-----
Camión: 13
Lista cerdos: 2 (Ana Criado) 3kg, 4 (Dua Lipa) 3kg, 8 (Saffron) 3kg
Total peso cerdos: 9kg. Capacidad no usada del camión: 1kg
Camión: 22
Lista cerdos: 11 (Ava Max) 3kg
Total peso cerdos: 3kg. Capacidad no usada del camión: 5kg
-----
Total Peso solicitado: 16kg. Peso real enviado: 12kg. Peso no satisfecho: 4kg.
*/

DELETE FROM cerdo;
DELETE FROM camion;

INSERT INTO cerdo VALUES (1, 'Tepig', 5);
INSERT INTO cerdo VALUES (2, 'Spoink', 4);
INSERT INTO cerdo VALUES (3, 'Grumpig', 8);
INSERT INTO cerdo VALUES (4, 'Pignite', 10);
INSERT INTO cerdo VALUES (5, 'Emboar', 15);

INSERT INTO camion VALUES (1, 10);
INSERT INTO camion VALUES (2, 20);
INSERT INTO camion VALUES (3, 5);

/*
Se ejecuta el programa pidiendo 3 kilos.
El pedido no se puede satisfacer.

Se ejecuta el programa pidiendo 30 kilos.
Informe para Mi Cerdito.
-----
Camión: 2
Lista cerdos: 1 (Tepig) 5kg, 5 (Emboar) 15kg
Total peso cerdos: 20kg. Capacidad no usada del camión: 0kg
Camión: 1
Lista cerdos: 4 (Pignite) 10kg
Total peso cerdos: 10kg. Capacidad no usada del camión: 0kg
-----
Total Peso solicitado: 30kg. Peso real enviado: 30kg. Peso no satisfecho: 0kg.
*/