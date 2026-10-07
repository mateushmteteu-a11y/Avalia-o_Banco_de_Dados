#parte 7
# Quantidade de veiculos por cliente
SELECT
    c.nome AS cliente,
    COUNT(v.carro_id) AS quantidade_veiculos
FROM clientes c
LEFT JOIN veiculos v ON c.id = v.cliente_id
GROUP BY c.id, c.nome;
 
# Quantidade de ordens atendidas pelo mecânico
SELECT
    m.nome AS mecanico,
    COUNT(o.id_os) AS quantidade_ordens
FROM mecanico m
LEFT JOIN ordemDeServico o ON m.mecanico_id = o.mecanico_id
GROUP BY m.mecanico_id, m.nome;
 
# o Having abaixo
SELECT
    m.nome AS mecanico,
    COUNT(o.id_os) AS quantidade_ordens
FROM mecanico m
INNER JOIN ordemDeServico o
    ON m.mecanico_id = o.mecanico_id
GROUP BY m.mecanico_id, m.nome
HAVING COUNT(o.id_os) > 1;
 
# Adiciona isso pra não retornar vazio
INSERT INTO ordemDeServico
(carro_id, mecanico_id, status_os)
VALUES
(11, 1, 'Em Aberto'),
(12, 2, 'Em Aberto');