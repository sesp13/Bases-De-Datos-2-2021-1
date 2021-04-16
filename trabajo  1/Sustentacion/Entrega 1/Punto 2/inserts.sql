--Insertar estas tablas en la base de datos para correr los distintos triggers del punto 2
CREATE TABLE individuoAux(
codigo NUMBER(8),
nombre VARCHAR2(20),
valor NUMBER(8),
padre NUMBER(8),
nro_hijos NUMBER(8)
);

CREATE TABLE individuoAuxUpdate(
codigo NUMBER(8),
nombre VARCHAR2(20),
valorViejo NUMBER(8),
valorNuevo number(8),
padre NUMBER(8),
nro_hijos NUMBER(8)
);

CREATE TABLE codigoAux(
codigoViejo NUMBER(8),
codigoNuevo NUMBER(8)
);
