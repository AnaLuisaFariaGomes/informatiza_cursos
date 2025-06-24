	-- MySQL Workbench Forward Engineering

	SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
	SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
	SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

	-- -----------------------------------------------------
	-- Schema cursosDoBaruio
	-- -----------------------------------------------------

	-- -----------------------------------------------------
	-- Schema cursosDoBaruio
	-- -----------------------------------------------------
	CREATE SCHEMA IF NOT EXISTS `cursosDoBaruio` DEFAULT CHARACTER SET utf8 ;
	USE `cursosDoBaruio` ;

	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`aluno`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`aluno` (
	  `idaluno` INT NOT NULL auto_increment,
	  `data_nascimento` DATE NOT NULL,
	  `nome` VARCHAR(100) NOT NULL,
	  `matricula` INT NOT NULL,
	  PRIMARY KEY (`idaluno`))
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`curso`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`curso` (
	  `idcurso` INT NOT NULL auto_increment,
	  `nome` VARCHAR(45) NOT NULL,
	  `semanas` VARCHAR(45) NULL,
	  PRIMARY KEY (`idcurso`))
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`step`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`step` (
	  `idstep` INT NOT NULL auto_increment,
	  `descricao` VARCHAR(45) NOT NULL,
	  `curso_idcurso` INT NOT NULL,
	  PRIMARY KEY (`idstep`),
	  CONSTRAINT `fk_step_curso1`
		FOREIGN KEY (`curso_idcurso`)
		REFERENCES `cursosDoBaruio`.`curso` (`idcurso`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`instrutor`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`instrutor` (
	  `idinstrutor` INT NOT NULL auto_increment,
	  `nome` VARCHAR(100) NOT NULL,
	  `cpf` VARCHAR(45) NULL,
	  PRIMARY KEY (`idinstrutor`))
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`topico`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`topico` (
	  `idtopico` INT NOT NULL auto_increment,
	  `nome` VARCHAR(45) NOT NULL,
	  `conteudo` VARCHAR(45) NULL,
	  `instrutor_idinstrutor` INT NOT NULL,
	  PRIMARY KEY (`idtopico`),
	  CONSTRAINT `fk_topico_instrutor1`
		FOREIGN KEY (`instrutor_idinstrutor`)
		REFERENCES `cursosDoBaruio`.`instrutor` (`idinstrutor`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`titulacao`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`titulacao` (
	  `idtitulacao` INT NOT NULL auto_increment,
	  `nome` VARCHAR(45) NULL,
	  PRIMARY KEY (`idtitulacao`))
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`titulacao_has_instrutor`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`titulacao_has_instrutor` (
	  `titulacao_idtitulacao` INT NOT NULL,
	  `instrutor_idinstrutor` INT NOT NULL,
	  PRIMARY KEY (`titulacao_idtitulacao`, `instrutor_idinstrutor`),
	  CONSTRAINT `fk_titulacao_has_instrutor_titulacao`
		FOREIGN KEY (`titulacao_idtitulacao`)
		REFERENCES `cursosDoBaruio`.`titulacao` (`idtitulacao`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT `fk_titulacao_has_instrutor_instrutor1`
		FOREIGN KEY (`instrutor_idinstrutor`)
		REFERENCES `cursosDoBaruio`.`instrutor` (`idinstrutor`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;

	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`step_has_topico`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`step_has_topico` (
	  `step_idstep` INT NOT NULL,
	  `topico_idtopico` INT NOT NULL,
	  PRIMARY KEY (`step_idstep`, `topico_idtopico`),
	  CONSTRAINT `fk_step_has_topico_step1`
		FOREIGN KEY (`step_idstep`)
		REFERENCES `cursosDoBaruio`.`step` (`idstep`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT `fk_step_has_topico_topico1`
		FOREIGN KEY (`topico_idtopico`)
		REFERENCES `cursosDoBaruio`.`topico` (`idtopico`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`aluno_has_curso`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`aluno_has_curso` (
	  `aluno_idaluno` INT NOT NULL,
	  `curso_idcurso` INT NOT NULL,
	  PRIMARY KEY (`aluno_idaluno`, `curso_idcurso`),
	  CONSTRAINT `fk_aluno_has_curso_aluno1`
		FOREIGN KEY (`aluno_idaluno`)
		REFERENCES `cursosDoBaruio`.`aluno` (`idaluno`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT `fk_aluno_has_curso_curso1`
		FOREIGN KEY (`curso_idcurso`)
		REFERENCES `cursosDoBaruio`.`curso` (`idcurso`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`step_has_aluno`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`step_has_aluno` (
	  `step_idstep` INT NOT NULL,
	  `aluno_idaluno` INT NOT NULL,
	  PRIMARY KEY (`step_idstep`, `aluno_idaluno`),
	  CONSTRAINT `fk_step_has_aluno_step1`
		FOREIGN KEY (`step_idstep`)
		REFERENCES `cursosDoBaruio`.`step` (`idstep`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT `fk_step_has_aluno_aluno1`
		FOREIGN KEY (`aluno_idaluno`)
		REFERENCES `cursosDoBaruio`.`aluno` (`idaluno`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table `cursosDoBaruio`.`topico_has_aluno`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `cursosDoBaruio`.`topico_has_aluno` (
	  `topico_idtopico` INT NOT NULL,
	  `aluno_idaluno` INT NOT NULL,
	  PRIMARY KEY (`topico_idtopico`, `aluno_idaluno`),
	  CONSTRAINT `fk_topico_has_aluno_topico1`
		FOREIGN KEY (`topico_idtopico`)
		REFERENCES `cursosDoBaruio`.`topico` (`idtopico`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT `fk_topico_has_aluno_aluno1`
		FOREIGN KEY (`aluno_idaluno`)
		REFERENCES `cursosDoBaruio`.`aluno` (`idaluno`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	SET SQL_MODE=@OLD_SQL_MODE;
	SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
	SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
