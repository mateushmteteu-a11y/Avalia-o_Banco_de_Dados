#parte 9
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
 
# Serviços mais caros que o serviço "Troca de Óleo e Filtro"
SELECT
    descricao,
    preco
FROM servico
WHERE preco > (
    SELECT preco
    FROM servico
    WHERE descricao = 'Troca de Óleo e Filtro'
);
