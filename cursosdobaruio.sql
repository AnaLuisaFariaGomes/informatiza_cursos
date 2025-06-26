CREATE DATABASE  IF NOT EXISTS `cursosdobaruio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `cursosdobaruio`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cursosdobaruio
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `idaluno` int(11) NOT NULL AUTO_INCREMENT,
  `data_nascimento` date NOT NULL,
  `nome` varchar(100) NOT NULL,
  `matricula` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idaluno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'2000-01-01','João',1001,NULL),(2,'1999-05-12','Maria',1002,NULL),(3,'2001-03-22','José',1003,NULL),(4,'1998-07-30','Ana',1004,NULL),(5,'2002-11-15','Lucas',1005,NULL);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_atualiza_data_modificacao` AFTER UPDATE ON `aluno` FOR EACH ROW INSERT INTO data_modificacao (data) VALUES (NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_log_update_aluno` AFTER UPDATE ON `aluno` FOR EACH ROW INSERT INTO log (data_hora , tabela_afetada) VALUES (NOW() , 'aluno') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_log_update_matricula` AFTER UPDATE ON `aluno` FOR EACH ROW IF(NEW.matricula != OLD.matricula) THEN
		INSERT INTO log (data_hora, tabela_afetada) VALUES (NOW(), 'aluno');
	END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aluno_has_curso`
--

DROP TABLE IF EXISTS `aluno_has_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_has_curso` (
  `aluno_idaluno` int(11) NOT NULL,
  `curso_idcurso` int(11) NOT NULL,
  PRIMARY KEY (`aluno_idaluno`,`curso_idcurso`),
  KEY `fk_aluno_has_curso_curso1` (`curso_idcurso`),
  CONSTRAINT `fk_aluno_has_curso_aluno1` FOREIGN KEY (`aluno_idaluno`) REFERENCES `aluno` (`idaluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_curso_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_has_curso`
--

LOCK TABLES `aluno_has_curso` WRITE;
/*!40000 ALTER TABLE `aluno_has_curso` DISABLE KEYS */;
INSERT INTO `aluno_has_curso` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `aluno_has_curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_limite_matricula
BEFORE INSERT ON aluno_has_curso FOR EACH ROW
BEGIN
  SET @qtd_matriculas = (
    SELECT COUNT(*) 
    FROM aluno_has_curso 
    WHERE aluno_idaluno = NEW.aluno_idaluno
  );
  IF (@qtd_matriculas >= 2) THEN
    SET NEW.aluno_idaluno = NULL;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `semanas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Python Básico','6'),(2,'Java Avançado','10'),(3,'Front-End Web','8'),(4,'Banco de Dados','7'),(5,'Machine Learning','12');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_log_update_curso` AFTER UPDATE ON `curso` FOR EACH ROW INSERT INTO log (data_hora , tabela_afetada) VALUES (NOW() , 'curso') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_modificacao`
--

DROP TABLE IF EXISTS `data_modificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_modificacao` (
  `id_data` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_modificacao`
--

LOCK TABLES `data_modificacao` WRITE;
/*!40000 ALTER TABLE `data_modificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_modificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrutor`
--

DROP TABLE IF EXISTS `instrutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrutor` (
  `idinstrutor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idinstrutor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrutor`
--

LOCK TABLES `instrutor` WRITE;
/*!40000 ALTER TABLE `instrutor` DISABLE KEYS */;
INSERT INTO `instrutor` VALUES (1,'Pedro','123.456.789-00'),(2,'Juliana','987.654.321-00'),(3,'Bruno','456.789.123-00'),(4,'Fernanda','789.123.456-00'),(5,'Eduardo','321.654.987-00');
/*!40000 ALTER TABLE `instrutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `idlog` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT current_timestamp(),
  `tabela_afetada` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `idstep` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `curso_idcurso` int(11) NOT NULL,
  PRIMARY KEY (`idstep`),
  KEY `fk_step_curso1` (`curso_idcurso`),
  CONSTRAINT `fk_step_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,'Introdução ao curso',1),(2,'Conceitos básicos',1),(3,'Programação OO',2),(4,'HTML/CSS',3),(5,'Modelagem de dados',4);
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step_has_aluno`
--

DROP TABLE IF EXISTS `step_has_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step_has_aluno` (
  `step_idstep` int(11) NOT NULL,
  `aluno_idaluno` int(11) NOT NULL,
  PRIMARY KEY (`step_idstep`,`aluno_idaluno`),
  KEY `fk_step_has_aluno_aluno1` (`aluno_idaluno`),
  CONSTRAINT `fk_step_has_aluno_aluno1` FOREIGN KEY (`aluno_idaluno`) REFERENCES `aluno` (`idaluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_step_has_aluno_step1` FOREIGN KEY (`step_idstep`) REFERENCES `step` (`idstep`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step_has_aluno`
--

LOCK TABLES `step_has_aluno` WRITE;
/*!40000 ALTER TABLE `step_has_aluno` DISABLE KEYS */;
INSERT INTO `step_has_aluno` VALUES (1,1),(2,1),(3,2),(4,3),(5,4);
/*!40000 ALTER TABLE `step_has_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step_has_topico`
--

DROP TABLE IF EXISTS `step_has_topico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step_has_topico` (
  `step_idstep` int(11) NOT NULL,
  `topico_idtopico` int(11) NOT NULL,
  PRIMARY KEY (`step_idstep`,`topico_idtopico`),
  KEY `fk_step_has_topico_topico1` (`topico_idtopico`),
  CONSTRAINT `fk_step_has_topico_step1` FOREIGN KEY (`step_idstep`) REFERENCES `step` (`idstep`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_step_has_topico_topico1` FOREIGN KEY (`topico_idtopico`) REFERENCES `topico` (`idtopico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step_has_topico`
--

LOCK TABLES `step_has_topico` WRITE;
/*!40000 ALTER TABLE `step_has_topico` DISABLE KEYS */;
INSERT INTO `step_has_topico` VALUES (1,1),(2,1),(3,2),(4,3),(5,4);
/*!40000 ALTER TABLE `step_has_topico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulacao`
--

DROP TABLE IF EXISTS `titulacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulacao` (
  `idtitulacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtitulacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulacao`
--

LOCK TABLES `titulacao` WRITE;
/*!40000 ALTER TABLE `titulacao` DISABLE KEYS */;
INSERT INTO `titulacao` VALUES (1,'Mestre em Ciência da Computação'),(2,'Doutor em Engenharia'),(3,'Especialista em Dados'),(4,'Pós em Educação Digital'),(5,'MBA em Gestão de TI');
/*!40000 ALTER TABLE `titulacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulacao_has_instrutor`
--

DROP TABLE IF EXISTS `titulacao_has_instrutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulacao_has_instrutor` (
  `titulacao_idtitulacao` int(11) NOT NULL,
  `instrutor_idinstrutor` int(11) NOT NULL,
  PRIMARY KEY (`titulacao_idtitulacao`,`instrutor_idinstrutor`),
  KEY `fk_titulacao_has_instrutor_instrutor1` (`instrutor_idinstrutor`),
  CONSTRAINT `fk_titulacao_has_instrutor_instrutor1` FOREIGN KEY (`instrutor_idinstrutor`) REFERENCES `instrutor` (`idinstrutor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_titulacao_has_instrutor_titulacao` FOREIGN KEY (`titulacao_idtitulacao`) REFERENCES `titulacao` (`idtitulacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulacao_has_instrutor`
--

LOCK TABLES `titulacao_has_instrutor` WRITE;
/*!40000 ALTER TABLE `titulacao_has_instrutor` DISABLE KEYS */;
INSERT INTO `titulacao_has_instrutor` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `titulacao_has_instrutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topico`
--

DROP TABLE IF EXISTS `topico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topico` (
  `idtopico` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `conteudo` varchar(45) DEFAULT NULL,
  `instrutor_idinstrutor` int(11) NOT NULL,
  PRIMARY KEY (`idtopico`),
  KEY `fk_topico_instrutor1` (`instrutor_idinstrutor`),
  CONSTRAINT `fk_topico_instrutor1` FOREIGN KEY (`instrutor_idinstrutor`) REFERENCES `instrutor` (`idinstrutor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topico`
--

LOCK TABLES `topico` WRITE;
/*!40000 ALTER TABLE `topico` DISABLE KEYS */;
INSERT INTO `topico` VALUES (1,'Sintaxe Python','Variáveis e tipos',1),(2,'POO em Java','Classes e objetos',2),(3,'HTML5','Tags básicas',3),(4,'SQL','Comandos SELECT',4),(5,'Redes Neurais','Introdução ao ML',5);
/*!40000 ALTER TABLE `topico` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_log_update_topico` AFTER UPDATE ON `topico` FOR EACH ROW INSERT INTO log (data_hora , tabela_afetada) VALUES (NOW() , 'topico') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `topico_has_aluno`
--

DROP TABLE IF EXISTS `topico_has_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topico_has_aluno` (
  `topico_idtopico` int(11) NOT NULL,
  `aluno_idaluno` int(11) NOT NULL,
  PRIMARY KEY (`topico_idtopico`,`aluno_idaluno`),
  KEY `fk_topico_has_aluno_aluno1` (`aluno_idaluno`),
  CONSTRAINT `fk_topico_has_aluno_aluno1` FOREIGN KEY (`aluno_idaluno`) REFERENCES `aluno` (`idaluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_topico_has_aluno_topico1` FOREIGN KEY (`topico_idtopico`) REFERENCES `topico` (`idtopico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topico_has_aluno`
--

LOCK TABLES `topico_has_aluno` WRITE;
/*!40000 ALTER TABLE `topico_has_aluno` DISABLE KEYS */;
INSERT INTO `topico_has_aluno` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `topico_has_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_mostra_alunos_matriculados`
--

DROP TABLE IF EXISTS `vw_mostra_alunos_matriculados`;
/*!50001 DROP VIEW IF EXISTS `vw_mostra_alunos_matriculados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mostra_alunos_matriculados` AS SELECT 
 1 AS `nome_do_aluno`,
 1 AS `nome_do_topico`,
 1 AS `nome_do_curso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mostra_alunos_por_idade`
--

DROP TABLE IF EXISTS `vw_mostra_alunos_por_idade`;
/*!50001 DROP VIEW IF EXISTS `vw_mostra_alunos_por_idade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mostra_alunos_por_idade` AS SELECT 
 1 AS `nome_do_aluno`,
 1 AS `idade_em_anos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mostra_instrutor_do_curso`
--

DROP TABLE IF EXISTS `vw_mostra_instrutor_do_curso`;
/*!50001 DROP VIEW IF EXISTS `vw_mostra_instrutor_do_curso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mostra_instrutor_do_curso` AS SELECT 
 1 AS `nome_do_instrutor`,
 1 AS `nome_do_curso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mostra_step_do_curso`
--

DROP TABLE IF EXISTS `vw_mostra_step_do_curso`;
/*!50001 DROP VIEW IF EXISTS `vw_mostra_step_do_curso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mostra_step_do_curso` AS SELECT 
 1 AS `nome_do_curso`,
 1 AS `descricao_das_steps`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mostra_titulacao_dos_instrutores`
--

DROP TABLE IF EXISTS `vw_mostra_titulacao_dos_instrutores`;
/*!50001 DROP VIEW IF EXISTS `vw_mostra_titulacao_dos_instrutores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mostra_titulacao_dos_instrutores` AS SELECT 
 1 AS `nome_da_titulacao`,
 1 AS `nome_dos_instrutores`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'cursosdobaruio'
--

--
-- Dumping routines for database 'cursosdobaruio'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_atualiza_dados_aluno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_atualiza_dados_aluno`(IN `p_matricula` INT, IN `p_novo_nome` VARCHAR(100), IN `p_nova_data` DATE, IN `p_novo_email` VARCHAR(100))
BEGIN
    UPDATE aluno
    SET nome = p_novo_nome, 
        data_nascimento = p_nova_data,
        email = p_novo_email
    WHERE matricula = p_matricula;

    IF ROW_COUNT() = 0 THEN
        SELECT 'Matricula não encontrada' AS mensagem;
    ELSE
        SELECT 'Dados atualizados com sucesso' AS mensagem;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insere_instrutor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insere_instrutor`(IN `snome` VARCHAR(100), IN `scpf` VARCHAR(45))
BEGIN
		if trim(snome) = '' then
			select "Cadastro não realizado, o nome do instrutor não foi passado corretamente";
        else
			insert into instrutor (nome, cpf)
			values (snome, scpf);
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_alunos_por_topico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_alunos_por_topico`(IN `p_idtopico` INT)
BEGIN
    select 
        a.idaluno,
        a.nome as Aluno,
        a.matricula as Matricula,
        t.nome AS Topico
    from topico_has_aluno tha
    join aluno a on a.idaluno = tha.aluno_idaluno
    join topico t on t.idtopico = tha.topico_idtopico
    where t.idtopico = p_idtopico
    order by a.nome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_lista_topicos_por_curso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lista_topicos_por_curso`(IN `cursoId` INT)
BEGIN
	select 
        s.descricao as "Descrição da step",
        t.nome as Topico,
        t.conteudo as "Conteudo tópico"
        
    from curso c
    join step s on s.curso_idcurso = c.idcurso
    join step_has_topico st on st.step_idstep = s.idstep
    join topico t on t.idtopico = st.topico_idtopico
    where c.idcurso = cursoId
    order by s.idstep, t.idtopico;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_matricula_topicos_por_step` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_matricula_topicos_por_step`(IN `p_matricula` INT(11), IN `p_idstep` INT(11))
BEGIN
    INSERT INTO topico_has_aluno (topico_idtopico, aluno_idaluno)
    SELECT sht.topico_idtopico, a.idaluno
    FROM aluno AS a
    JOIN step_has_topico AS sht ON sht.step_idstep = p_idstep
    WHERE a.matricula = p_matricula
    AND NOT EXISTS (
        SELECT 1
        FROM topico_has_aluno AS tha
        WHERE tha.topico_idtopico = sht.topico_idtopico
        AND tha.aluno_idaluno = a.idaluno
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_mostra_alunos_matriculados`
--

/*!50001 DROP VIEW IF EXISTS `vw_mostra_alunos_matriculados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mostra_alunos_matriculados` AS select `a`.`nome` AS `nome_do_aluno`,`t`.`nome` AS `nome_do_topico`,`c`.`nome` AS `nome_do_curso` from ((((`aluno` `a` join `aluno_has_curso` `ac` on(`ac`.`aluno_idaluno` = `a`.`idaluno`)) join `curso` `c` on(`ac`.`curso_idcurso` = `c`.`idcurso`)) join `topico_has_aluno` `ta` on(`ta`.`aluno_idaluno` = `a`.`idaluno`)) join `topico` `t` on(`ta`.`topico_idtopico` = `t`.`idtopico`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mostra_alunos_por_idade`
--

/*!50001 DROP VIEW IF EXISTS `vw_mostra_alunos_por_idade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mostra_alunos_por_idade` AS select `a`.`nome` AS `nome_do_aluno`,timestampdiff(YEAR,`a`.`data_nascimento`,current_timestamp()) AS `idade_em_anos` from `aluno` `a` order by `a`.`data_nascimento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mostra_instrutor_do_curso`
--

/*!50001 DROP VIEW IF EXISTS `vw_mostra_instrutor_do_curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mostra_instrutor_do_curso` AS select `i`.`nome` AS `nome_do_instrutor`,`c`.`nome` AS `nome_do_curso` from ((((`instrutor` `i` join `topico` `t` on(`i`.`idinstrutor` = `t`.`instrutor_idinstrutor`)) join `step_has_topico` `st` on(`st`.`topico_idtopico` = `t`.`idtopico`)) join `step` `s` on(`st`.`step_idstep` = `s`.`idstep`)) join `curso` `c` on(`c`.`idcurso` = `s`.`curso_idcurso`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mostra_step_do_curso`
--

/*!50001 DROP VIEW IF EXISTS `vw_mostra_step_do_curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mostra_step_do_curso` AS select `c`.`nome` AS `nome_do_curso`,`s`.`descricao` AS `descricao_das_steps` from (`curso` `c` join `step` `s` on(`s`.`curso_idcurso` = `c`.`idcurso`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mostra_titulacao_dos_instrutores`
--

/*!50001 DROP VIEW IF EXISTS `vw_mostra_titulacao_dos_instrutores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mostra_titulacao_dos_instrutores` AS select `t`.`nome` AS `nome_da_titulacao`,`i`.`nome` AS `nome_dos_instrutores` from ((`instrutor` `i` join `titulacao_has_instrutor` `ti` on(`ti`.`instrutor_idinstrutor` = `i`.`idinstrutor`)) join `titulacao` `t` on(`t`.`idtitulacao` = `ti`.`titulacao_idtitulacao`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-25 22:07:45
