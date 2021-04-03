DECLARE 
    numeroHijos NUMBER(8) := -1;
    padre NUMBER(8) := -1;
BEGIN 
    -- FOR individuo IN (SELECT * FROM individuo) LOOP 
    --     IF individuo.padre IS NOT NULL THEN
    --         DBMS_OUTPUT.PUT_LINE('No es nulo');
    --     ELSE 
    --         DBMS_OUTPUT.PUT_LINE('Es nulo');
    --     END IF;
    -- END LOOP;

    SELECT nro_hijos, padre 
    INTO numeroHijos, padre
    FROM individuo
    WHERE codigo = 4;



    DBMS_OUTPUT.PUT_LINE(padre);
    DBMS_OUTPUT.PUT_LINE(numeroHijos);
END ;
/


Sintaxis del compund TRIGGER

CREATE OR REPLACE TRIGGER my_trigger
    FOR INSERT
    ON INDIVIDUO
    COMPOUND TRIGGER

  -- Declare all stuff here
  my_variable NUMBER(8);
  --

  -- 1
  BEFORE STATEMENT IS BEGIN
    -- Do something in the before statement timing.
  END BEFORE STATEMENT;

  -- 2
  BEFORE EACH ROW IS BEGIN
    -- Do something in the before each row timing.
  END BEFORE EACH ROW;

  -- 3
  AFTER EACH ROW IS BEGIN
    -- Do something in the AFTER each row timing.
  END AFTER EACH ROW;

  -- 4
  AFTER STATEMENT IS BEGIN
    -- Do something in the AFTER STATEMENT timing.
  END AFTER STATEMENT;

END my_trigger;