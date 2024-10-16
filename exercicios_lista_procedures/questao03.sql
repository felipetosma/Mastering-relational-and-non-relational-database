/* 
3)Fa�a uma Fun��o chamada FUN_TOTAL_PEDIDO_RMNNNNN, para que fa�a uma totaliza��o dos pedidos a partir do par�metro do CODIGO DO CLIENTE.
Crie os tratamentos de exceptions necess�rios. Cuidado n�o use RAISE_APPLICATION_ERROR.
*/

CREATE OR REPLACE FUNCTION FUN_TOTAL_PEDIDO(
    p_cod_cliente IN pedido.cod_cliente%TYPE
) RETURN NUMBER
IS
    v_total_pedidos NUMBER(15,2) := 0;
    
    -- Definindo exce��es personalizadas
    cliente_nao_encontrado EXCEPTION;
    erro_calculo EXCEPTION;
    
    -- Vari�vel para verificar se o cliente existe
    v_cliente_existe NUMBER;
BEGIN
    -- Verificar se o cliente existe
    SELECT COUNT(*)
    INTO v_cliente_existe
    FROM pedido
    WHERE cod_cliente = p_cod_cliente;
    
    IF v_cliente_existe = 0 THEN
        RAISE cliente_nao_encontrado;
    END IF;

    -- Calcular o total dos pedidos
    SELECT NVL(SUM(val_total_pedido), 0)
    INTO v_total_pedidos
    FROM pedido
    WHERE cod_cliente = p_cod_cliente;

    RETURN v_total_pedidos;

EXCEPTION
    WHEN cliente_nao_encontrado THEN
        -- Logar o erro e retornar NULL
        DBMS_OUTPUT.PUT_LINE('Cliente n�o encontrado com o c�digo: ' || p_cod_cliente);
    WHEN erro_calculo THEN
        -- Logar o erro e retornar NULL
        DBMS_OUTPUT.PUT_LINE('Erro ao calcular o total dos pedidos para o cliente: ' || p_cod_cliente);
    WHEN OTHERS THEN
        -- Logar o erro gen�rico e retornar NULL
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
END FUN_TOTAL_PEDIDO;