CREATE TABLE aluno (
    ra   NUMBER PRIMARY KEY,
    nome VARCHAR2(50)
);

INSERT INTO aluno VALUES (
    1,
    'PEDRO SOARES'
);

INSERT INTO aluno VALUES (
    2,
    'GUSTAVO MAIA'
);

INSERT INTO aluno VALUES (
    3,
    'RAFAEL VIDA'
);

COMMIT;

SELECT
    *
FROM
    aluno;

SET SERVEROUTPUT ON;

DECLARE 
    numeroaluno NUMBER := &ra;

BEGIN
DELETE FROM ALUNO
WHERE RA = numeroaluno;

dbms_output.put_line('O CODIGO DE CADASTRO DO ALUNO É:'
                     || numeroaluno
                     || 'NOME DO ALUNO: '
                     || nomealuno);
COMMIT;    
END;