-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/03/2021 às 10:19
-- Versão do servidor: 10.5.9-MariaDB-log
-- Versão do PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cpp`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `crudcpp`
--

CREATE TABLE `crudcpp` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(36) NOT NULL,
  `mail` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `crudcpp`
--

INSERT INTO `crudcpp` (`id`, `nome`, `mail`) VALUES
(1, 'Marcos Oliveira', 'marcos@isocpp.org'),
(2, 'Bjarne Stroustroup', 'bjarne@stroustroup.com'),
(3, 'Tim Maia', 'tim@maia.com'),
(4, 'Elis Regina', 'super@man.io'),
(5, 'Mais Um', 'mais@um.com');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `crudcpp`
--
ALTER TABLE `crudcpp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `crudcpp`
--
ALTER TABLE `crudcpp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
