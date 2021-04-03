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
INSERT INTO cerdo VALUES(2, 'Ana Criado', 10);
INSERT INTO cerdo VALUES(4, 'Dua Lipa', 4);
INSERT INTO cerdo VALUES(11, 'Ava Max', 15);
INSERT INTO cerdo VALUES(112, 'Ava Max 2', 5);
-- INSERT INTO cerdo VALUES(8, 'Saffron', 5);
-- INSERT INTO cerdo VALUES(88, 'Saffron 2', 5);
-- INSERT INTO cerdo VALUES(1, 'Un1co', 1);
-- INSERT INTO cerdo VALUES(113, 'Un2co', 2);
-- INSERT INTO cerdo VALUES(1114, 'Un3co', 4);
-- INSERT INTO cerdo VALUES(3839, 'MIA', 7);
-- INSERT INTO cerdo VALUES(3838, 'MIA 2', 12);
-- INSERT INTO cerdo VALUES(3837, 'MIA 3', 28);
-- INSERT INTO cerdo VALUES(3836, 'MIA 4', 3);
-- INSERT INTO cerdo VALUES(3835, 'MIA 5', 40);
-- INSERT INTO cerdo VALUES(3834, 'MIA 4', 70);
-- INSERT INTO cerdo VALUES(3833, 'MIA 2', 1);
select * from cerdo order by pesokilos asc;

CREATE TABLE camion(
idcamion NUMBER(8) PRIMARY KEY,
maximacapacidadkilos NUMBER(8) NOT NULL CHECK (maximacapacidadkilos > 0)
);

-- Camiones
INSERT INTO camion VALUES(13, 10);
INSERT INTO camion VALUES(38, 7);
INSERT INTO camion VALUES(22, 8);


-- Caminones custom
delete from camion;
INSERT INTO camion VALUES(13, 10);
INSERT INTO camion VALUES(38, 15);
INSERT INTO camion VALUES(23, 9);
-- INSERT INTO camion VALUES(24, 13);
-- INSERT INTO camion VALUES(27, 3);
-- INSERT INTO camion VALUES(28, 20);
select * from camion order by maximacapacidadkilos desc;
