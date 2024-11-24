-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/11/2024 às 19:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `restaurantegula`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `composto_por`
--

CREATE TABLE `composto_por` (
  `id_prato` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `quantidade` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `fornecedor` varchar(100) NOT NULL,
  `nota_fiscal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato_fornecedor`
--

CREATE TABLE `contato_fornecedor` (
  `id_contato` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `valor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contato_fornecedor`
--

INSERT INTO `contato_fornecedor` (`id_contato`, `id_fornecedor`, `tipo`, `valor`) VALUES
(1, 1, 'Email', 'joao@gmail.com'),
(2, 2, 'Email', 'joao@gmail.com'),
(3, 3, 'telefone', '18996430853'),
(4, 4, 'Email', 'joao@gmail.com'),
(5, 5, 'Email', 'joao@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `encomenda`
--

CREATE TABLE `encomenda` (
  `id_encomenda` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco_clientes`
--

CREATE TABLE `endereco_clientes` (
  `id_endereco` int(11) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf_cnpj` varchar(20) NOT NULL,
  `endereco` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `nome`, `cpf_cnpj`, `endereco`) VALUES
(1, 'Luan da silva', '1444444', 'João da manha'),
(2, 'LuanS', '12312312312', 'João da manha'),
(3, 'João beta', '555555555', 'João da manha'),
(4, 'Matheus', '31313123131', 'Rua da agua'),
(5, 'Claudio Matheus', '31313123131', 'Rua da agua');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id_ingrediente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `quantidade` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ingrediente`
--

INSERT INTO `ingrediente` (`id_ingrediente`, `nome`, `quantidade`) VALUES
(1, 'Carne de boi', 15.00),
(2, 'Pão brioche', 20.00),
(4, 'Limão', 1.00),
(5, 'Carne de boi', 15.00),
(6, 'Pão brioche', 12.00),
(7, 'Linguiça', 12.00),
(8, 'Linguiça de porco', 12.00),
(9, 'Linguiça de vaca', 12.00),
(10, 'Linguiça de bode', 12.00),
(11, 'Maça', 2.00),
(12, 'Ketchup (sache)', 20.00),
(13, 'Mostarda (sache)', 20.00),
(14, 'Limão Lima', 12.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_compra`
--

CREATE TABLE `item_compra` (
  `id_item_compra` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_ingrediente` int(11) DEFAULT NULL,
  `quantidade` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_encomenda`
--

CREATE TABLE `item_encomenda` (
  `id_item_encomenda` int(11) NOT NULL,
  `id_encomenda` int(11) DEFAULT NULL,
  `id_prato` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `prato`
--

CREATE TABLE `prato` (
  `id_prato` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `prato`
--

INSERT INTO `prato` (`id_prato`, `nome`, `preco`) VALUES
(1, 'Lanche frio', 10.00),
(2, 'Lanche frio', 10.00),
(3, 'Lanche frio', 10.00),
(4, 'Lanche frio', 10.00),
(5, 'Lanche frio', 10.00),
(6, 'Lanche frio', 10.00),
(7, 'Lanche frio', 10.00),
(8, 'Lanche frio', 10.00),
(9, 'Lanche frio', 10.00),
(10, 'asxsa', 2.00),
(11, 'Asa de galinha', 10.00),
(12, 'Asa de galinha', 10.00),
(13, 'Teste', 123.00),
(14, 'Lanche frio', 123.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_fornecido`
--

CREATE TABLE `produto_fornecido` (
  `id_fornecedor` int(11) NOT NULL,
  `tipo_produto` varchar(100) NOT NULL,
  `quantidade` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto_fornecido`
--

INSERT INTO `produto_fornecido` (`id_fornecedor`, `tipo_produto`, `quantidade`) VALUES
(1, 'Sabão em pó', 1.00),
(2, 'Sabão em pó', 1.00),
(3, 'Pamonha', 1.00),
(4, 'Agua', 1.00),
(5, 'Agua', 1.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone_clientes`
--

CREATE TABLE `telefone_clientes` (
  `id_telefone` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `composto_por`
--
ALTER TABLE `composto_por`
  ADD PRIMARY KEY (`id_prato`,`id_ingrediente`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Índices de tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`);

--
-- Índices de tabela `contato_fornecedor`
--
ALTER TABLE `contato_fornecedor`
  ADD PRIMARY KEY (`id_contato`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- Índices de tabela `encomenda`
--
ALTER TABLE `encomenda`
  ADD PRIMARY KEY (`id_encomenda`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `endereco_clientes`
--
ALTER TABLE `endereco_clientes`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id_ingrediente`);

--
-- Índices de tabela `item_compra`
--
ALTER TABLE `item_compra`
  ADD PRIMARY KEY (`id_item_compra`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Índices de tabela `item_encomenda`
--
ALTER TABLE `item_encomenda`
  ADD PRIMARY KEY (`id_item_encomenda`),
  ADD KEY `id_encomenda` (`id_encomenda`),
  ADD KEY `id_prato` (`id_prato`);

--
-- Índices de tabela `prato`
--
ALTER TABLE `prato`
  ADD PRIMARY KEY (`id_prato`);

--
-- Índices de tabela `produto_fornecido`
--
ALTER TABLE `produto_fornecido`
  ADD PRIMARY KEY (`id_fornecedor`,`tipo_produto`);

--
-- Índices de tabela `telefone_clientes`
--
ALTER TABLE `telefone_clientes`
  ADD PRIMARY KEY (`id_telefone`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contato_fornecedor`
--
ALTER TABLE `contato_fornecedor`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `encomenda`
--
ALTER TABLE `encomenda`
  MODIFY `id_encomenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco_clientes`
--
ALTER TABLE `endereco_clientes`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `item_compra`
--
ALTER TABLE `item_compra`
  MODIFY `id_item_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_encomenda`
--
ALTER TABLE `item_encomenda`
  MODIFY `id_item_encomenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `prato`
--
ALTER TABLE `prato`
  MODIFY `id_prato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `telefone_clientes`
--
ALTER TABLE `telefone_clientes`
  MODIFY `id_telefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `composto_por`
--
ALTER TABLE `composto_por`
  ADD CONSTRAINT `composto_por_ibfk_1` FOREIGN KEY (`id_prato`) REFERENCES `prato` (`id_prato`),
  ADD CONSTRAINT `composto_por_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`);

--
-- Restrições para tabelas `contato_fornecedor`
--
ALTER TABLE `contato_fornecedor`
  ADD CONSTRAINT `contato_fornecedor_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);

--
-- Restrições para tabelas `encomenda`
--
ALTER TABLE `encomenda`
  ADD CONSTRAINT `encomenda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Restrições para tabelas `endereco_clientes`
--
ALTER TABLE `endereco_clientes`
  ADD CONSTRAINT `endereco_clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Restrições para tabelas `item_compra`
--
ALTER TABLE `item_compra`
  ADD CONSTRAINT `item_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  ADD CONSTRAINT `item_compra_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`);

--
-- Restrições para tabelas `item_encomenda`
--
ALTER TABLE `item_encomenda`
  ADD CONSTRAINT `item_encomenda_ibfk_1` FOREIGN KEY (`id_encomenda`) REFERENCES `encomenda` (`id_encomenda`),
  ADD CONSTRAINT `item_encomenda_ibfk_2` FOREIGN KEY (`id_prato`) REFERENCES `prato` (`id_prato`);

--
-- Restrições para tabelas `produto_fornecido`
--
ALTER TABLE `produto_fornecido`
  ADD CONSTRAINT `produto_fornecido_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);

--
-- Restrições para tabelas `telefone_clientes`
--
ALTER TABLE `telefone_clientes`
  ADD CONSTRAINT `telefone_clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

DELIMITER $$

CREATE TRIGGER AtualizarEstoqueIngredientes 
AFTER INSERT ON item_encomenda
FOR EACH ROW
BEGIN
    DECLARE ingrediente_id INT;
    DECLARE quantidade_usada DECIMAL(10, 2);

    DECLARE cur_ingredientes CURSOR FOR 
        SELECT id_ingrediente, quantidade * NEW.quantidade
        FROM composto_por
        WHERE id_prato = NEW.id_prato;

    OPEN cur_ingredientes;
    ingrediente_loop: LOOP
        FETCH cur_ingredientes INTO ingrediente_id, quantidade_usada;
        IF NOT FOUND THEN
            LEAVE ingrediente_loop;
        END IF;

        -- Atualiza o estoque do ingrediente
        UPDATE ingrediente
        SET quantidade = quantidade - quantidade_usada
        WHERE id_ingrediente = ingrediente_id;

        -- Verifica se o estoque ficou negativo
        IF (SELECT quantidade FROM ingrediente WHERE id_ingrediente = ingrediente_id) < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Estoque insuficiente para um ou mais ingredientes.';
        END IF;
    END LOOP;

    CLOSE cur_ingredientes;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE VerificarStatusPedido (
    IN pedido_id INT
)
BEGIN
    SELECT 
        e.id_encomenda AS PedidoID,
        c.nome AS Cliente,
        e.data AS DataPedido,
        p.nome AS Prato,
        ie.quantidade AS Quantidade
    FROM encomenda e
    JOIN cliente c ON e.id_cliente = c.id_cliente
    JOIN item_encomenda ie ON e.id_encomenda = ie.id_encomenda
    JOIN prato p ON ie.id_prato = p.id_prato
    WHERE e.id_encomenda = pedido_id;
END$$

DELIMITER ;
