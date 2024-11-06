CREATE TABLE cliente (
    id_cliente INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Telefone_Clientes (
    telefone VARCHAR(20) PRIMARY KEY,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE Endereco_Clientes (
    endereço VARCHAR(255) PRIMARY KEY,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
);


CREATE TABLE prato (
    id_prato INT IDENTITY(1,1) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ingrediente (
    id_ingrediente INT IDENTITY(1,1) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE encomenda (
    id_encomenda INT IDENTITY(1,1) PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_encomenda (
    id_item_encomenda INT IDENTITY(1,1) PRIMARY KEY AUTO_INCREMENT,
    id_encomenda INT,
    id_prato INT,
    quantidade INT,
    FOREIGN KEY (id_encomenda) REFERENCES encomenda(id_encomenda),
    FOREIGN KEY (id_prato) REFERENCES prato(id_prato)
);

CREATE TABLE composto_por (
    id_prato INT,
    id_ingrediente INT,
    quantidade DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_prato, id_ingrediente),
    FOREIGN KEY (id_prato) REFERENCES prato(id_prato),
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente)
);

CREATE TABLE compra (
    id_compra INT IDENTITY(1,1) PRIMARY KEY AUTO_INCREMENT,
    data DATETIME NOT NULL,
    fornecedor VARCHAR(100) NOT NULL,
    nota_fiscal VARCHAR(50) NOT NULL
);

CREATE TABLE item_compra (
    id_item_compra INT IDENTITY(1,1) PRIMARY KEY AUTO_INCREMENT,
    id_compra INT,
    id_ingrediente INT,
    quantidade DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente)
);

CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE produto_fornecido (
    id_fornecedor INT NOT NULL,
    tipo_produto VARCHAR(100) NOT NULL,
    quantidade DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_fornecedor, tipo_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE contato_fornecedor (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,  
    id_fornecedor INT NOT NULL,                 
    tipo VARCHAR(50) NOT NULL,                  
    valor VARCHAR(100) NOT NULL,                
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);



-- Populando a tabela cliente
INSERT INTO cliente (nome) 
VALUES 
('João Silva'), 
('Maria Oliveira'), 
('Carlos Santos'), 
('Ana Costa'),
('Pedro Souza'), 
('Lucia Mendes'),
('Fernando Lima'),
('Clara Duarte');

-- Populando a tabela Telefone_Clientes
INSERT INTO Telefone_Clientes (telefone, id_cliente)
VALUES 
('(11) 98765-4321', 1), 
('(21) 91234-5678', 2), 
('(31) 99876-5432', 3), 
('(41) 99887-6655', 4),
('(11) 96543-2109', 5),
('(21) 97654-3210', 6),
('(31) 94321-9876', 7),
('(41) 93210-8765', 8);

-- Populando a tabela Endereco_Clientes
INSERT INTO Endereco_Clientes (endereço, id_cliente)
VALUES 
('Rua A, 123', 1), 
('Av. B, 456', 2), 
('Rua C, 789', 3), 
('Praça D, 101', 4),
('Rua E, 202', 5),
('Av. F, 303', 6),
('Rua G, 404', 7),
('Praça H, 505', 8);

-- Populando a tabela prato
INSERT INTO prato (nome, preco)
VALUES 
('Lasanha', 35.50), 
('Pizza Margherita', 42.00), 
('Hambúrguer', 25.99), 
('Salada Caesar', 18.75),
('Risoto', 29.90),
('Bife à Parmegiana', 32.50);

-- Populando a tabela ingrediente
INSERT INTO ingrediente (nome)
VALUES 
('Queijo'), 
('Tomate'), 
('Carne'), 
('Alface'), 
('Molho Caesar'),
('Arroz'), 
('Frango'), 
('Molho Branco');

-- Populando a tabela encomenda
INSERT INTO encomenda (id_cliente, data)
VALUES 
(1, '2024-10-01'), 
(2, '2024-10-02'), 
(3, '2024-10-03'), 
(4, '2024-10-04'),
(5, '2024-10-05'),
(6, '2024-10-06'),
(7, '2024-10-07'),
(8, '2024-10-08');

-- Populando a tabela item_encomenda com 20 unidades cada
INSERT INTO item_encomenda (id_encomenda, id_prato, quantidade)
VALUES 
(1, 1, 20), -- Encomenda 1 com Lasanha
(2, 2, 20), -- Encomenda 2 com Pizza Margherita
(3, 3, 20), -- Encomenda 3 com Hambúrguer
(4, 4, 20), -- Encomenda 4 com Salada Caesar
(5, 5, 20), -- Encomenda 5 com Risoto
(6, 6, 20), -- Encomenda 6 com Bife à Parmegiana
(7, 1, 20), -- Encomenda 7 com Lasanha
(8, 2, 20); -- Encomenda 8 com Pizza Margherita

-- Populando a tabela composto_por com 20 unidades de cada ingrediente para os pratos
INSERT INTO composto_por (id_prato, id_ingrediente, quantidade)
VALUES 
(1, 1, 20), -- Lasanha com 20 unidades de Queijo
(1, 2, 20), -- Lasanha com 20 unidades de Tomate
(2, 2, 20), -- Pizza Margherita com 20 unidades de Tomate
(2, 1, 20), -- Pizza Margherita com 20 unidades de Queijo
(3, 3, 20), -- Hambúrguer com 20 unidades de Carne
(4, 4, 20), -- Salada Caesar com 20 unidades de Alface
(4, 5, 20), -- Salada Caesar com 20 unidades de Molho Caesar
(5, 6, 20), -- Risoto com 20 unidades de Arroz
(5, 7, 20), -- Risoto com 20 unidades de Frango
(6, 3, 20), -- Bife à Parmegiana com 20 unidades de Carne
(6, 1, 20); -- Bife à Parmegiana com 20 unidades de Queijo

-- Populando a tabela compra
INSERT INTO compra (data, fornecedor, nota_fiscal)
VALUES 
('2024-10-01 10:30:00', 'Fornecedor X', 'NF12345'), 
('2024-10-02 12:45:00', 'Fornecedor Y', 'NF67890'),
('2024-10-03 09:15:00', 'Fornecedor Z', 'NF54321'),
('2024-10-04 11:00:00', 'Fornecedor W', 'NF98765');

-- Populando a tabela item_compra com 20 unidades de cada ingrediente comprados
INSERT INTO item_compra (id_compra, id_ingrediente, quantidade)
VALUES 
(1, 1, 20), -- Compra de 20 unidades de Queijo
(1, 2, 20), -- Compra de 20 unidades de Tomate
(2, 3, 20), -- Compra de 20 unidades de Carne
(2, 4, 20), -- Compra de 20 unidades de Alface
(3, 5, 20), -- Compra de 20 unidades de Molho Caesar
(3, 6, 20), -- Compra de 20 unidades de Arroz
(4, 7, 20), -- Compra de 20 unidades de Frango
(4, 8, 20); -- Compra de 20 unidades de Molho Branco
