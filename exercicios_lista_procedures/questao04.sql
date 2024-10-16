/*
4)	Altere a função do exercício 2 para que tenha um exception chamado INCONSISTENCIA_DADOS para que em caso de dados 
inconsistentes realize um RAISE usando esse EXCEPTION. A função deverá tratar os problemas decorrentes de exception. 
Mude o nome da função para FUN_INSERE_NF2_RMNNNNN.
*/

CREATE OR REPLACE FUNCTION FUN_INSERE_NF2(
    p_cod_pedido IN pedido.cod_pedido%TYPE
) RETURN pedido%ROWTYPE
IS
    v_pedido pedido%ROWTYPE;
    INCONSISTENCIA_DADOS EXCEPTION;
BEGIN
    -- Consulta o pedido
    SELECT *
    INTO v_pedido
    FROM pedido
    WHERE cod_pedido = p_cod_pedido;
    
    -- Verifica se há inconsistência nos dados
    IF v_pedido.val_total_pedido <= 0 OR v_pedido.dat_pedido IS NULL THEN
        RAISE INCONSISTENCIA_DADOS;
    END IF;
    
    -- Aqui você pode adicionar a lógica para inserir a NF2
    -- Por exemplo:
    -- INSERT INTO nf2 (cod_pedido, ...) VALUES (v_pedido.cod_pedido, ...);
    
    RETURN v_pedido;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Pedido não encontrado com o código: ' || p_cod_pedido);
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Mais de um pedido encontrado com o código: ' || p_cod_pedido);
    WHEN INCONSISTENCIA_DADOS THEN
        DBMS_OUTPUT.PUT_LINE('Dados inconsistentes encontrados para o pedido: ' || p_cod_pedido);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao processar pedido: ' || SQLERRM);
END FUN_INSERE_NF2;