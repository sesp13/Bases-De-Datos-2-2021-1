-- 1. Cuando un individuo ingresa el nro_hijos debe ser cero
CREATE OR REPLACE TRIGGER numeroHijosCero
BEFORE INSERT ON individuo
FOR EACH ROW
BEGIN 
    :NEW.nro_hijos := 0;
END;
/