//Crear clientes
-- DECLARE
-- cc NUMBER 
BEGIN
DELETE FROM cliente;
FOR i IN 1..100000 LOOP
INSERT INTO cliente
VALUES
(i, DBMS_RANDOM.STRING('L',TRUNC(DBMS_RANDOM.VALUE(1,101))),TRUNC(DBMS_RANDOM.value(1,100000000000000000000)));
END LOOP;
commit;
END;
/

//Crear facturas
BEGIN
DELETE factura;
FOR i IN 1..100000 LOOP
INSERT INTO factura
VALUES
(i, TRUNC(SYSDATE + DBMS_RANDOM.value(0,366)),(SELECT * FROM(SELECT cedula FROM cliente SAMPLE (0.01)) WHERE ROWNUM = 1));
END LOOP;
commit;
END;
/

//Crear detalles
BEGIN
DELETE detalle;
FOR i IN 1..100000 LOOP
INSERT INTO detalle
VALUES
(i, TRUNC(DBMS_RANDOM.value(1,100000000000000000000)),TRUNC(DBMS_RANDOM.value(1,100000000000000000000)),TRUNC(DBMS_RANDOM.value(1,100000000000000000000)),(SELECT * FROM(SELECT cecliente FROM factura SAMPLE (0.01)) WHERE ROWNUM = 1));
END LOOP;
commit;
END;
/
