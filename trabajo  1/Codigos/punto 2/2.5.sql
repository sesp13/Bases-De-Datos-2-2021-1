CREATE OR REPLACE TRIGGER actualizaValor    
FOR UPDATE OF valor ON individuo FOLLOWS actualizaPadres
COMPOUND TRIGGER
-- Variables
diferencia NUMBER(8);

BEFORE STATEMENT IS BEGIN

    -- Guardo todos los registros de individuos viejos en un arreglo, el valor 0 corresponderá al valor luego del update
    FOR individuoFila IN (SELECT * FROM individuo) LOOP 
        INSERT INTO individuoAuxUpdate VALUES(
            individuoFila.codigo,
            individuoFila.nombre,
            individuoFila.valor,
            0,
            individuoFila.padre,
            individuoFila.nro_hijos
        );
    END LOOP;

END BEFORE STATEMENT;

BEFORE EACH ROW IS BEGIN
    -- Se verifica que en caso de que se trate de un incremento pero este sea menor a 5, no se realice la transacción
    IF (:NEW.valor - :OLD.valor) < 5 and (:NEW.valor-:OLD.valor) >= 0 THEN 
         RAISE_APPLICATION_ERROR(-20515,'¡El incremento de valor debe ser mayor o igual a 5!');
    END IF;
    
END BEFORE EACH ROW;

AFTER STATEMENT IS BEGIN
    --Se guardan todos los valores de la tabla individuo luego del update en la tabla individuoAuxUpdate en la columna valorNuevo
    FOR individuoAuxFila2 IN (SELECT * FROM individuo) LOOP
        UPDATE individuoAuxUpdate SET valorNuevo = individuoAuxFila2.valor WHERE codigo = individuoAuxFila2.codigo;
    END LOOP;
    
    FOR individuoAuxFila IN (SELECT * FROM individuoAuxUpdate) LOOP 
        
        diferencia:= individuoAuxFila.valorNuevo - individuoAuxFila.valorViejo;
        --Solo se debe modificar el update en caso de que se trate de un incremento
        IF diferencia > 0 THEN
            
            DELETE FROM individuo 
            WHERE codigo = individuoAuxFila.codigo;
            
            INSERT INTO individuo VALUES (
                individuoAuxFila.codigo,
                individuoAuxFila.nombre,
                individuoAuxFila.valorViejo +2,
                individuoAuxFila.padre,
                individuoAuxFila.nro_hijos
            );
            -- En caso de que tenga hijos se escoge uno y se realiza el incremento de valor correspondiente,     
            IF individuoAuxFila.nro_hijos > 0 THEN
            
                FOR mi_e IN (SELECT * FROM individuoAuxUpdate WHERE padre=individuoAuxFila.codigo AND ROWNUM = 1)
                LOOP    
                    DELETE FROM individuo 
                    WHERE codigo = mi_e.codigo;
                        
                    INSERT INTO individuo VALUES(
                        mi_e.codigo,
                        mi_e.nombre,
                        mi_e.valorViejo + diferencia - 2,
                        NULL,
                        0
                        );
                    END LOOP;
            END IF;
            --Como al realizar los deletes anteriores se pierde la relación padre-hijo, se actualizan los valores a partir de los que se tenían originalmente
            FOR mi IN (SELECT * FROM individuoAuxUpdate) LOOP
                UPDATE individuo
                SET padre = mi.padre, nro_hijos = mi.nro_hijos WHERE codigo=mi.codigo;
            END LOOP;
            
        END IF;
        
    END LOOP;

    -- Eliminar los registros de individuoAux
    DELETE FROM individuoAuxUpdate;

END AFTER STATEMENT;


END;
/