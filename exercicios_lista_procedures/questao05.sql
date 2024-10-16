/*
5)	Faça uma função chamada FUN_VALIDA_PRODUTO_RMNNNNN que receberá um CÓDIGO DE PRODUTO e deverá retornar TRUE se estiver 
cadastrada e FALSE caso não esteja. Use SELECT ...INTO e realize tratamento de exceções necessárias.
*/

CREATE OR REPLACE FUNCTION FUN_VALIDA_PRODUTO(
    p_cod_produto IN produto.cod_produto%TYPE
) RETURN BOOLEAN
IS
    v_cod_existe NUMBER;
BEGIN
    -- Tenta selecionar o produto com o código fornecido
    SELECT 1
    INTO v_cod_existe
    FROM produto
    WHERE cod_produto = p_cod_produto;
    
    -- Se chegou até aqui, o produto existe
    RETURN TRUE;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Produto não encontrado
        RETURN FALSE;
    WHEN OTHERS THEN
        -- Logar o erro inesperado
        DBMS_OUTPUT.PUT_LINE('Erro ao validar produto: ' || SQLERRM);
        -- Retorna FALSE em caso de qualquer outro erro
        RETURN FALSE;
END FUN_VALIDA_PRODUTO;