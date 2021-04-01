DROP TABLE cerdo;
CREATE TABLE cerdo(
cod NUMBER(8) PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
pesokilos NUMBER(8) NOT NULL CHECK (pesokilos > 0)
);

CREATE TABLE cerdoAux(
    cod NUMBER(8),
    nombre VARCHAR(20),
    pesokilos NUMBER(8),
    seleccionado NUMBER(1)
);

-- Cerdos Original
delete from cerdo;
INSERT INTO cerdo VALUES(2, 'Ana Criado', 3);
INSERT INTO cerdo VALUES(4, 'Dua Lipa', 3);
INSERT INTO cerdo VALUES(8, 'Saffron', 3);
INSERT INTO cerdo VALUES(11, 'Ava Max', 3);
INSERT INTO cerdo VALUES(15, 'Esthero', 8);
select * from cerdo;

--Cerdos custom
delete from cerdo;
INSERT INTO cerdo VALUES(2, 'Ana Criado', 1);
INSERT INTO cerdo VALUES(4, 'Dua Lipa', 1);
INSERT INTO cerdo VALUES(11, 'Ava Max', 8);
INSERT INTO cerdo VALUES(8, 'Saffron', 9);
INSERT INTO cerdo VALUES(88, 'Saffron', 10);
select * from cerdo;

CREATE TABLE camion(
idcamion NUMBER(8) PRIMARY KEY,
maximacapacidadkilos NUMBER(8) NOT NULL CHECK (maximacapacidadkilos > 0)
);

-- Camiones
INSERT INTO camion VALUES(13, 10);
INSERT INTO camion VALUES(38, 7);
INSERT INTO camion VALUES(22, 8);
