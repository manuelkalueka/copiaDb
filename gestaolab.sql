-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Jun-2023 às 18:22
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gestaolab`
--
CREATE DATABASE IF NOT EXISTS `gestaolab` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestaolab`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL,
  `nome_disciplina` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classe` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id`, `nome_disciplina`, `classe`) VALUES
(1, 'Técnicas e Linguagens de Programação', '11'),
(2, 'Técnicas e Linguagens de Programação', '12'),
(3, 'Tecnologias de Informação e Comunicação', '11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `horarios_uso`
--

CREATE TABLE `horarios_uso` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intervalo_tempo` time NOT NULL,
  `observacoes` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais`
--

CREATE TABLE `materiais` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `marca` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Sem marca',
  `modelo` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Sem modelo',
  `tipo_material` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` enum('Danificado','Bom','Rasoável') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Bom',
  `data_compra` date NOT NULL,
  `capacidade` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Não definido',
  `tem_programas` enum('Sim','Não','Não definido') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Não definido',
  `mesa` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `CreateAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `observacoes` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `materiais`
--

INSERT INTO `materiais` (`id`, `nome`, `marca`, `modelo`, `tipo_material`, `estado`, `data_compra`, `capacidade`, `tem_programas`, `mesa`, `username`, `CreateAt`, `UpdateAt`, `observacoes`) VALUES
(1, 'Meu Material Novo', 'Sem marca', 'Sem modelo', 'key', 'Rasoável', '1899-11-27', 'Não definido', 'Não', 1, 0, '2023-06-19 23:59:14', '2023-06-19 23:59:14', 'Mouse com problemas'),
(9, 'PC para Gestao', 'HP', 'HP Pavillon', 'pc', 'Bom', '2023-06-15', 'Win10 Pro, RAM 4GB, 1TB, i5-345, 2,5Hz', 'Não', 11, 0, '2023-06-21 17:46:44', '2023-06-21 17:46:44', 'Meu novo comentario'),
(11, 'Meu Material Novo', 'Sem marca', 'Sem modelo', 'pc', 'Rasoável', '2023-06-23', 'Ram de 4GB, HD 250GB, Intel 2,5GHz', 'Sim', 1, 0, '2023-06-21 18:04:22', '2023-06-21 18:04:22', ''),
(13, 'Meu Material Novo', 'Sem marca', 'Sem modelo', 'pc', 'Danificado', '2023-06-30', 'Ram de 4GB, HD 250GB, Intel 2,5GHz', 'Sim', 1, 0, '2023-06-21 18:09:34', '2023-06-21 18:09:34', ''),
(22, 'kalueka2', 'Sem marca', 'Sem modelo', 'oth', 'Bom', '0000-00-00', 'Não definido', 'Não definido', 1, 0, '2023-06-21 23:34:16', '2023-06-21 23:34:16', ''),
(23, 'Mais um registo', 'Sem marca', 'Sem modelo', 'mo', 'Bom', '2023-06-16', 'Não definido', 'Não definido', 1, 0, '2023-06-22 00:35:33', '2023-06-22 00:35:33', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `nome` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num_maximo_pc` int(11) NOT NULL,
  `CreateAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UpdateAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Cheia','Vazia','Espaço Livre') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Espaço Livre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `mesas`
--

INSERT INTO `mesas` (`id`, `nome`, `num_maximo_pc`, `CreateAt`, `UpdateAt`, `estado`) VALUES
(1, 'Mesa 1', 0, '2023-06-15 23:00:00', '2023-06-15 23:00:00', 'Espaço Livre'),
(11, 'Mesa do Kalueka', 0, '2023-06-20 13:28:35', '2023-06-20 13:28:35', 'Vazia'),
(15, 'Nova Mesa', 0, '2023-06-23 15:36:24', '2023-06-23 15:36:24', 'Espaço Livre'),
(16, 'Mesa 2', 2, '2023-06-23 16:12:43', '2023-06-23 15:45:51', 'Espaço Livre');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perdidos_achados`
--

CREATE TABLE `perdidos_achados` (
  `id` int(11) NOT NULL,
  `descricao` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `categoria` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data_perda` date NOT NULL,
  `data_achado` date NOT NULL,
  `usuario` int(11) NOT NULL,
  `observacoes` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `estado` enum('Perdido','Achado') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Perdido',
  `dono` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorios`
--

CREATE TABLE `relatorios` (
  `id` int(11) NOT NULL,
  `tipo_relatorio` varchar(50) NOT NULL,
  `data_criacao` date NOT NULL DEFAULT current_timestamp(),
  `enderenco_fisico` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `observacoes` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_materiais`
--

CREATE TABLE `tipos_materiais` (
  `codigo_tipo_material` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nome` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tipos_materiais`
--

INSERT INTO `tipos_materiais` (`codigo_tipo_material`, `nome`) VALUES
('key', 'Teclado'),
('mo', 'Mouse'),
('oth', 'Outro'),
('pc', 'Computador'),
('up', 'UPS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome_completo` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bi` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `genero` enum('Masculino','Feminino','M','F') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_conta` enum('Professor','convidado','administrador','Aluno') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Professor',
  `estado` enum('Activo','Inativo') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome_completo`, `bi`, `genero`, `username`, `password`, `tipo_conta`, `estado`) VALUES
(1, 'Pedro Manuel Kalueka', '00000000000000', 'Masculino', 'admin', '$2a$10$qeoDOVjznDCr3fj6zOa/Y.A52x1AheBpB8DoeGXnmej5JTZjGbScO', 'administrador', 'Activo'),
(3, 'Carlos Manuel', '008771113UE045', 'Masculino', 'carlos', '$2a$10$OIzcXvOHrMsXDwR8SH1LlOoGD23OJD5Mmeidh4nKwMyXezo8EUgwC', 'convidado', 'Activo');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `horarios_uso`
--
ALTER TABLE `horarios_uso`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `materiais`
--
ALTER TABLE `materiais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_material` (`tipo_material`),
  ADD KEY `mesa` (`mesa`);

--
-- Índices para tabela `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices para tabela `perdidos_achados`
--
ALTER TABLE `perdidos_achados`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `relatorios`
--
ALTER TABLE `relatorios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipos_materiais`
--
ALTER TABLE `tipos_materiais`
  ADD PRIMARY KEY (`codigo_tipo_material`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `horarios_uso`
--
ALTER TABLE `horarios_uso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `materiais`
--
ALTER TABLE `materiais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `perdidos_achados`
--
ALTER TABLE `perdidos_achados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relatorios`
--
ALTER TABLE `relatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `materiais`
--
ALTER TABLE `materiais`
  ADD CONSTRAINT `mesa` FOREIGN KEY (`mesa`) REFERENCES `mesas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tipo_material` FOREIGN KEY (`tipo_material`) REFERENCES `tipos_materiais` (`codigo_tipo_material`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `perdidos_achados`
--
ALTER TABLE `perdidos_achados`
  ADD CONSTRAINT `perdidos_achados_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
