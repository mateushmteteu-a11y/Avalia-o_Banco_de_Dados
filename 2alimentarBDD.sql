#Parte 3
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
