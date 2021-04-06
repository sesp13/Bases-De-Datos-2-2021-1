CREATE OR REPLACE TRIGGER actualizaPadres    
FOR UPDATE OF codigo ON individuo
COMPOUND TRIGGER
-- Variables
TYPE codigoType IS TABLE OF codigoAux%ROWTYPE INDEX BY BINARY_INTEGER;  
codigosArray codigoType;
aux1 NUMBER(8); 
contadorUpdates NUMBER(8); 
aux2 NUMBER(8); 
i NUMBER; 

BEFORE STATEMENT IS BEGIN

    -- Guardo todos los registros de individuos viejos en un arreglo
    FOR individuoFila IN (SELECT * FROM individuo) LOOP 
        INSERT INTO individuoAux VALUES(
            individuoFila.codigo,
            individuoFila.nombre,
            individuoFila.valor,
            individuoFila.padre,
            individuoFila.nro_hijos
        );
    END LOOP;

    -- Solo mando este update si codigoAux No tiene registros
    -- Setear todos los padres en NULL;
    UPDATE individuo 
    SET padre = NULL;
        
END BEFORE STATEMENT;

BEFORE EACH ROW IS BEGIN
    i := codigosArray.COUNT;
    codigosArray(i).codigoViejo := :OLD.codigo;
    codigosArray(i).codigoNuevo := :NEW.codigo;
END BEFORE EACH ROW;

AFTER STATEMENT IS BEGIN
    -- Iterar sobre los codigos afectados
    --  Volver a individuos a su padre original

    FOR individuoAuxFila IN (SELECT * FROM individuoAux) LOOP 

        SELECT COUNT(codigo) INTO aux1 
        FROM individuo 
        WHERE codigo = individuoAuxFila.padre;
        
        IF aux1 > 0 THEN 
            -- retornar la tabla a su estado original con los que aun existan
            UPDATE individuo
            SET padre = individuoAuxFila.padre
            WHERE codigo = individuoAuxFila.codigo;
        ELSE 
            -- Iterar sobre los codigos que cambiaron para encontrar el padre que cambio y actualizar el hijo
            FOR i IN 0 .. codigosArray.COUNT - 1 LOOP 
                IF codigosArray(i).codigoViejo = individuoAuxFila.padre THEN 
                    UPDATE individuo
                    SET padre = codigosArray(i).codigoNuevo
                    WHERE codigo = individuoAuxFila.codigo;
                    -- Terminar ciclo
                    EXIT;
                END IF;
            END LOOP;
        END IF;

    END LOOP;

    -- Eliminar los registros de individuoAux
    DELETE FROM individuoAux;

END AFTER STATEMENT;


END;
/