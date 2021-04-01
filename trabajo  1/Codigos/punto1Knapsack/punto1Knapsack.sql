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
    j NUMBER(8) := 0;
    w NUMBER(8) := 0;
    aux1 NUMBER(8) := 0;
    aux2 NUMBER(8) := 0;
    TYPE t_num IS TABLE OF NUMBER(8) INDEX BY BINARY_INTEGER;
    TYPE t_mat IS TABLE OF t_num INDEX BY BINARY_INTEGER;
    arrayVacioAux t_num;
    tamanoActual NUMBER(8) := 0;

    --Variables para la funcion
    K t_mat;
    arrayOptimo t_num;

BEGIN
    -- Llenado de camiones
    SELECT *  BULK COLLECT INTO camionesArray FROM camion ORDER BY maximacapacidadkilos  DESC;

    -- FOR iterador IN 1 .. camionesArray.COUNT LOOP 
    --     DBMS_OUTPUT.PUT_LINE(camionesArray(iterador).idcamion);
    -- END LOOP;

    -- Llenado de cerdos
    -- Inicializar el contador auxiliar
    i := 0;
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

    tamanoActual := camionesArray(1).maximacapacidadkilos;
    -- tamanoActual := 20;

    -- Funcion de seleccion
    -- Inicializar K
    FOR i IN 0 .. cerdoArray.COUNT LOOP
        FOR j IN 0 .. tamanoActual LOOP
            K(i)(j) := 0;
        END LOOP;
    END LOOP;

    -- Construir K
    FOR i IN 0 .. cerdoArray.COUNT LOOP
        FOR w IN 0 .. tamanoActual LOOP
            IF  i = 0  OR  w = 0 THEN 
                K(i)(w) := 0;
            ELSIF cerdoArray(i - 1).pesokilos <= w THEN 
                aux1 := cerdoArray(i - 1).pesokilos +
                    K(i - 1)(w - cerdoArray(i - 1).pesokilos);
                aux2 := K(i - 1)(w);
                -- Escoger el mayor
                IF  aux1 >= aux2 THEN 
                    K(i)(w) := aux1;
                ELSE 
                    K(i)(w) := aux2;
                END IF;
            ELSE 
                K(i)(w) := k(i - 1)(w);
            END IF;
        END LOOP;
    END LOOP;

    -- Tamaño optimo de knapsack
    DBMS_OUTPUT.PUT_LINE('Tamaño optimo ' || K(cerdoArray.COUNT)(tamanoActual));
    DBMS_OUTPUT.PUT_LINE('--------------------');
    
    --  Ciclo para armar el arreglo optimo
    i := cerdoArray.COUNT;
    j := tamanoActual;
    LOOP 
        -- DBMS_OUTPUT.PUT_LINE('i ' || i);
        -- DBMS_OUTPUT.PUT_LINE('j ' || j);

        -- Valor actual
        aux1 := K(i)(j);
        -- Fila anterior misma columna 
        aux2 := K(i-1)(j);

        IF aux1 = aux2 THEN 
            -- No agrego el peso actual
            i := i - 1;
            j := j;
        ELSE 
            -- Agrego el peso actual 
            arrayOptimo(arrayOptimo.COUNT) := cerdoArray(i - 1).pesokilos;    
            j := j - cerdoArray(i - 1).pesokilos;
            i := i - 1;
        END IF; 

        EXIT WHEN i = 0;
    END LOOP; 

    -- Recorrer el array optimo
    DBMS_OUTPUT.PUT_LINE('------ El optimo es ----------');
    FOR i IN 0 .. arrayOptimo.COUNT - 1 LOOP 
        DBMS_OUTPUT.PUT_LINE(arrayOptimo(i));
    END LOOP;
    -- FIN FUNCION DE SELECCION

END; 
/