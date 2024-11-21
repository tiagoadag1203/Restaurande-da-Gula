CREATE TABLE `cliente` (
    `id_cliente` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `cpf` VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE `Telefone_Clientes` (
    `id_telefone` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `telefone` VARCHAR(20) NOT NULL,
    `id_cliente` INT NOT NULL,
    FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`)
);

CREATE TABLE `Endereco_Clientes` (
    `id_endereco` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `endereco` VARCHAR(255) NOT NULL,
    `id_cliente` INT,
    FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`)
);

CREATE TABLE `prato` (
    `id_prato` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `preco` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE `ingrediente` (
    `id_ingrediente` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `quantidade` DECIMAL(10,2) NOT NULL
);

CREATE TABLE `encomenda` (
    `id_encomenda` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_cliente` INT,
    `data` DATE,
    FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`)
);

CREATE TABLE `item_encomenda` (
    `id_item_encomenda` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_encomenda` INT,
    `id_prato` INT,
    `quantidade` INT NOT NULL,
    FOREIGN KEY (`id_encomenda`) REFERENCES `encomenda`(`id_encomenda`),
    FOREIGN KEY (`id_prato`) REFERENCES `prato`(`id_prato`)
);

CREATE TABLE `composto_por` (
    `id_prato` INT,
    `id_ingrediente` INT,
    `quantidade` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`id_prato`, `id_ingrediente`),
    FOREIGN KEY (`id_prato`) REFERENCES `prato`(`id_prato`),
    FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente`(`id_ingrediente`)
);

CREATE TABLE `compra` (
    `id_compra` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `data` DATETIME NOT NULL,
    `fornecedor` VARCHAR(100) NOT NULL,
    `nota_fiscal` VARCHAR(50) NOT NULL
);

CREATE TABLE `item_compra` (
    `id_item_compra` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_compra` INT,
    `id_ingrediente` INT,
    `quantidade` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`id_compra`) REFERENCES `compra`(`id_compra`),
    FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente`(`id_ingrediente`)
);

CREATE TABLE `fornecedor` (
    `id_fornecedor` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `cpf_cnpj` VARCHAR(20) NOT NULL,
    `endereco` VARCHAR(255) NOT NULL
);

CREATE TABLE `produto_fornecido` (
    `id_fornecedor` INT NOT NULL,
    `tipo_produto` VARCHAR(100) NOT NULL,
    `quantidade` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`id_fornecedor`, `tipo_produto`),
    FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor`(`id_fornecedor`)
);

CREATE TABLE `contato_fornecedor` (
    `id_contato` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_fornecedor` INT NOT NULL,
    `tipo` VARCHAR(50) NOT NULL,
    `valor` VARCHAR(100) NOT NULL,
    FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor`(`id_fornecedor`)
);

-- Populando a tabela `cliente`
INSERT INTO `cliente` (`nome`, `cpf`) 
VALUES 
('João Silva', '12345678901'), 
('Maria Oliveira', '23456789012'), 
('Carlos Santos', '34567890123'), 
('Ana Costa', '45678901234'),
('Pedro Souza', '56789012345'), 
('Lucia Mendes', '67890123456'),
('Fernando Lima', '78901234567'),
('Clara Duarte', '89012345678');

-- Populando a tabela `Telefone_Clientes`
INSERT INTO `Telefone_Clientes` (`telefone`, `id_cliente`)
VALUES 
('(11) 98765-4321', 1), 
('(21) 91234-5678', 2), 
('(31) 99876-5432', 3), 
('(41) 99887-6655', 4),
('(11) 96543-2109', 5),
('(21) 97654-3210', 6),
('(31) 94321-9876', 7),
('(41) 93210-8765', 8);

-- Populando a tabela `Endereco_Clientes`
INSERT INTO `Endereco_Clientes` (`endereco`, `id_cliente`)
VALUES 
('Rua A, 123', 1), 
('Av. B, 456', 2), 
('Rua C, 789', 3), 
('Praça D, 101', 4),
('Rua E, 202', 5),
('Av. F, 303', 6),
('Rua G, 404', 7),
('Praça H, 505', 8);

-- Populando a tabela `prato`
INSERT INTO `prato` (`nome`, `preco`)
VALUES 
('Lasanha', 35.50), 
('Pizza Margherita', 42.00), 
('Hambúrguer', 25.99), 
('Salada Caesar', 18.75),
('Risoto', 29.90),
('Bife à Parmegiana', 32.50);

-- Populando a tabela `ingrediente`
INSERT INTO `ingrediente` (`nome`)
VALUES 
('Queijo'), 
('Tomate'), 
('Carne'), 
('Alface'), 
('Molho Caesar'),
('Arroz'), 
('Frango'), 
('Molho Branco');

-- Populando a tabela `encomenda`
INSERT INTO `encomenda` (`id_cliente`, `data`)
VALUES 
(1, '2024-10-01'), 
(2, '2024-10-02'), 
(3, '2024-10-03'), 
(4, '2024-10-04'),
(5, '2024-10-05'),
(6, '2024-10-06'),
(7, '2024-10-07'),
(8, '2024-10-08');


/*Trigger atualiza estoque */
DELIMITER $$

CREATE TRIGGER `AtualizarEstoqueIngredientes` 
AFTER INSERT ON `item_encomenda`
FOR EACH ROW
BEGIN
    DECLARE ingrediente_id INT;
    DECLARE quantidade_usada DECIMAL(10, 2);

    DECLARE cur_ingredientes CURSOR FOR 
        SELECT `id_ingrediente`, `quantidade` * NEW.`quantidade`
        FROM `composto_por`
        WHERE `id_prato` = NEW.`id_prato`;

    OPEN cur_ingredientes;
    ingrediente_loop: LOOP
        FETCH cur_ingredientes INTO ingrediente_id, quantidade_usada;
        IF NOT FOUND THEN
            LEAVE ingrediente_loop;
        END IF;

        /* Atualiza o estoque do ingrediente */
        UPDATE `ingrediente`
        SET `quantidade` = `quantidade` - quantidade_usada
        WHERE `id_ingrediente` = ingrediente_id;

        /* Verifica estoque negativo */
        IF (SELECT `quantidade` FROM `ingrediente` WHERE `id_ingrediente` = ingrediente_id) < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Estoque insuficiente para um ou mais ingredientes.';
        END IF;
    END LOOP;

    CLOSE cur_ingredientes;
END$$

DELIMITER $$

/*Trigger */

/* Procedure que verificar o status de um pedido */
CREATE PROCEDURE `VerificarStatusPedido` (
    IN `pedido_id` INT
)
BEGIN
    SELECT 
        e.`id_encomenda` AS `PedidoID`,
        c.`nome` AS `Cliente`,
        e.`data` AS `DataPedido`,
        p.`nome` AS `Prato`,
        ie.`quantidade` AS `Quantidade`
    FROM `encomenda` e
    JOIN `cliente` c ON e.`id_cliente` = c.`id_cliente`
    JOIN `item_encomenda` ie ON e.`id_encomenda` = ie.`id_encomenda`
    JOIN `prato` p ON ie.`id_prato` = p.`id_prato`
    WHERE e.`id_encomenda` = pedido_id;
END$$

/* Procedure que verificar o status de um pedido */