SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS dbgestaofisiconutricional;
create DATABASE dbgestaofisiconutricional;
use dbgestaofisiconutricional;

CREATE TABLE `alimento` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor_calorico` int(10) NOT NULL,
  `valor_gordura` int(10) NOT NULL,
  `valor_proteina` int(10) NOT NULL,
  `valor_carboidrato` int(10) NOT NULL,
  `ativo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cardapio` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `alimento_cardapio` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `alimento_id` int(11) NOT NULL,
  `cardapio_id` int(11) NOT NULL,
  `quantidade` decimal(10, 2) NOT NULL,
  CONSTRAINT `fk_alimento` FOREIGN KEY(alimento_id) REFERENCES alimento(id),
  CONSTRAINT `fk_cardapio` FOREIGN KEY(cardapio_id) REFERENCES cardapio(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `atividade_fisica` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `descricaoo` varchar(100) NOT NULL,
  `gasto_calorico` int(10) NOT NULL,
  `ativo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;