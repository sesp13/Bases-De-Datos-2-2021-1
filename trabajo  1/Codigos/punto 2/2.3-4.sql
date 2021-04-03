CREATE OR REPLACE TRIGGER eliminaHijos    
FOR DELETE ON individuo
COMPOUND TRIGGER
-- Variables
TYPE individuoType IS TABLE OF individuo%ROWTYPE INDEX BY BINARY_INTEGER;  
individuosArray individuoType;
-- TYPE t_num IS TABLE OF individuo.padre%TYPE INDEX BY BINARY_INTEGER;  
TYPE t_num IS TABLE OF NUMBER(8) INDEX BY BINARY_INTEGER;  
arrayPadresNoNulos t_num;
eliminados t_num;
hijosPadre individuo.nro_hijos%TYPE;
aux1 NUMBER(8); 
aux2 NUMBER(8); 
i NUMBER; 
j NUMBER; 

BEFORE STATEMENT IS BEGIN

    -- Guardo todos los registros de individuos viejos en un arreglo
    i := 0;
    FOR individuoFila IN (SELECT * FROM individuo) LOOP 
        individuosArray(i) := individuoFila;
    END LOOP;

    -- Actualizo todos los padres de individuos en nulo
    -- Para evitar problemas con la fk
    UPDATE individuo 
    SET padre = NULL;

END BEFORE STATEMENT;

BEFORE EACH ROW IS BEGIN

    IF :OLD.padre IS NOT NULL THEN            
        -- Agregar Codigo de padre a modificar
        arrayPadresNoNulos(arrayPadresNoNulos.COUNT) := :OLD.padre;
        --Agregar codigo de registro eliminado
        eliminados(eliminados.COUNT) := :OLD.codigo;
    END IF;
END BEFORE EACH ROW;

AFTER STATEMENT IS BEGIN

     -- Cuando un individuo se borra y tiene hijos, entonces 
    -- a todos sus hijos se les debe poner su atributo padre en nulo.

    --  Volver a individuos a su estado original siempre y cuando su padre exista
    FOR i IN 0 .. individuosArray.COUNT - 1 LOOP 

        SELECT COUNT(codigo) INTO aux1 
        FROM individuo 
        WHERE codigo = individuosArray(i).padre;
        
        IF aux1 > 0 THEN 
            -- retornar la tabla a su estado original con los que aun existan
            -- RAISE_APPLICATION_ERROR(-20506, individuosArray(i).codigo || ' '|| individuosArray(i).padre);
            UPDATE individuo
            SET padre = individuosArray(i).padre
            WHERE codigo = individuosArray(i).codigo;
        END IF;

    END LOOP;

    -- Cuando un individuo se borra y tiene padre no nulo, entonces a su padre se 
    -- le debe decrementar el atributo nro_hijos en una unidad.
    FOR i IN 0 .. arrayPadresNoNulos.COUNT - 1 LOOP

        -- aux 1 es el numero de registros de individuos con el codigo del padre
        SELECT COUNT(codigo) INTO aux1 
        FROM individuo 
        WHERE codigo = arrayPadresNoNulos(i);

        -- Verificar que el padre aun exista
        IF aux1 > 0 THEN
            -- Flujo normal
            SELECT nro_hijos INTO hijosPadre
            FROM individuo
            WHERE codigo = arrayPadresNoNulos(i);

            -- Hijos padre es la cantidad de hijos que tenia el padre menos uno del eliminado
            hijosPadre := hijosPadre - 1;
            -- Controlar que el nuevo numero de hijos no sea negativo
            IF hijosPadre < 0 THEN 
                hijosPadre := 0;
            END IF;
            -- Actualizar la tabla de individuos con el array de padres
            UPDATE individuo
            SET nro_hijos = hijosPadre
            WHERE codigo = arrayPadresNoNulos(i);
        END IF;

    END LOOP;

    -- Cuando un individuo se borra y tiene hijos, entonces 
    -- a todos sus hijos se les debe poner su atributo padre en nulo.
    -- FOR i IN 0 .. eliminados.COUNT - 1 LOOP 
    --     -- RAISE_APPLICATION_ERROR(-20506, eliminados(i));

    --     -- Ver todos los hijos que aun existan del registro eliminado
    --     FOR hijoFila IN (SELECT * FROM individuo WHERE padre = eliminados(i)) LOOP 

    --         -- Actualizar el padre del hijo
    --         UPDATE individuo
    --         SET padre = NULL 
    --         WHERE codigo = hijoFila.codigo;     

    --     END LOOP;

    -- END LOOP;


END AFTER STATEMENT;


END;
/