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

PRENDER la consola
SET SERVEROUTPUT ON