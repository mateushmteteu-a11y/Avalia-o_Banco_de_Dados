#parte 5
# Listar Clientes
 
SELECT id, nome, telefone, endereco
FROM clientes
ORDER BY nome ASC;
 
 
# Localizar veículos de um cliente
 
SELECT v.placa, v.modelo, v.cliente_id
FROM veiculos v
JOIN clientes c ON c.id = v.cliente_id
WHERE c.nome = 'Carlos Silva';
 
 
# Serviços acima de R$ 200
 
select descricao, preco
from servico
where preco > 200
order by preco desc;
 
 
# Serviços entre R$ 100 e R$ 200
 
select descricao, preco
from servico
where preco >= 100 AND preco <= 500
order by preco ASC;
 
 
# Clientes por inicial do nome
 
select nome, telefone
from clientes
where nome like 'A%'
order by nome ASC;
 
 
# Ordens abertas
 
select id_os, carro_id, status_os, data_emissao
from ordemDeServico
where status_os in ('Concluído', 'Em Andamento', 'Em Aberto', 'Aguardando Peça')
order by data_emissao ASC;
 
 
# Cinco serviços mais caros
 
select descricao, preco
from servico
order by preco ASC
limit 5;
