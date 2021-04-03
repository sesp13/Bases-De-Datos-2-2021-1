-- Cuando un individuo ingresa con un padre no nulo, 
-- entonces a su padre se le debe incrementar el atributo nro_hijos en una unidad.
CREATE OR REPLACE TRIGGER actualizarNumeroDeHijos
BEFORE INSERT ON individuo
FOR EACH ROW
DECLARE
    numeroHijos NUMBER(8);
    numeroFilas NUMBER(8);
BEGIN 
    IF :NEW.padre IS NOT NULL THEN 
        -- Obtener numero de hijos del padre
        SELECT nro_hijos 
        INTO numeroHijos
        FROM individuo
        WHERE codigo = :NEW.padre;

        -- Sumar una unidad al numero de hijos
        numeroHijos := numeroHijos + 1;
        
        --Actualizar el padre
        UPDATE individuo
        SET nro_hijos = numeroHijos
        WHERE codigo = :NEW.padre;
    END IF;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('El padre no existe');
END;
/
