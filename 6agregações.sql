#parte 6
select count(*) as quant_clietes from clientes;
select count(*) as quant_veículos from veiculos;
select max(preco) as preço_mais_caro from servico;
select min(preco) as preço_mais_barato from servico;
select avg(preco) as media_preços from servico;
select sum(preco) as soma_preços from servico;
