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