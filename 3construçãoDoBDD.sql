#Parte 2
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
