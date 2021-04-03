DECLARE 
    numeroHijos NUMBER(8) := -1;
BEGIN 
    -- FOR individuo IN (SELECT * FROM individuo) LOOP 
    --     IF individuo.padre IS NOT NULL THEN
    --         DBMS_OUTPUT.PUT_LINE('No es nulo');
    --     ELSE 
    --         DBMS_OUTPUT.PUT_LINE('Es nulo');
    --     END IF;
    -- END LOOP;

    SELECT nro_hijos 
    INTO numeroHijos
    FROM individuo
    WHERE codigo = 8;
    DBMS_OUTPUT.PUT_LINE(numeroHijos);
END ;
/
