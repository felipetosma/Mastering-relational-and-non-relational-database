SET SERVEROUTPUT ON;

DECLARE 
    V_NOME VARCHAR2 (30);
    V_IDADE NUMBER := 32;
BEGIN 
    V_NOME := 'FELIPE';
    dbms_output.put_line(v_nome || v_idade);
END;

--------------------------------------------------------------------------------

DECLARE 
    V_NUMBER NUMBER := 45;
    V_NUMBER2 NUMBER := 32;
BEGIN 
    dbms_output.put_line(V_NUMBER * V_NUMBER2);
END;

--------------------------------------------------------------------------------

DECLARE 
    V_SALARIO_ATUAL NUMBER := 1200;
    V_SALARIO_NOVO NUMBER := V_SALARIO_ATUAL * 1.25 ;
BEGIN 
    dbms_output.put_line(V_SALARIO_NOVO);
END;

--------------------------------------------------------------------------------

DECLARE 
    valorDolar number := 5.50;
    valorEmReais number;
BEGIN 
    dbms_output.put_line('O valor de 45 dolares em reais é: R$ ' || to_char(valorDolar * 45));
END;





