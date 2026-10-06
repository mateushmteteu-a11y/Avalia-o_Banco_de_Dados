#parte 14
SELECT 
    m.nome AS mecanico,
    COUNT(DISTINCT os.id_os) AS quantidade_ordens,
    SUM(its.quantidade) AS quantidade_servicos,
    SUM(its.quantidade * its.preco_cobrado) AS valor_total
FROM mecanico m
JOIN ordemDeServico os ON m.mecanico_id = os.mecanico_id
JOIN itensDeServico its ON os.id_os = its.os_id
GROUP BY m.mecanico_id, m.nome
HAVING valor_total = (
    SELECT MAX(sub.total_faturado)
    FROM (
        SELECT SUM(its2.quantidade * its2.preco_cobrado) AS total_faturado
        FROM ordemDeServico os2
        JOIN itensDeServico its2 ON os2.id_os = its2.os_id
        GROUP BY os2.mecanico_id
    ) AS sub
);
