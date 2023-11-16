-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Nov-2023 às 00:06
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
-- Estrutura da tabela `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id` int(11) NOT NULL,
  `nome` varchar(180) NOT NULL,
  `descricao` varchar(180) NOT NULL,
  `responsavel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `laboratorios`
--

INSERT INTO `laboratorios` (`id`, `nome`, `descricao`, `responsavel`) VALUES
(1, 'Laboratório de CISCO', 'Este Lab faz muitas coisas , bastante mesmo', 5),
(2, 'Laboratório do Kalueka', 'Este Lab faz muitas coisas , bastante mesmo', 5),
(3, 'Meu novo Lab', 'Meus Lab, ninguem encomoda', 4);

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
  `estado` enum('danificado','bom','rasoavel') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'bom',
  `data_compra` date NOT NULL,
  `capacidade` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Não definido',
  `tem_programas` enum('Sim','Não','Não definido') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Não definido',
  `mesa` int(11) NOT NULL,
  `laboratorio` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `CreateAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `observacoes` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `materiais`
--

INSERT INTO `materiais` (`id`, `nome`, `marca`, `modelo`, `tipo_material`, `estado`, `data_compra`, `capacidade`, `tem_programas`, `mesa`, `laboratorio`, `username`, `CreateAt`, `UpdateAt`, `observacoes`) VALUES
(3, 'material com laboratório ', 'Sem marca', 'Sem modelo', 'key', 'bom', '0000-00-00', 'Não definido', 'Não definido', 18, 2, 0, '2023-11-16 21:20:43', '2023-11-16 21:20:43', '');

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
  `estado` enum('Cheia','Vazia','Espaço Livre') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Espaço Livre',
  `laboratorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `mesas`
--

INSERT INTO `mesas` (`id`, `nome`, `num_maximo_pc`, `CreateAt`, `UpdateAt`, `estado`, `laboratorio`) VALUES
(1, 'Mesa 1', 0, '2023-11-16 21:06:29', '2023-06-15 23:00:00', 'Espaço Livre', 1),
(11, 'Mesa do Formador', 1, '2023-11-03 10:50:34', '2023-06-20 13:28:35', 'Cheia', 0),
(15, 'Mesa 1 do CFTU Cyber', 5, '2023-11-03 10:51:05', '2023-06-23 15:36:24', 'Cheia', 0),
(16, 'Mesa 2', 2, '2023-06-23 16:12:43', '2023-06-23 15:45:51', 'Espaço Livre', 0),
(17, 'jacinto', 10, '2023-11-05 14:29:54', '2023-11-05 14:29:54', 'Cheia', 0),
(18, 'Mesa com Laboratório ', 12, '2023-11-16 21:20:07', '2023-11-16 21:20:07', 'Espaço Livre', 2),
(19, 'Kalueka', 12, '2023-11-16 22:52:28', '2023-11-16 22:52:28', 'Espaço Livre', 3);

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
(4, 'Tiago Pedro Menenga Bondo', '00000000000011', 'Masculino', 'tiago1', '$2a$10$WJCQ/zDd2B3aT/soSkfI2uqPYyxlF98r263NCzdLadHzV6DL3J.nK', 'administrador', 'Activo'),
(5, 'Manuel Kalueka DEV', '020464029UE059', 'Masculino', 'admin', '$2a$10$z/yxhc9SdMdu3xmm0/Bt1ep/51vJzhY.AJdjoaNMutd2zNIAqrkJ2', 'administrador', 'Activo');

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
-- Índices para tabela `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laboratorios_ibfk_1` (`responsavel`);

--
-- Índices para tabela `materiais`
--
ALTER TABLE `materiais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_material` (`tipo_material`),
  ADD KEY `mesa` (`mesa`),
  ADD KEY `laboratorio` (`laboratorio`);

--
-- Índices para tabela `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `lab_fk` (`laboratorio`);

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
-- AUTO_INCREMENT de tabela `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `materiais`
--
ALTER TABLE `materiais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD CONSTRAINT `laboratorios_ibfk_1` FOREIGN KEY (`responsavel`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `materiais`
--
ALTER TABLE `materiais`
  ADD CONSTRAINT `laboratorio` FOREIGN KEY (`laboratorio`) REFERENCES `laboratorios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `mesa` FOREIGN KEY (`mesa`) REFERENCES `mesas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tipo_material` FOREIGN KEY (`tipo_material`) REFERENCES `tipos_materiais` (`codigo_tipo_material`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `lab_fk` FOREIGN KEY (`laboratorio`) REFERENCES `laboratorios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `perdidos_achados`
--
ALTER TABLE `perdidos_achados`
  ADD CONSTRAINT `perdidos_achados_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
