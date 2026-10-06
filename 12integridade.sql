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

INSERT INTO clientes(  nome,
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