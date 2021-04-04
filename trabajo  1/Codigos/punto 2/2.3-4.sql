CREATE OR REPLACE TRIGGER eliminaHijos    
FOR DELETE ON individuo
COMPOUND TRIGGER
-- Variables
TYPE individuoType IS TABLE OF individuo%ROWTYPE INDEX BY BINARY_INTEGER;  
individuosArray individuoType;
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
        -- Mapear los campos en la tabla auxiliar
        INSERT INTO individuoAux VALUES(
            individuoFila.codigo,
            individuoFila.nombre,
            individuoFila.valor,
            individuoFila.padre,
            individuoFila.nro_hijos
        );
        i := i + 1;
    END LOOP;

    -- Actualizo todos los padres de individuos en nulo
    -- Para evitar problemas con la fk
    UPDATE individuo 
    SET padre = NULL;

END BEFORE STATEMENT;

BEFORE EACH ROW IS BEGIN
    -- Agregar registro a eliminar
    eliminados(eliminados.COUNT) := :OLD.codigo;
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
            UPDATE individuo
            SET padre = individuosArray(i).padre
            WHERE codigo = individuosArray(i).codigo;
        END IF;

    END LOOP;

    -- Cuando un individuo se borra y tiene padre no nulo, entonces a su padre se 
    -- le debe decrementar el atributo nro_hijos en una unidad.
    FOR i IN 0 .. eliminados.COUNT - 1 LOOP

        -- aux 1 es el codigo del padre del individuo eliminado
        SELECT padre INTO aux1 
        FROM individuoAux
        WHERE codigo = eliminados(i);
        -- RAISE_APPLICATION_ERROR(-20506, arrayPadresNoNulos(i) || ' ' || aux1);

        -- aux 2 es el numero de registros de individuos con el codigo del padre
        SELECT COUNT(codigo) INTO aux2
        FROM individuo
        WHERE codigo = aux1;

        -- Verificar que el padre aun exista
        IF aux2 > 0 THEN
            -- Flujo normal
            SELECT nro_hijos INTO hijosPadre
            FROM individuo
            WHERE codigo = aux1;

            -- Hijos padre es la cantidad de hijos que tenia el padre menos uno del eliminado
            hijosPadre := hijosPadre - 1;
            -- Controlar que el nuevo numero de hijos no sea negativo
            IF hijosPadre < 0 THEN 
                hijosPadre := 0;
            END IF;
            -- Actualizar la tabla de individuos con el array de padres
            UPDATE individuo
            SET nro_hijos = hijosPadre
            WHERE codigo = aux1;
        END IF;

    END LOOP;

    -- Eliminar los registros de individuoAux
    DELETE FROM individuoAux;

END AFTER STATEMENT;


END;
/