-- MySQL Script generated by MySQL Workbench
-- Sun Oct  8 15:51:33 2023
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Curso` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instituicao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Instituicao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Instituicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Aluno` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NULL,
  `rg` VARCHAR(45) NULL,
  `endereco` VARCHAR(500) NULL,
  `moeda` INT NULL,
  `Curso_idCurso` INT NOT NULL,
  `Instituicao_id` INT NOT NULL,
  PRIMARY KEY (`idAluno`, `Curso_idCurso`, `Instituicao_id`),
  INDEX `fk_Aluno_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  INDEX `fk_Aluno_Instituicao1_idx` (`Instituicao_id` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `mydb`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_Instituicao1`
    FOREIGN KEY (`Instituicao_id`)
    REFERENCES `mydb`.`Instituicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Empresa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vantagens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vantagens` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vantagens` (
  `idVantagem` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(500) NULL,
  `foto` VARCHAR(45) NULL,
  `aluno_has_vantagens_idAluno` INT NOT NULL,
  `aluno_has_vantagens_Aluno_idAluno` VARCHAR(45) NOT NULL,
  `aluno_has_vantagens_Aluno_Curso_idCurso` INT NOT NULL,
  `Empresa_id` INT NOT NULL,
  PRIMARY KEY (`idVantagem`, `aluno_has_vantagens_idAluno`, `aluno_has_vantagens_Aluno_idAluno`, `aluno_has_vantagens_Aluno_Curso_idCurso`, `Empresa_id`),
  INDEX `fk_Vantagens_Empresa1_idx` (`Empresa_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vantagens_Empresa1`
    FOREIGN KEY (`Empresa_id`)
    REFERENCES `mydb`.`Empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Professor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `nome` CHAR NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `rg` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(500) NOT NULL,
  `moeda` INT NULL,
  `Instituicao_id` INT NOT NULL,
  PRIMARY KEY (`idProfessor`, `Instituicao_id`),
  INDEX `fk_Professor_Instituicao1_idx` (`Instituicao_id` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Instituicao1`
    FOREIGN KEY (`Instituicao_id`)
    REFERENCES `mydb`.`Instituicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Transacoes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Transacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor` FLOAT NOT NULL,
  `descricao` VARCHAR(500) NULL,
  `Aluno_idAluno` INT NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`id`, `Aluno_idAluno`, `Professor_idProfessor`),
  INDEX `fk_Transacoes_Aluno1_idx` (`Aluno_idAluno` ASC) VISIBLE,
  INDEX `fk_Transacoes_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Transacoes_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacoes_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vantagens_has_Aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vantagens_has_Aluno` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vantagens_has_Aluno` (
  `Vantagens_idVantagem` INT NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  PRIMARY KEY (`Vantagens_idVantagem`, `Aluno_idAluno`),
  INDEX `fk_Vantagens_has_Aluno_Aluno1_idx` (`Aluno_idAluno` ASC) VISIBLE,
  INDEX `fk_Vantagens_has_Aluno_Vantagens1_idx` (`Vantagens_idVantagem` ASC) VISIBLE,
  CONSTRAINT `fk_Vantagens_has_Aluno_Vantagens1`
    FOREIGN KEY (`Vantagens_idVantagem`)
    REFERENCES `mydb`.`Vantagens` (`idVantagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vantagens_has_Aluno_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT into instituicao values (NULL, "puc");
insert into curso values (NULL, "curso1");
