SET SERVEROUTPUT ON;

DECLARE 
    
    GENERO VARCHAR2(30) := '&DIGITEOSEXO';
    
BEGIN 
    
    IF UPPER(GENERO) = 'M' THEN
    dbms_output.put_line('O GENERO DIGITADO É MASCULINO');
    
    ELSIF UPPER(GENERO) = 'F' THEN
    dbms_output.put_line('O GENERO DIGITADO É FEMININO');

    ELSE 
    dbms_output.put_line('VALOR INVÁLIDO');    
    
    END IF;
END;


----------------------------------------------------------------------------------------

DECLARE 
    
    NUMERO NUMBER := &DIGITEUMNUMERO;
    
BEGIN 
    
    IF MOD(NUMERO, 2) = 0 THEN
    dbms_output.put_line('O NUMERO É PAR');
    
    ELSIF MOD(NUMERO, 2) != 0  THEN
    dbms_output.put_line('O NUMERO É IMPAR');

    ELSE 
    dbms_output.put_line('NUMERO INVALIDO');    
    
    END IF;
END;
