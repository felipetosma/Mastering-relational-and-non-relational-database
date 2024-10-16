/*2)	
Fa�a uma fun��o chamada FUN_CONSULTA_PED_RMNNNNN, para consultar PEDIDO usando como par�metro o c�digo do pedido. 
Use para fazer a consulta SELECT INTO, e use os EXCEPTIONS necess�rios.*/

CREATE OR REPLACE FUNCTION FUN_CONSULTA_PEDIDO(
    p_cod_pedido IN pedido.cod_pedido%TYPE
) RETURN pedido%ROWTYPE
IS
    v_pedido pedido%ROWTYPE;
BEGIN
    SELECT *
    INTO v_pedido
    FROM pedido
    WHERE cod_pedido = p_cod_pedido;
    
    RETURN v_pedido;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Pedido n�o encontrado com o c�digo: ' || p_cod_pedido);
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Mais de um pedido encontrado com o c�digo: ' || p_cod_pedido);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao consultar pedido: ' || SQLERRM);
END FUN_CONSULTA_PEDIDO;
