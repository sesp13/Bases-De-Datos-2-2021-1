-- CREATE OR REPLACE TYPE t_num AS TABLE OF NUMBER(8);

-- CREATE OR REPLACE PROCEDURE 
-- mejorCombinacion(numero IN NUMBER, arreglo OUT t_num)
-- IS
-- BEGIN
--     arreglo := t_num(5);
--     arreglo(0) := numero;
--     DBMS_OUTPUT.PUT_LINE('eL NUMERO ES ' || arreglo(0)); 
-- END; 
-- /

-- DECLARE 
--     array t_num;
-- BEGIN 
--     -- array(0) := 5;
--     -- DBMS_OUTPUT.PUT_LINE(array(0)); 
--     mejorCombinacion(8, array);
-- END;
-- /