# Parte 11 - Triggers

ALTER TABLE ordemDeServico
ADD COLUMN data_finalizacao DATETIME;

CREATE TABLE historico_preco_servico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    servico_id INT,
    preco_anterior DECIMAL(10,2),
    preco_novo DECIMAL(10,2),
    data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (servico_id)
        REFERENCES servico(id_servico)
);

DELIMITER $$

CREATE TRIGGER trg_historico_preco
AFTER UPDATE ON servico
FOR EACH ROW
BEGIN

    IF OLD.preco <> NEW.preco THEN

        INSERT INTO historico_preco_servico (
            servico_id,
            preco_anterior,
            preco_novo,
            data_alteracao
        )
        VALUES (
            OLD.id_servico,
            OLD.preco,
            NEW.preco,
            NOW()
        );

    END IF;

END $$


CREATE TRIGGER trg_finalizar_ordem
BEFORE UPDATE ON ordemDeServico
FOR EACH ROW
BEGIN

    IF NEW.status_os = 'Finalizada'
       AND OLD.status_os <> 'Finalizada' THEN

        SET NEW.data_finalizacao = NOW();

    END IF;

END $$


CREATE TRIGGER trg_validar_preco_servico
BEFORE INSERT ON servico
FOR EACH ROW
BEGIN

    IF NEW.preco <= 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O preço do serviço deve ser maior que zero';

    END IF;

END $$

DELIMITER ;
