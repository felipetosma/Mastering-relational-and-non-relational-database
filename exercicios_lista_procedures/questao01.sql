set SERVEROUTPUT on;
/*
1)Faça uma procedure chamada PRC_INSERE_PEDIDO_RMNNNNN para inserir dados na tabela de pedidos, valide os campos 
para que caso eles estejam incompletos lance um RAISE_APPLICATION_ERROR mostrando os dados que não estejam de acordo com as regras:
DAT_PEDIDO não pode ser maior que a DAT_ENTREGA
DAT_PEDIDO não pode ser superior a SYSDATE
VALOR PEDIDO não pode ser 0 ou inferior
Inclua tratamento de exceções necessárias, mas nestas use RAISE_APPLICATION_ERROR para mandar uma EXCEPTION para as rotinas
que chamem esta procedure. (nota:  cuidado com OTHERS pois caso um RAISE_APPLICATION_ERROR seja feito na seção de BEGIN irá provocá-lo)*/

CREATE OR REPLACE PROCEDURE prc_insere_pedido (
    v_cod_pedido             pedido.cod_pedido%TYPE,
    v_cod_pedido_relacionado pedido.cod_pedido_relacionado%TYPE,
    v_cod_cliente            pedido.cod_cliente%TYPE,
    v_cod_usuario            pedido.cod_usuario%TYPE,
    v_cod_vendedor           pedido.cod_vendedor%TYPE,
    v_dat_pedido             pedido.dat_pedido%TYPE,
    v_dat_cancelamento       pedido.dat_cancelamento%TYPE,
    v_dat_entrega            pedido.dat_entrega%TYPE,
    v_val_total_pedido       pedido.val_total_pedido%TYPE,
    v_val_desconto           pedido.val_desconto%TYPE,
    v_seq_endereco_cliente   pedido.seq_endereco_cliente%TYPE,
    v_status                 pedido.status%TYPE
) IS
    data_excep EXCEPTION;
    data_sysdate EXCEPTION;
    valor_pedido_0 EXCEPTION;
BEGIN
    IF v_dat_pedido > v_dat_entrega THEN
        RAISE data_excep;
    ELSIF v_dat_pedido > sysdate THEN
        RAISE data_sysdate;
    ELSIF v_val_total_pedido <= 0 THEN
        RAISE valor_pedido_0;
    ELSE
        INSERT INTO pedido (
            cod_pedido,
            cod_pedido_relacionado,
            cod_cliente,
            cod_usuario,
            cod_vendedor,
            dat_pedido,
            dat_cancelamento,
            dat_entrega,
            val_total_pedido,
            val_desconto,
            seq_endereco_cliente,
            status
        ) VALUES (
            v_cod_pedido,
            v_cod_pedido_relacionado,
            v_cod_cliente,
            v_cod_usuario,
            v_cod_vendedor,
            v_dat_pedido,
            v_dat_cancelamento,
            v_dat_entrega,
            v_val_total_pedido,
            v_val_desconto,
            v_seq_endereco_cliente,
            v_status
        );

    END IF;
EXCEPTION
    WHEN data_excep THEN
        raise_application_error(-20001, 'A data do pedido não pode ser maior que a data de entrega.');
    WHEN data_sysdate THEN
        raise_application_error(-20002, 'A data do pedido não pode ser superior a data atual.');
    WHEN valor_pedido_0 THEN
        raise_application_error(-20003, 'O valor do pedido não pode ser 0 ou inferior');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'Erro ao inserir o pedido: ' || sqlerrm);
        COMMIT;
END;


    
    
    
