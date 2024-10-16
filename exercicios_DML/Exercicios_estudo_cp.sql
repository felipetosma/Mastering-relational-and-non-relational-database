SET SERVEROUTPUT ON;
-- QUERSTAO01
DECLARE
    codproduto   NUMBER := &digiteocodigodoproduto;
    nomproduto   VARCHAR2(30);
    totalproduto NUMBER;
BEGIN
    SELECT
        SUM(qtd_movimentacao_estoque),
        b.nom_produto
    INTO
        totalproduto,
        NOMPRODUTO
    FROM
             movimento_estoque a
        JOIN produto b ON ( a.cod_produto = b.cod_produto )
    WHERE
    a.cod_produto = 1
    group
    by
        b.nom_produto;
        dbms_output.put_line ( 'VOCE TEM O TOTAL DE '
        || totalproduto
        || ' ' || nomproduto || 'NO ESTOQUE ' );
END;
-- QUERSTAO02

DECLARE
    idcliente NUMBER := &digitecodcliente;
BEGIN
    FOR x IN (
        SELECT
            round(AVG(pd.val_total_pedido),
                  2) media,
            pd.cod_cliente,
            cli.nom_cliente
        FROM
                 pedido pd
            JOIN cliente cli ON pd.cod_cliente = cli.cod_cliente
        WHERE
            pd.cod_cliente = idcliente
        GROUP BY
            pd.cod_cliente,
            cli.nom_cliente
    ) LOOP
        dbms_output.put_line('a media total de pedidos do cliente '
                             || x.nom_cliente
                             || 'é de '
                             || x.media);
    END LOOP;
END;

COMMIT;


-- QUERSTAO03
-- QUERSTAO04
-- QUERSTAO05
