-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Jun-2025 às 12:20
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cursosdobaruio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `idaluno` int(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `nome` varchar(100) NOT NULL,
  `matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`idaluno`, `data_nascimento`, `nome`, `matricula`) VALUES
(1, '2000-01-01', 'João', 1001),
(2, '1999-05-12', 'Maria', 1002),
(3, '2001-03-22', 'José', 1003),
(4, '1998-07-30', 'Ana', 1004),
(5, '2002-11-15', 'Lucas', 1005);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_has_curso`
--

CREATE TABLE `aluno_has_curso` (
  `aluno_idaluno` int(11) NOT NULL,
  `curso_idcurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `aluno_has_curso`
--

INSERT INTO `aluno_has_curso` (`aluno_idaluno`, `curso_idcurso`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `semanas` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`idcurso`, `nome`, `semanas`) VALUES
(1, 'Python Básico', '6'),
(2, 'Java Avançado', '10'),
(3, 'Front-End Web', '8'),
(4, 'Banco de Dados', '7'),
(5, 'Machine Learning', '12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `instrutor`
--

CREATE TABLE `instrutor` (
  `idinstrutor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `instrutor`
--

INSERT INTO `instrutor` (`idinstrutor`, `nome`, `cpf`) VALUES
(1, 'Pedro', '123.456.789-00'),
(2, 'Juliana', '987.654.321-00'),
(3, 'Bruno', '456.789.123-00'),
(4, 'Fernanda', '789.123.456-00'),
(5, 'Eduardo', '321.654.987-00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `step`
--

CREATE TABLE `step` (
  `idstep` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `curso_idcurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `step`
--

INSERT INTO `step` (`idstep`, `descricao`, `curso_idcurso`) VALUES
(1, 'Introdução ao curso', 1),
(2, 'Conceitos básicos', 1),
(3, 'Programação OO', 2),
(4, 'HTML/CSS', 3),
(5, 'Modelagem de dados', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `step_has_aluno`
--

CREATE TABLE `step_has_aluno` (
  `step_idstep` int(11) NOT NULL,
  `aluno_idaluno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `step_has_aluno`
--

INSERT INTO `step_has_aluno` (`step_idstep`, `aluno_idaluno`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `step_has_topico`
--

CREATE TABLE `step_has_topico` (
  `step_idstep` int(11) NOT NULL,
  `topico_idtopico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `step_has_topico`
--

INSERT INTO `step_has_topico` (`step_idstep`, `topico_idtopico`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `titulacao`
--

CREATE TABLE `titulacao` (
  `idtitulacao` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `titulacao`
--

INSERT INTO `titulacao` (`idtitulacao`, `nome`) VALUES
(1, 'Mestre em Ciência da Computação'),
(2, 'Doutor em Engenharia'),
(3, 'Especialista em Dados'),
(4, 'Pós em Educação Digital'),
(5, 'MBA em Gestão de TI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `titulacao_has_instrutor`
--

CREATE TABLE `titulacao_has_instrutor` (
  `titulacao_idtitulacao` int(11) NOT NULL,
  `instrutor_idinstrutor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `titulacao_has_instrutor`
--

INSERT INTO `titulacao_has_instrutor` (`titulacao_idtitulacao`, `instrutor_idinstrutor`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `topico`
--

CREATE TABLE `topico` (
  `idtopico` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `conteudo` varchar(45) DEFAULT NULL,
  `instrutor_idinstrutor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `topico`
--

INSERT INTO `topico` (`idtopico`, `nome`, `conteudo`, `instrutor_idinstrutor`) VALUES
(1, 'Sintaxe Python', 'Variáveis e tipos', 1),
(2, 'POO em Java', 'Classes e objetos', 2),
(3, 'HTML5', 'Tags básicas', 3),
(4, 'SQL', 'Comandos SELECT', 4),
(5, 'Redes Neurais', 'Introdução ao ML', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `topico_has_aluno`
--

CREATE TABLE `topico_has_aluno` (
  `topico_idtopico` int(11) NOT NULL,
  `aluno_idaluno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `topico_has_aluno`
--

INSERT INTO `topico_has_aluno` (`topico_idtopico`, `aluno_idaluno`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_mostra_alunos_matriculados`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_mostra_alunos_matriculados` (
`nome_do_aluno` varchar(100)
,`nome_do_topico` varchar(45)
,`nome_do_curso` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_mostra_alunos_por_idade`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_mostra_alunos_por_idade` (
`nome_do_aluno` varchar(100)
,`idade_em_anos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_mostra_instrutor_do_curso`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_mostra_instrutor_do_curso` (
`nome_do_instrutor` varchar(100)
,`nome_do_curso` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_mostra_step_do_curso`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_mostra_step_do_curso` (
`nome_do_curso` varchar(45)
,`descricao_das_steps` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_mostra_titulacao_dos_instrutores`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_mostra_titulacao_dos_instrutores` (
`nome_da_titulacao` varchar(45)
,`nome_dos_instrutores` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_mostra_alunos_matriculados`
--
DROP TABLE IF EXISTS `vw_mostra_alunos_matriculados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_mostra_alunos_matriculados`  AS SELECT `a`.`nome` AS `nome_do_aluno`, `t`.`nome` AS `nome_do_topico`, `c`.`nome` AS `nome_do_curso` FROM ((((`aluno` `a` join `aluno_has_curso` `ac` on(`ac`.`aluno_idaluno` = `a`.`idaluno`)) join `curso` `c` on(`ac`.`curso_idcurso` = `c`.`idcurso`)) join `topico_has_aluno` `ta` on(`ta`.`aluno_idaluno` = `a`.`idaluno`)) join `topico` `t` on(`ta`.`topico_idtopico` = `t`.`idtopico`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_mostra_alunos_por_idade`
--
DROP TABLE IF EXISTS `vw_mostra_alunos_por_idade`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_mostra_alunos_por_idade`  AS SELECT `a`.`nome` AS `nome_do_aluno`, timestampdiff(YEAR,`a`.`data_nascimento`,current_timestamp()) AS `idade_em_anos` FROM `aluno` AS `a` ORDER BY `a`.`data_nascimento` ASC ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_mostra_instrutor_do_curso`
--
DROP TABLE IF EXISTS `vw_mostra_instrutor_do_curso`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_mostra_instrutor_do_curso`  AS SELECT `i`.`nome` AS `nome_do_instrutor`, `c`.`nome` AS `nome_do_curso` FROM ((((`instrutor` `i` join `topico` `t` on(`i`.`idinstrutor` = `t`.`instrutor_idinstrutor`)) join `step_has_topico` `st` on(`st`.`topico_idtopico` = `t`.`idtopico`)) join `step` `s` on(`st`.`step_idstep` = `s`.`idstep`)) join `curso` `c` on(`c`.`idcurso` = `s`.`curso_idcurso`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_mostra_step_do_curso`
--
DROP TABLE IF EXISTS `vw_mostra_step_do_curso`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_mostra_step_do_curso`  AS SELECT `c`.`nome` AS `nome_do_curso`, `s`.`descricao` AS `descricao_das_steps` FROM (`curso` `c` join `step` `s` on(`s`.`curso_idcurso` = `c`.`idcurso`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_mostra_titulacao_dos_instrutores`
--
DROP TABLE IF EXISTS `vw_mostra_titulacao_dos_instrutores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_mostra_titulacao_dos_instrutores`  AS SELECT `t`.`nome` AS `nome_da_titulacao`, `i`.`nome` AS `nome_dos_instrutores` FROM ((`instrutor` `i` join `titulacao_has_instrutor` `ti` on(`ti`.`instrutor_idinstrutor` = `i`.`idinstrutor`)) join `titulacao` `t` on(`t`.`idtitulacao` = `ti`.`titulacao_idtitulacao`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`idaluno`);

--
-- Índices para tabela `aluno_has_curso`
--
ALTER TABLE `aluno_has_curso`
  ADD PRIMARY KEY (`aluno_idaluno`,`curso_idcurso`),
  ADD KEY `fk_aluno_has_curso_curso1` (`curso_idcurso`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idcurso`);

--
-- Índices para tabela `instrutor`
--
ALTER TABLE `instrutor`
  ADD PRIMARY KEY (`idinstrutor`);

--
-- Índices para tabela `step`
--
ALTER TABLE `step`
  ADD PRIMARY KEY (`idstep`),
  ADD KEY `fk_step_curso1` (`curso_idcurso`);

--
-- Índices para tabela `step_has_aluno`
--
ALTER TABLE `step_has_aluno`
  ADD PRIMARY KEY (`step_idstep`,`aluno_idaluno`),
  ADD KEY `fk_step_has_aluno_aluno1` (`aluno_idaluno`);

--
-- Índices para tabela `step_has_topico`
--
ALTER TABLE `step_has_topico`
  ADD PRIMARY KEY (`step_idstep`,`topico_idtopico`),
  ADD KEY `fk_step_has_topico_topico1` (`topico_idtopico`);

--
-- Índices para tabela `titulacao`
--
ALTER TABLE `titulacao`
  ADD PRIMARY KEY (`idtitulacao`);

--
-- Índices para tabela `titulacao_has_instrutor`
--
ALTER TABLE `titulacao_has_instrutor`
  ADD PRIMARY KEY (`titulacao_idtitulacao`,`instrutor_idinstrutor`),
  ADD KEY `fk_titulacao_has_instrutor_instrutor1` (`instrutor_idinstrutor`);

--
-- Índices para tabela `topico`
--
ALTER TABLE `topico`
  ADD PRIMARY KEY (`idtopico`),
  ADD KEY `fk_topico_instrutor1` (`instrutor_idinstrutor`);

--
-- Índices para tabela `topico_has_aluno`
--
ALTER TABLE `topico_has_aluno`
  ADD PRIMARY KEY (`topico_idtopico`,`aluno_idaluno`),
  ADD KEY `fk_topico_has_aluno_aluno1` (`aluno_idaluno`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `idaluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `instrutor`
--
ALTER TABLE `instrutor`
  MODIFY `idinstrutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `step`
--
ALTER TABLE `step`
  MODIFY `idstep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `titulacao`
--
ALTER TABLE `titulacao`
  MODIFY `idtitulacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `topico`
--
ALTER TABLE `topico`
  MODIFY `idtopico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno_has_curso`
--
ALTER TABLE `aluno_has_curso`
  ADD CONSTRAINT `fk_aluno_has_curso_aluno1` FOREIGN KEY (`aluno_idaluno`) REFERENCES `aluno` (`idaluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aluno_has_curso_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `step`
--
ALTER TABLE `step`
  ADD CONSTRAINT `fk_step_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `step_has_aluno`
--
ALTER TABLE `step_has_aluno`
  ADD CONSTRAINT `fk_step_has_aluno_aluno1` FOREIGN KEY (`aluno_idaluno`) REFERENCES `aluno` (`idaluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_step_has_aluno_step1` FOREIGN KEY (`step_idstep`) REFERENCES `step` (`idstep`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `step_has_topico`
--
ALTER TABLE `step_has_topico`
  ADD CONSTRAINT `fk_step_has_topico_step1` FOREIGN KEY (`step_idstep`) REFERENCES `step` (`idstep`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_step_has_topico_topico1` FOREIGN KEY (`topico_idtopico`) REFERENCES `topico` (`idtopico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `titulacao_has_instrutor`
--
ALTER TABLE `titulacao_has_instrutor`
  ADD CONSTRAINT `fk_titulacao_has_instrutor_instrutor1` FOREIGN KEY (`instrutor_idinstrutor`) REFERENCES `instrutor` (`idinstrutor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_titulacao_has_instrutor_titulacao` FOREIGN KEY (`titulacao_idtitulacao`) REFERENCES `titulacao` (`idtitulacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `topico`
--
ALTER TABLE `topico`
  ADD CONSTRAINT `fk_topico_instrutor1` FOREIGN KEY (`instrutor_idinstrutor`) REFERENCES `instrutor` (`idinstrutor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `topico_has_aluno`
--
ALTER TABLE `topico_has_aluno`
  ADD CONSTRAINT `fk_topico_has_aluno_aluno1` FOREIGN KEY (`aluno_idaluno`) REFERENCES `aluno` (`idaluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_topico_has_aluno_topico1` FOREIGN KEY (`topico_idtopico`) REFERENCES `topico` (`idtopico`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
