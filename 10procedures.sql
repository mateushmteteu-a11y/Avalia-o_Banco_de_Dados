#parte 10
DELIMITER $$

CREATE PROCEDURE cadastrar_cliente(
    IN p_nome VARCHAR(255),
    IN p_telefone VARCHAR(20),
    IN p_endereco VARCHAR(255)
)
BEGIN

    IF p_nome IS NULL OR p_nome = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O nome do cliente é obrigatório';
    END IF;

    INSERT INTO clientes (nome, telefone, endereco)
    VALUES (p_nome, p_telefone, p_endereco);

END $$


CREATE PROCEDURE abrir_ordem(
    IN p_carro_id INT,
    IN p_mecanico_id INT
)
BEGIN

    IF NOT EXISTS (
        SELECT 1
        FROM veiculos
        WHERE carro_id = p_carro_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Veículo não encontrado';
    END IF;

    INSERT INTO ordemDeServico (
        carro_id,
        mecanico_id,
        status_os
    )
    VALUES (
        p_carro_id,
        p_mecanico_id,
        'Em Aberto'
    );

END $$


CREATE PROCEDURE alterar_status_ordem(
    IN p_id_os INT,
    IN p_status VARCHAR(255)
)
BEGIN

    IF NOT EXISTS (
        SELECT 1
        FROM ordemDeServico
        WHERE id_os = p_id_os
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ordem de serviço não encontrada';
    END IF;

    UPDATE ordemDeServico
    SET status_os = p_status
    WHERE id_os = p_id_os;

END $$


CREATE PROCEDURE adicionar_servico_ordem(
    IN p_os_id INT,
    IN p_servico_id INT,
    IN p_quantidade INT
)
BEGIN

    DECLARE valor DECIMAL(10,2);

    IF p_quantidade <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A quantidade deve ser maior que zero';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM ordemDeServico
        WHERE id_os = p_os_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ordem de serviço não encontrada';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM servico
        WHERE id_servico = p_servico_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Serviço não encontrado';
    END IF;

    SELECT preco
    INTO valor
    FROM servico
    WHERE id_servico = p_servico_id;

    INSERT INTO itensDeServico (
        os_id,
        servico_id,
        quantidade,
        preco_cobrado
    )
    VALUES (
        p_os_id,
        p_servico_id,
        p_quantidade,
        valor
    );

END $$

DELIMITER ;
