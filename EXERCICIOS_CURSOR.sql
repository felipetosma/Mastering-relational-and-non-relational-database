-- EXERCICIOS CURSOR
-- 1-

DECLARE
    CURSOR c_consulta_cliente IS
    SELECT
        cod_cliente,
        nom_cliente
    FROM
        cliente;

BEGIN
    FOR x IN c_consulta_cliente LOOP
        dbms_output.put_line('CLIENTE: '
                            || x.cod_cliente
                            || 'NOME: '
                            || x.nom_cliente);
    END LOOP;
END;