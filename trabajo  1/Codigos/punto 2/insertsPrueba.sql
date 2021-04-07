CREATE TABLE individuo(
codigo NUMBER(8) PRIMARY KEY,
nombre VARCHAR2(20) NOT NULL,
valor NUMBER(8) NOT NULL CHECK (valor > 0),
padre NUMBER(8) REFERENCES individuo, --código del padre del inviduo
nro_hijos NUMBER(8) NOT NULL CHECK (nro_hijos >=0),
CHECK(padre <> codigo)
);

-- Limpiar
DELETE FROM individuo;

-- Seleccionar
SELECT * FROM individuo;

INSERT INTO individuo VALUES (
    1,
    'Saimon',
    23,
    NULL,
    89
);

INSERT INTO individuo VALUES (
    2,
    'SAUL',
    23,
    NULL,
    NULL
);

INSERT INTO individuo VALUES (
    3,
    'Kim',
    10,
    2,
    NULL
);

INSERT INTO individuo VALUES (
    4,
    'Jesse',
    56,
    2,
    NULL
);

INSERT INTO individuo VALUES (
    5,
    'Sofia',
    56,
    4,
    NULL
);

DELETE FROM individuo WHERE codigo = 1; 

UPDATE individuo 
SET codigo = 2
WHERE codigo = 4;

SELECT COUNT(codigo) FROM individuo WHERE codigo = NULL;

-- Caso de prueba profesor

INSERT INTO individuo VALUES (
    19,
    'Hope Sandoval',
    10,
    NULL,
    NULL
);

INSERT INTO individuo VALUES (
    32,
    'Kirsty Hawkshaw',
    8,
    NULL,
    NULL
);

INSERT INTO individuo VALUES (
    64,
    'Annabella Lwin',
    10,
    19,
    NULL
);

INSERT INTO individuo VALUES (
    122,
    'Amanda Marshall',
    20,
    19,
    NULL
);

INSERT INTO individuo VALUES (
    11,
    'Mavvie Marcos',
    2,
    64,
    NULL
);

SELECT * FROM individuo;

---------------------

UPDATE individuo 
SET valor = 18
WHERE codigo = 19;
SELECT * FROM individuo;

UPDATE individuo 
SET codigo = 333
WHERE codigo = 19;
SELECT * FROM individuo;

DELETE FROM individuo
WHERE codigo = 64;
SELECT * FROM individuo;

UPDATE individuo 
SET valor = 4
WHERE codigo = 333;
SELECT * FROM individuo;