#parte 4
INSERT INTO clientes (nome, telefone, endereco)
VALUES ('Gabriel Lopes', '(48) 99999-1111', 'Florianópolis - SC');
INSERT INTO servico (descricao, preco) VALUES ('Troca de Bateria',300.00);
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
UPDATE clientes SET telefone = '(48) 99999-2222' WHERE nome = 'Gabriel Lopes';
SELECT * FROM clientes WHERE nome = 'Gabriel Lopes';
UPDATE servico SET preco = 350.00 WHERE descricao = 'Troca de Bateria';
SELECT * FROM servico WHERE descricao = 'Troca de Bateria';
DELETE FROM clientes WHERE nome = 'Gabriel Lopes';
DELETE FROM servico WHERE descricao = 'Troca de Bateria';

