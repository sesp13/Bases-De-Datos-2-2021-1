-- 1. Cuando un individuo ingresa el nro_hijos debe ser cero
CREATE OR REPLACE TRIGGER numeroHijosCero
BEFORE INSERT ON individuo
FOR EACH ROW
DECLARE
    numeroHijos NUMBER(8);
BEGIN 
    :NEW.nro_hijos := 0;
END;
/