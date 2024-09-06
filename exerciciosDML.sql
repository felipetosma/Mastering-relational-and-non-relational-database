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

NUMEROALUNO NUMBER := &RA;
NOMEALUNO VARCHAR2(50);

BEGIN
    SELECT
        ra,
        nome
    INTO
        numeroaluno,
        nomealuno
    FROM
        aluno
    
    WHERE RA = numeroaluno;

dbms_output.put_line('O CODIGO DE CADASTRO DO ALUNO É:'
                     || numeroaluno
                     || 'NOME DO ALUNO: '
                     || nomealuno);
    END;
