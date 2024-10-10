create or replace PROCEDURE prc_insere_produto (
    v_codigo           produto.cod_produto%TYPE,
    v_nom_produto      produto.nom_produto%TYPE,
    v_barra            produto.cod_barra%TYPE,
    v_sta_ativo        produto.sta_ativo%TYPE,
    v_dat_cadastro     produto.dat_cadastro%TYPE,
    v_dat_cancelamento produto.dat_cancelamento%TYPE
) IS
    max_caract EXCEPTION;
    sem_numeros EXCEPTION;
BEGIN 
    if length(v_NOM_PRODUTO) > 3 then
    raise max_caract;
    
    ELSIF Regexp_Like(v_NOM_PRODUTO,'[0:9]') then
    raise sem_numeros;
        
    else
    INSERT INTO produto (
        cod_produto,
        nom_produto,
        cod_barra,
        sta_ativo,
        dat_cadastro,
        dat_cancelamento
    ) VALUES (
        v_codigo,
        v_nom_produto,
        v_barra,
        v_sta_ativo,
        v_dat_cadastro,
        v_dat_cancelamento
    );
    end if;

EXCEPTION
    WHEN max_caract THEN
    dbms_output.put_line('O nome do produto não pode ter mais de 3 caracteres');
    when sem_numeros THEN
    dbms_output.put_line('O nome do produto não pode conter numeros');

commit;   
end;
    
