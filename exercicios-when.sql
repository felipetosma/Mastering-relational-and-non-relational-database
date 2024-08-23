SELECT * FROM TABELA_VENDAS;

SELECT 
    COUNT(1),
    CASE 
        WHEN DEALSIZE = 'Medium' THEN
            'EMPRESA DE PORTE M�DIO'
        WHEN DEALSIZE = 'Small' THEN
            'EMPRESA DE PORTE PEQUENO'
        WHEN DEALSIZE = 'Large' THEN
            'EMPRESA DE PORTE GRANDE'
        END PORTEEMPRESA
FROM
    TABELA_VENDAS

GROUP BY 
CASE 
        WHEN DEALSIZE = 'Medium' THEN
            'EMPRESA DE PORTE M�DIO'
        WHEN DEALSIZE = 'Small' THEN
            'EMPRESA DE PORTE PEQUENO'
        WHEN DEALSIZE = 'Large' THEN
            'EMPRESA DE PORTE GRANDE'
        END
ORDER BY 
    1;
        