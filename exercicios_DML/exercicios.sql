SET SERVEROUTPUT ON;

DECLARE 
    
    VALORCARRO NUMBER := &DigiteUmValor;
    VALORPARCELA NUMBER;
    
BEGIN 
    VALORPARCELA := valorcarro / 10;
    dbms_output.put_line('O VALOR DA PARCELA É: R$' || (valorparcela * 1.03));
    
    valorcarro := (valorparcela * 1.03);
    dbms_output.put_line('O VALOR DO CARRO FINANCIADO É: R$ ' || (valorcarro * 10));

    
END;

-------------------------------------------------------------------------------------------------------

DECLARE 
    
    VALORCARRO NUMBER := 10000;
    VALORENTRADA NUMBER;
    QNTPARCELAS NUMBER;
    
BEGIN 
 
   VALORENTRADA := valorcarro * 0.2;
    dbms_output.put_line('O VALOR DA ENTRADA É: R$' || (valorENTRADA));
    
    dbms_output.put_line('O VALOR DE 6 PARCELAS: R$' || (((valorCARRO - valorentrada)/6)* 1.1) || 'VALOR TOTAL: R$' || );
    dbms_output.put_line('O VALOR DE 15 PARCELAS: R$' ||((valorCARRO - valorentrada)/12)* 1.15);
    dbms_output.put_line('O VALOR DE 18 PARCELAS: R$' || ((valorCARRO - valorentrada)/18) *1.2);


        
END;