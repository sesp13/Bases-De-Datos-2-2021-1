CREATE TABLE individuo(
codigo NUMBER(8) PRIMARY KEY,
nombre VARCHAR2(20) NOT NULL,
valor NUMBER(8) NOT NULL CHECK (valor > 0),
padre NUMBER(8) REFERENCES individuo, --código del padre del inviduo
nro_hijos NUMBER(8) NOT NULL CHECK (nro_hijos >=0),
CHECK(padre <> codigo)
);

CREATE TABLE individuoAux(
codigo NUMBER(8),
nombre VARCHAR2(20),
valor NUMBER(8),
padre NUMBER(8),
nro_hijos NUMBER(8)
);

CREATE TABLE codigoAux(
codigoViejo NUMBER(8),
codigoNuevo NUMBER(8)
);
