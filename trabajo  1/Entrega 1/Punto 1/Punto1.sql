DECLARE
    -- Variable de entrada
    kilosPedidos NUMBER(10) := 16;
    -- Fin Variable de entrada
    TYPE camionType IS TABLE OF camion%ROWTYPE INDEX BY BINARY_INTEGER;  
    camionesArray camionType;
    TYPE cerdoType IS TABLE OF cerdoAux%ROWTYPE INDEX BY BINARY_INTEGER;  
    cerdoArray cerdoType;
    
    -- variables auxiliares
    i NUMBER(8) := 0;
    j NUMBER(8) := 0;
    w NUMBER(8) := 0;
    camionI NUMBER(8) := 0;
    kilosPedidosI NUMBER(10) := kilosPedidos;
    aux1 NUMBER(8) := 0;
    aux2 NUMBER(8) := 0;
    aux1String VARCHAR(200) := '';
    TYPE t_num IS TABLE OF NUMBER(8) INDEX BY BINARY_INTEGER;
    TYPE t_mat IS TABLE OF t_num INDEX BY BINARY_INTEGER;
    arrayVacioAux t_num;
    arrayCerdoVacio cerdoType;
    matrizVaciaAux t_mat;

    --Variables para la funcion de seleccion
    K t_mat;
    cerdosOptimos cerdoType;
    cerdosPosibles cerdoType;
    tamanoActual NUMBER(8) := 0;
    capacidadUsada NUMBER(8) := 0;

    --Variables para el control de flujo de la aplicacion
    kilosTotales NUMBER(10) := 0;

BEGIN
    -- Llenado de camiones
    i := 0;
    FOR camionFila IN (SELECT * FROM camion ORDER BY maximacapacidadkilos  DESC) LOOP
        camionesArray(i) := camionFila;
        i := i +1;
    END LOOP;

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
    
    DBMS_OUTPUT.PUT_LINE('Informe para Mi Cerdito.');
    DBMS_OUTPUT.PUT_LINE('-----');

    -- Controles iniciales
    IF camionesArray.COUNT = 0 THEN 
        -- No hay camiones
        DBMS_OUTPUT.PUT_LINE('El pedido no se puede satisfacer');
    ELSIF cerdoArray.COUNT = 0 THEN
        -- No hay cerdos
        DBMS_OUTPUT.PUT_LINE('El pedido no se puede satisfacer');
    ELSIF cerdoArray(0).pesokilos > kilosPedidos THEN
        -- Todos los cerdos son más pesados que el requisito inicial
        DBMS_OUTPUT.PUT_LINE('El pedido no se puede satisfacer');
    ELSIF cerdoArray(0).pesokilos >  camionesArray(0).maximacapacidadkilos THEN 
        -- Los cerdos son mas pesados que los camiones
        DBMS_OUTPUT.PUT_LINE('El pedido no se puede satisfacer');
    ELSE
        -- Flujo normal
        FOR camionI IN 0 .. camionesArray.COUNT - 1  LOOP
            -- Camion actual camionesArray(camionI);

            -- Seleccion del tamaño de entrada para el algoritmo
            IF camionesArray(camionI).maximacapacidadkilos < kilosPedidosI THEN 
                tamanoActual := camionesArray(camionI).maximacapacidadkilos;
            ELSE 
                tamanoActual := kilosPedidosI;
            END IF;

            -- Seleccion de cerdos aptos para la entrada del algoritmo
            -- Inicializar los cerdos posibles
            cerdosPosibles := arrayCerdoVacio;
            -- j sera la variable auxiliar con la que llenemos el array de seleccionados;
            j := 0;
            FOR i IN 0 .. cerdoArray.COUNT - 1 LOOP
                -- DBMS_OUTPUT.PUT_LINE('PESO ' || cerdoArray(i).cod || ' ' || cerdoArray(i).nombre || ' ' || cerdoArray(i).seleccionado);
                IF cerdoArray(i).seleccionado = 0 THEN 
                    cerdosPosibles(j) := cerdoArray(i);
                    j := j + 1;
                END IF;
            END LOOP;
            -- DBMS_OUTPUT.PUT_LINE('/////////////////////////////////');

            -- --------------------------------- Funcion de seleccion ---------------------------
            -- Inicializar K
            K := matrizVaciaAux;
            FOR i IN 0 .. cerdosPosibles.COUNT LOOP
                FOR j IN 0 .. tamanoActual LOOP
                    K(i)(j) := 0;
                END LOOP;
            END LOOP;

            -- Construir K
            capacidadUsada := 0;
            FOR i IN 0 .. cerdosPosibles.COUNT LOOP
                FOR w IN 0 .. tamanoActual LOOP
                    IF  i = 0  OR  w = 0 THEN 
                        K(i)(w) := 0;
                    ELSIF cerdosPosibles(i - 1).pesokilos <= w THEN 
                        aux1 := cerdosPosibles(i - 1).pesokilos +
                            K(i - 1)(w - cerdosPosibles(i - 1).pesokilos);
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
            capacidadUsada := K(cerdosPosibles.COUNT)(tamanoActual);
            -- DBMS_OUTPUT.PUT_LINE('Tamaño optimo ' || K(cerdosPosibles.COUNT)(tamanoActual));
            
            --  Ciclo para mostrar el arreglo optimo
            i := cerdosPosibles.COUNT;
            j := tamanoActual;
            cerdosOptimos := arrayCerdoVacio;
            LOOP 
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
                    cerdosOptimos(cerdosOptimos.COUNT) := cerdosPosibles(i - 1);    
                    j := j - cerdosPosibles(i - 1).pesokilos;
                    i := i - 1;
                END IF; 

                EXIT WHEN i = 0;
            END LOOP; 
            -- -- FIN FUNCION DE SELECCION

            -- Actualizar la lista de cerdos e imprimir la respuesta
            IF cerdosOptimos.COUNT = 0 THEN 
                -- Caso No hay combinacion óptima
                -- DBMS_OUTPUT.PUT_LINE('No hay cerdos que satisfagan la solucion Interno');
                -- Como no hay solucion optima significa que los cerdos que quedan son muy pesados para el peso de los camiones Por lo que termino el proceso
                EXIT;
            ELSE 
                -- Flujo normal

                -- Imprimir camion
                DBMS_OUTPUT.PUT_LINE('Camión: ' || camionesArray(camionI).idCamion);

                aux1String := 'Lista cerdos:';

                -- Contador para cerdosOptimos
                FOR i IN 0 .. cerdosOptimos.COUNT - 1 LOOP
                    FOR j IN 0 .. cerdoArray.COUNT - 1 LOOP 
                        IF cerdoArray(j).cod = cerdosOptimos(i).cod THEN
                            -- DBMS_OUTPUT.PUT_LINE('CAMBIO DE PLANES ' || cerdosOptimos(i).cod || ' ' || cerdosOptimos(i).nombre || ' ' || cerdosOptimos(i).seleccionado);
                            cerdoArray(j).seleccionado := 1;
                            -- DBMS_OUTPUT.PUT_LINE('CAMBIO DE PLANES R ' || cerdosOptimos(i).cod || ' ' || cerdosOptimos(i).nombre || ' ' || cerdosOptimos(i).seleccionado);
                            aux1String := aux1String 
                                || ' ' 
                                || cerdosOptimos(i).cod 
                                || ' (' 
                                || cerdosOptimos(i).nombre 
                                || ') ' 
                                || cerdosOptimos(i).pesokilos
                                || 'kg';

                            IF i != cerdosOptimos.COUNT -1 THEN 
                                aux1String := aux1String || ','; 
                            ELSE 
                                EXIT;
                            END IF;
                        END IF;
                    END LOOP;
                END LOOP;

                -- DBMS_OUTPUT.PUT_LINE('xxxxxxxxxxxxxxxxxxxxxxxxxxx');
                -- Mostrar informe de cerdos
                DBMS_OUTPUT.PUT_LINE(aux1String);

                -- Recolectar datos para el informe final del camion
                aux1String := 'Total peso cerdos: ' || capacidadUsada || 'kg.';

                -- aux1 aca es la resta de la maxima capacidad del camion menos la usada 
                aux1 := camionesArray(camionI).maximacapacidadkilos - capacidadUsada;

                aux1String :=  aux1String 
                    ||  ' Capacidad no usada del camión: ' 
                    ||   aux1
                    ||  'kg';
                -- Imprimir la capacidad no usada del camion
                DBMS_OUTPUT.PUT_LINE(aux1String);

                -- Sumar al contador total los kilos que lleva este camion
                kilosTotales := kilosTotales + capacidadUsada;

                --DBMS_OUTPUT.PUT_LINE('-----');    
                -- Controlar el peso restante para la capacidad solicitada
                kilosPedidosI := kilosPedidosI - camionesArray(camionI).maximacapacidadkilos;
                -- kilosPedidosI := kilosPedidosI - capacidadUsada;
                -- DBMS_OUTPUT.PUT_LINE(kilosPedidosI);    
                -- DBMS_OUTPUT.PUT_LINE('-----');    

                -- Terminar el proceso cuando los kilos usados sean negativos siempre y cuando sobren camiones
                IF kilosPedidosI < 0 THEN 
                    EXIT;
                END IF;

            END IF;


        END LOOP;
        DBMS_OUTPUT.PUT_LINE('-----');    
        -- Imprimir el informe final
        --  Aca aux 2 representa los kilos no satisfechos
         aux2 := kilosPedidos - kilosTotales;
         aux1String := 'Total Peso solicitado: ' || kilosPedidos || 'kg. Peso real enviado: '
         || kilosTotales || 'kg. Peso no satisfecho: ' || aux2 || 'kg.';                
         DBMS_OUTPUT.PUT_LINE(aux1String);    

    END IF;
END; 
/