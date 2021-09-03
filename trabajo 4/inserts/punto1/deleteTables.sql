DROP TABLE detalle;
DROP TABLE factura;
DROP TABLE cliente;


--Create tables
CREATE TABLE cliente(
cedula NUMBER(20) PRIMARY KEY,
nombre VARCHAR2(100) NOT NULL,
telefono NUMBER(20) NOT NULL
);

CREATE TABLE factura(
codigof NUMBER(20) PRIMARY KEY,
fecha DATE NOT NULL,
cecliente NUMBER(20) NOT NULL REFERENCES cliente
);

CREATE TABLE detalle(
codigod NUMBER(20) PRIMARY KEY,
codproducto NUMBER(20) NOT NULL,
nro_unidades NUMBER(20) NOT NULL,
valor_unitario NUMBER(20) NOT NULL,
codfact NUMBER(20) NOT NULL REFERENCES factura
);
