SET SERVEROUTPUT ON;

-- LOOP:

DECLARE
    v_contador NUMBER(2) := 1;
BEGIN
    LOOP
        dbms_output.put_line(v_contador);
        v_contador := v_contador + 1;
        EXIT WHEN v_contador > 20;
    END LOOP;

    COMMIT;
END;


-- WHILE: 

DECLARE
    v_contador NUMBER(2) := 1;
BEGIN
    WHILE v_contador <= 20
    LOOP
        dbms_output.put_line(v_contador);
        v_contador := v_contador + 1;
        EXIT WHEN v_contador > 20;
    END LOOP;

    COMMIT;
END;


-- FOR:

BEGIN
    FOR v_contador IN 1 .. 20
    LOOP
        dbms_output.put_line(v_contador);
    END LOOP;

    COMMIT;
END;

-----------------------------------------------------------------------------------

--  
DECLARE
    nr_tabuada NUMBER := &numero;

BEGIN
    for i in 1 .. 50
    LOOP
        dbms_output.put_line(i * nr_tabuada);
        
    END LOOP;

    COMMIT;
END;


