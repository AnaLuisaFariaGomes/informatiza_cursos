-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `idaluno` INT NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `matricula` INT NOT NULL,
  PRIMARY KEY (`idaluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`curso` (
  `idcurso` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `semanas` VARCHAR(45) NULL,
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`step`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`step` (
  `idstep` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `curso_idcurso` INT NOT NULL,
  PRIMARY KEY (`idstep`),
  CONSTRAINT `fk_step_curso1`
    FOREIGN KEY (`curso_idcurso`)
    REFERENCES `mydb`.`curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instrutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`instrutor` (
  `idinstrutor` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(45) NULL,
  PRIMARY KEY (`idinstrutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`topico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`topico` (
  `idtopico` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `conteudo` VARCHAR(45) NULL,
  `instrutor_idinstrutor` INT NOT NULL,
  PRIMARY KEY (`idtopico`),
  CONSTRAINT `fk_topico_instrutor1`
    FOREIGN KEY (`instrutor_idinstrutor`)
    REFERENCES `mydb`.`instrutor` (`idinstrutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`titulacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`titulacao` (
  `idtitulacao` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idtitulacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`titulacao_has_instrutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`titulacao_has_instrutor` (
  `titulacao_idtitulacao` INT NOT NULL,
  `instrutor_idinstrutor` INT NOT NULL,
  PRIMARY KEY (`titulacao_idtitulacao`, `instrutor_idinstrutor`),
  CONSTRAINT `fk_titulacao_has_instrutor_titulacao`
    FOREIGN KEY (`titulacao_idtitulacao`)
    REFERENCES `mydb`.`titulacao` (`idtitulacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_titulacao_has_instrutor_instrutor1`
    FOREIGN KEY (`instrutor_idinstrutor`)
    REFERENCES `mydb`.`instrutor` (`idinstrutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`step_has_topico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`step_has_topico` (
  `step_idstep` INT NOT NULL,
  `topico_idtopico` INT NOT NULL,
  PRIMARY KEY (`step_idstep`, `topico_idtopico`),
  CONSTRAINT `fk_step_has_topico_step1`
    FOREIGN KEY (`step_idstep`)
    REFERENCES `mydb`.`step` (`idstep`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_step_has_topico_topico1`
    FOREIGN KEY (`topico_idtopico`)
    REFERENCES `mydb`.`topico` (`idtopico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aluno_has_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno_has_curso` (
  `aluno_idaluno` INT NOT NULL,
  `curso_idcurso` INT NOT NULL,
  PRIMARY KEY (`aluno_idaluno`, `curso_idcurso`),
  CONSTRAINT `fk_aluno_has_curso_aluno1`
    FOREIGN KEY (`aluno_idaluno`)
    REFERENCES `mydb`.`aluno` (`idaluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_curso_curso1`
    FOREIGN KEY (`curso_idcurso`)
    REFERENCES `mydb`.`curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`step_has_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`step_has_aluno` (
  `step_idstep` INT NOT NULL,
  `aluno_idaluno` INT NOT NULL,
  PRIMARY KEY (`step_idstep`, `aluno_idaluno`),
  CONSTRAINT `fk_step_has_aluno_step1`
    FOREIGN KEY (`step_idstep`)
    REFERENCES `mydb`.`step` (`idstep`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_step_has_aluno_aluno1`
    FOREIGN KEY (`aluno_idaluno`)
    REFERENCES `mydb`.`aluno` (`idaluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`topico_has_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`topico_has_aluno` (
  `topico_idtopico` INT NOT NULL,
  `aluno_idaluno` INT NOT NULL,
  PRIMARY KEY (`topico_idtopico`, `aluno_idaluno`),
  CONSTRAINT `fk_topico_has_aluno_topico1`
    FOREIGN KEY (`topico_idtopico`)
    REFERENCES `mydb`.`topico` (`idtopico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_topico_has_aluno_aluno1`
    FOREIGN KEY (`aluno_idaluno`)
    REFERENCES `mydb`.`aluno` (`idaluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
