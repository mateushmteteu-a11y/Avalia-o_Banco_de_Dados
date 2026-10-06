#parte 8
SELECT
    c.nome AS cliente,
    v.modelo,
    v.placa
FROM clientes c
INNER JOIN veiculos v
    ON c.id = v.cliente_id;
 
# Agora adiciona a ordem, + cliente e + Veículo
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
 
# Aqui só a ordem conversando com o mecânico
SELECT
    o.id_os AS ordem,
    m.nome AS mecanico,
    o.status_os,
    o.data_emissao
FROM ordemDeServico o
INNER JOIN mecanico m
    ON o.mecanico_id = m.mecanico_id;
 
# A ordem + O serviço realizado
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
 
# Por fim a consulta completa
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
 
# Left Join Aqui
SELECT
    c.nome AS cliente,
    v.modelo AS veiculo,
    v.placa
FROM clientes c
LEFT JOIN veiculos v
    ON c.id = v.cliente_id;
 
# Explicação:
#Foi utilizado o LEFT JOIN para listar todos os clientes, mesmo aqueles que ainda não tem veículos cadastrados.
#Com INNER JOIN, seriam mostrados somente os clientes que possuem um veículo relacionado.
 