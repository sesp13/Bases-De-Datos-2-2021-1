CREATE TABLE cerdoAux(
    cod NUMBER(8),
    nombre VARCHAR(20),
    pesokilos NUMBER(8),
    seleccionado NUMBER(1)
);


DECLARE
    -- Variable de entrada
    kilosPedidos NUMBER(10) := 8;
    -- Fin Variable de entrada
    TYPE camionType IS TABLE OF camion%ROWTYPE INDEX BY BINARY_INTEGER;  
    camionesArray camionType;
    TYPE cerdoType IS TABLE OF cerdoAux%ROWTYPE INDEX BY BINARY_INTEGER;  
    cerdoArray cerdoType;
    -- variables auxiliares
    i NUMBER(8) := 0;
BEGIN
    -- Llenado de camiones
    SELECT *  BULK COLLECT INTO camionesArray FROM camion ORDER BY maximacapacidadkilos  DESC;

    -- FOR iterador IN 1 .. camionesArray.COUNT LOOP 
    --     DBMS_OUTPUT.PUT_LINE(camionesArray(iterador).idcamion);
    -- END LOOP;

    -- Llenado de cerdos
    -- Inicializar el contador auxiliar
    i := 1;
    FOR cerdoFila IN (
        SELECT * 
        FROM cerdo
        ORDER BY pesokilos asc
    ) LOOP
        cerdoArray(i).cod := cerdoFila.cod;
        cerdoArray(i).nombre := cerdoFila.nombre;
        cerdoArray(i).pesokilos := cerdoFila.pesokilos;
        cerdoArray(i).seleccionado := 0;
        i := i + 1;
    END LOOP;

    
    -- FOR iterador IN 1 .. cerdoArray.COUNT LOOP 
    --     DBMS_OUTPUT.PUT_LINE(cerdoArray(iterador).seleccionado);
    -- END LOOP;

    --Sigue el proceso de llenado

END; 
/

//Notas y cosas varias
Podriamos guardar 

Guardar en arrays 
1. los camiones ordenados descendientemente
2. Los cerdos ordenados 

CONSULTA DE CAMIONES 
SELECT * FROM camion ORDER BY maximacapacidadkilos  DESC

CREAR UNA TABLA CON LAS 4 COLUMNAS PARA LOS cerdos

CERDOS SELECCIONADOS
SELECT cod, nombre, pesokilos, 0 as "Seleccionado" 
FROM cerdo
ORDER BY pesokilos asc;

LLenado de un array 
    CON FOR 
    FOR camionFila IN (SELECT * FROM camion ORDER BY maximacapacidadkilos  DESC) LOOP
        camionesArray(i) := camionFila;
        i := i +1;
    END LOOP;

    CON BULK COLLECT (OJO el indice inicia en 1)
        SELECT *  BULK COLLECT INTO camionesArray FROM camion ORDER BY maximacapacidadkilos  DESC;
    



Recorrer un array 

    Creado normal

    FOR iterador IN 0 .. camionesArray.COUNT - 1 LOOP 
        DBMS_OUTPUT.PUT_LINE(camionesArray(iterador).idcamion);
    END LOOP;

camionesArray(iterador) es un resultado de la tabla

    Con bulkcollect
    
    FOR iterador IN 1 .. camionesArray.COUNT LOOP 
        DBMS_OUTPUT.PUT_LINE(camionesArray(iterador).idcamion);
    END LOOP; 