
CREATE DATABASE IF NOT EXISTS oficina;

USE oficina;

CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS mecanico (
    mecanico_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS veiculos (
    carro_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    modelo VARCHAR(255),
    placa VARCHAR(10),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS ordemDeServico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    carro_id INT,
    mecanico_id INT,
    data_emissao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_os VARCHAR(255),
    FOREIGN KEY (carro_id) REFERENCES veiculos(carro_id) ON DELETE CASCADE,
    FOREIGN KEY (mecanico_id) REFERENCES mecanico(mecanico_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS itensDeServico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    os_id INT,
    servico_id INT,
    quantidade INT DEFAULT 1,
    preco_cobrado DECIMAL(10, 2),
    FOREIGN KEY (os_id) REFERENCES ordemDeServico(id_os) ON DELETE CASCADE,
    FOREIGN KEY (servico_id) REFERENCES servico(id_servico)
);




INSERT INTO clientes (nome, telefone, endereco) VALUES
('Carlos Silva', '(11) 98888-1111', 'Av. Paulista, 1000 - SP'),
('Ana Oliveira', '(11) 98888-2222', 'Rua Augusta, 450 - SP'),
('Marcos Souza', '(21) 97777-3333', 'Av. Atlântica, 2500 - RJ'),
('Julia Lima', '(21) 97777-4444', 'Rua Voluntários da Pátria, 120 - RJ'),
('Roberto Santos', '(31) 96666-5555', 'Av. Afonso Pena, 3000 - BH'),
('Fernanda Costa', '(31) 96666-6666', 'Rua Bahia, 800 - BH'),
('Ricardo Pereira', '(41) 95555-7777', 'Av. Sete de Setembro, 1500 - Curitiba'),
('Beatriz Rodrigues', '(41) 95555-8888', 'Rua XV de Novembro, 600 - Curitiba'),
('Lucas Almeida', '(51) 94444-9999', 'Av. Ipiranga, 2000 - Porto Alegre'),
('Camila Ribeiro', '(51) 94444-0000', 'Rua dos Andradas, 350 - Porto Alegre');

INSERT INTO veiculos (cliente_id, modelo, placa) VALUES
(1, 'VW Gol', 'ABC-1234'),
(1, 'Honda Civic', 'XYZ-5678'),
(2, 'Fiat Uno', 'MNO-9012'),
(3, 'Chevrolet Onix', 'QWE-3456'),
(4, 'Ford Ka', 'RTY-7890'),
(5, 'Toyota Corolla', 'UIO-2345'),
(5, 'Hyundai HB20', 'PAS-6789'),
(6, 'Renault Sandero', 'DFG-0123'),
(7, 'Jeep Compass', 'JKL-4567'),
(8, 'Fiat Palio', 'ZXC-8901'),
(9, 'Chevrolet Cruze', 'VBN-2345'),
(10, 'VW Polo', 'FGH-5678');

INSERT INTO mecanico (nome, telefone) VALUES
('Raimundo Nonato (Mestre)', '(11) 91111-0001'),
('Pedro Alvares (Suspensão)', '(11) 91111-0002'),
('Sérgio Moro (Elétrica)', '(11) 91111-0003'),
('Fabiano Silva (Alinhamento)', '(11) 91111-0004'),
('André Souza (Motor)', '(11) 91111-0005');

INSERT INTO servico (descricao, preco) VALUES
('Troca de Óleo e Filtro', 150.00),
('Alinhamento e Balanceamento', 120.00),
('Troca de Pastilhas de Freio', 220.00),
('Carga de Gás do Ar Condicionado', 180.00),
('Limpeza de Bicos Injetores', 250.00),
('Revisão Sistema Elétrico', 190.00),
('Troca da Correia Dentada', 450.00),
('Reparo de Suspensão (Mão de Obra)', 350.00),
('Troca de Velas de Ignição', 130.00),
('Diagnóstico de Injeção Eletrônica', 100.00);

INSERT INTO ordemDeServico (carro_id, mecanico_id, data_emissao, status_os) VALUES
(1, 1, '2026-09-20 09:00:00', 'Concluído'),
(2, 5, '2026-09-21 10:30:00', 'Concluído'),
(3, 4, '2026-09-22 14:00:00', 'Concluído'),
(4, 2, '2026-09-24 08:15:00', 'Concluído'),
(5, 3, '2026-09-25 11:00:00', 'Em Andamento'),
(6, 1, '2026-09-25 15:45:00', 'Aguardando Peça'),
(7, 2, '2026-09-26 09:30:00', 'Em Aberto'),
(8, 5, '2026-09-27 10:00:00', 'Em Aberto'),
(9, 4, '2026-09-28 08:00:00', 'Em Andamento'),
(10, 3, '2026-09-28 13:20:00', 'Em Aberto');

INSERT INTO itensDeServico (os_id, servico_id, quantidade, preco_cobrado) VALUES
(1, 1, 1, 150.00),
(1, 10, 1, 100.00),
(2, 7, 1, 450.00),
(2, 9, 1, 130.00),
(3, 2, 1, 120.00),
(4, 3, 1, 220.00),
(4, 8, 1, 350.00),
(5, 6, 1, 190.00),
(6, 1, 1, 150.00),
(6, 9, 1, 175.00),
(7, 2, 1, 120.00),
(8, 4, 1, 180.00),
(9, 8, 1, 350.00),
(9, 2, 1, 120.00),
(10, 6, 1, 190.00);




INSERT INTO clientes (nome, telefone, endereco)
VALUES (
    'Gabriel Lopes',
    '(48) 99999-1111',
    'Florianópolis - SC'
);

INSERT INTO servico (descricao, preco)
VALUES (
    'Troca de Bateria',
    300.00
);

SELECT * FROM clientes;

SELECT
    ordemDeServico.id_os,
    veiculos.modelo,
    veiculos.placa,
    mecanico.nome AS mecanico,
    ordemDeServico.data_emissao,
    ordemDeServico.status_os
FROM ordemDeServico
INNER JOIN veiculos
    ON ordemDeServico.carro_id = veiculos.carro_id
LEFT JOIN mecanico
    ON ordemDeServico.mecanico_id = mecanico.mecanico_id;

UPDATE clientes
SET telefone = '(48) 99999-2222'
WHERE nome = 'Gabriel Lopes';

SELECT *
FROM clientes
WHERE nome = 'Gabriel Lopes';

UPDATE servico
SET preco = 350.00
WHERE descricao = 'Troca de Bateria';

SELECT *
FROM servico
WHERE descricao = 'Troca de Bateria';

DELETE FROM clientes
WHERE nome = 'Gabriel Lopes';

DELETE FROM servico
WHERE descricao = 'Troca de Bateria';


# Parte 6 - Funções de agregação

SELECT COUNT(*) FROM clientes;

SELECT COUNT(*) FROM veiculos;

SELECT MAX(preco) FROM servico;

SELECT MIN(preco) FROM servico;

SELECT AVG(preco) FROM servico;

SELECT SUM(preco) FROM servico;


# Parte 8 - JOINs

# Cliente + Veículo

SELECT
    c.nome AS cliente,
    v.modelo,
    v.placa
FROM clientes c
INNER JOIN veiculos v
    ON c.id = v.cliente_id;


# Ordem + Cliente + Veículo

SELECT
    o.id_os AS ordem,
    c.nome AS cliente,
    v.modelo AS veiculo,
    v.placa
FROM ordemDeServico o
INNER JOIN veiculos v
    ON o.carro_id = v.carro_id
INNER JOIN clientes c
    ON v.cliente_id = c.id;


# Ordem + Mecânico

SELECT
    o.id_os AS ordem,
    m.nome AS mecanico,
    o.status_os,
    o.data_emissao
FROM ordemDeServico o
INNER JOIN mecanico m
    ON o.mecanico_id = m.mecanico_id;


# Ordem + Serviço realizado

SELECT
    o.id_os AS ordem,
    s.descricao AS servico,
    i.quantidade,
    i.preco_cobrado
FROM ordemDeServico o
INNER JOIN itensDeServico i
    ON o.id_os = i.os_id
INNER JOIN servico s
    ON i.servico_id = s.id_servico;


# Consulta completa

SELECT
    c.nome AS cliente,
    v.modelo AS veiculo,
    v.placa,
    m.nome AS mecanico,
    s.descricao AS servico,
    i.preco_cobrado AS valor,
    o.data_emissao AS data,
    o.status_os AS status
FROM ordemDeServico o
INNER JOIN veiculos v
    ON o.carro_id = v.carro_id
INNER JOIN clientes c
    ON v.cliente_id = c.id
INNER JOIN mecanico m
    ON o.mecanico_id = m.mecanico_id
INNER JOIN itensDeServico i
    ON o.id_os = i.os_id
INNER JOIN servico s
    ON i.servico_id = s.id_servico;


# LEFT JOIN

SELECT
    c.nome AS cliente,
    v.modelo AS veiculo,
    v.placa
FROM clientes c
LEFT JOIN veiculos v
    ON c.id = v.cliente_id;


# Parte 9 - Subconsultas

# Serviços com preço acima da média geral

SELECT
    descricao,
    preco
FROM servico
WHERE preco > (
    SELECT AVG(preco)
    FROM servico
);


# Veículos de clientes que possuem mais de um veículo

SELECT
    modelo,
    placa,
    cliente_id
FROM veiculos
WHERE cliente_id IN (
    SELECT cliente_id
    FROM veiculos
    GROUP BY cliente_id
    HAVING COUNT(*) > 1
);


# Serviços mais caros que "Troca de Óleo e Filtro"

SELECT
    descricao,
    preco
FROM servico
WHERE preco > (
    SELECT preco
    FROM servico
    WHERE descricao = 'Troca de Óleo e Filtro'
);

# Parte 10 - Stored Procedures

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


# Parte 12 - Integridade do Banco

ALTER TABLE clientes
ADD COLUMN cpf VARCHAR(14) UNIQUE;

ALTER TABLE servico
ADD CONSTRAINT chk_preco_positivo
CHECK (preco > 0);


UPDATE clientes
SET cpf = '111.111.111-11'
WHERE id = 1;

UPDATE clientes
SET cpf = '222.222.222-22'
WHERE id = 2;


# CPF duplicado
# Proteção: UNIQUE

INSERT INTO clientes (
    nome,
    telefone,
    endereco,
    cpf
)
VALUES (
    'João da Silva',
    '(48) 99999-0000',
    'Florianópolis - SC',
    '111.111.111-11'
);


# Veículo para cliente inexistente
# Proteção: FOREIGN KEY

INSERT INTO veiculos (
    cliente_id,
    modelo,
    placa
)
VALUES (
    9999,
    'Fiat Argo',
    'AAA-0001'
);


# Preço inválido
# Proteção: CHECK e Trigger

INSERT INTO servico (
    descricao,
    preco
)
VALUES (
    'Troca de Filtro',
    -100
);


# Exclusão de registro referenciado
# Proteção: FOREIGN KEY

DELETE FROM servico
WHERE id_servico = 1;


# Ordem para veículo inexistente
# Proteção: Procedure e FOREIGN KEY

CALL abrir_ordem(9999, 1);