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
    TYPE t_num IS TABLE OF NUMBER(8) INDEX BY BINARY_INTEGER;
    TYPE t_mat IS TABLE OF t_num INDEX BY BINARY_INTEGER;

    --Variables para la funcion
    b NUMBER(8) := 0;
    s NUMBER(8) := 0;
    xi NUMBER(8) := 0;
    tamanoActual NUMBER(8) := 0;
    arrayVacioAux t_num;
    cln t_num;
    selected t_num;
    cols t_mat;

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

    -- Espacio de la funcion
    b := 2 * tamanoActual;
    -- Llenado del arreglo
    FOR i IN 0 .. b - 1 LOOP 
        cols(i)(0) := -20;
    END LOOP;
    -- Fin llenado del arreglo
    cols(0)(0) := -1;

    FOR i IN 0 .. cerdoArray.COUNT - 1 LOOP 
        xi := cerdoArray(i).pesokilos;
        -- DBMS_OUTPUT.PUT_LINE(xi);
        s := b-xi-1;
        LOOP
            IF cols(s + xi)(0) = -20 AND cols(s)(0) != -20 THEN
                cln := cols(s);
                -- Agregar xi
                cln(cln.COUNT) := xi;
                cols(s + xi) := cln; 
            END IF;
            s := s -1;
            EXIT WHEN s = -1;
        END LOOP; 
    END LOOP;
    -- DBMS_OUTPUT.PUT_LINE(cols.COUNT);
    -- DBMS_OUTPUT.PUT_LINE('----------------');

    -- Fin Espacio de la funcion

    -- Selected es el array que va a devolver la funcion
    selected(0) := -20;
    FOR i IN 0 .. tamanoActual - 1 LOOP 
        -- DBMS_OUTPUT.PUT_LINE('PUTO 1 ENTRANDO');
        IF cols(tamanoActual - i)(0) != -20 THEN 
            -- DBMS_OUTPUT.PUT_LINE('PUTO 1');
            selected := cols(tamanoActual - i);
            EXIT;
        ELSIF cols(tamanoActual + i)(0) != -20 THEN 
            -- DBMS_OUTPUT.PUT_LINE('PUTO 2');
            selected := cols(tamanoActual + i);
            EXIT;
        END IF;
    END LOOP;

    IF selected(0) = -20 THEN 
        -- DBMS_OUTPUT.PUT_LINE('PUTO');
        selected := cols(0);
    END IF;
    
    -- Ver los elementos del arreglo resultante
    FOR i IN 0..selected.COUNT - 1 LOOP
        DBMS_OUTPUT.PUT_LINE(selected(i));
    END LOOP;

    --Sigue el proceso de llenado

END; 
/