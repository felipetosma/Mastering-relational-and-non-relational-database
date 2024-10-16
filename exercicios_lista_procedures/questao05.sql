/*
5)	Fa�a uma fun��o chamada FUN_VALIDA_PRODUTO_RMNNNNN que receber� um C�DIGO DE PRODUTO e dever� retornar TRUE se estiver 
cadastrada e FALSE caso n�o esteja. Use SELECT ...INTO e realize tratamento de exce��es necess�rias.
*/

CREATE OR REPLACE FUNCTION FUN_VALIDA_PRODUTO(
    p_cod_produto IN produto.cod_produto%TYPE
) RETURN BOOLEAN
IS
    v_cod_existe NUMBER;
BEGIN
    -- Tenta selecionar o produto com o c�digo fornecido
    SELECT 1
    INTO v_cod_existe
    FROM produto
    WHERE cod_produto = p_cod_produto;
    
    -- Se chegou at� aqui, o produto existe
    RETURN TRUE;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Produto n�o encontrado
        RETURN FALSE;
    WHEN OTHERS THEN
        -- Logar o erro inesperado
        DBMS_OUTPUT.PUT_LINE('Erro ao validar produto: ' || SQLERRM);
        -- Retorna FALSE em caso de qualquer outro erro
        RETURN FALSE;
END FUN_VALIDA_PRODUTO;