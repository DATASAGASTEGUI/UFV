-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BIBLIOTECA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BIBLIOTECA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BIBLIOTECA` DEFAULT CHARACTER SET utf8 ;
USE `BIBLIOTECA` ;

-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`Tematica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`Tematica` (
  `id_tematica` VARCHAR(4) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tematica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`Libro` (
  `id_libro` VARCHAR(4) NOT NULL,
  `iban` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `editorial` VARCHAR(45) NOT NULL,
  `numero_paginas` INT NOT NULL,
  `fecha_publicacion` CHAR(10) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `d_tematica` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`id_libro`),
  INDEX `fk_Libro_Tematica1_idx` (`d_tematica` ASC) VISIBLE,
  CONSTRAINT `fk_Libro_Tematica1`
    FOREIGN KEY (`d_tematica`)
    REFERENCES `BIBLIOTECA`.`Tematica` (`id_tematica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`Autor` (
  `id_autor` VARCHAR(4) NOT NULL,
  `nombres_apellidos` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` CHAR(10) NOT NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`autor_x_libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`autor_x_libro` (
  `id_libro` VARCHAR(4) NOT NULL,
  `id_autor` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`id_libro`, `id_autor`),
  INDEX `fk_Libro_has_Autor_Autor1_idx` (`id_autor` ASC) VISIBLE,
  INDEX `fk_Libro_has_Autor_Libro_idx` (`id_libro` ASC) VISIBLE,
  CONSTRAINT `fk_Libro_has_Autor_Libro`
    FOREIGN KEY (`id_libro`)
    REFERENCES `BIBLIOTECA`.`Libro` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libro_has_Autor_Autor1`
    FOREIGN KEY (`id_autor`)
    REFERENCES `BIBLIOTECA`.`Autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`Lector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`Lector` (
  `id_lector` VARCHAR(4) NOT NULL,
  `nombres_apellidos` VARCHAR(45) NOT NULL,
  `telefono` CHAR(9) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `dni` CHAR(9) NOT NULL,
  PRIMARY KEY (`id_lector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`libro_x_lector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`libro_x_lector` (
  `numero_transaccion` VARCHAR(45) NOT NULL,
  `id_libro` VARCHAR(4) NOT NULL,
  `id_lector` VARCHAR(4) NOT NULL,
  `fecha_inicio_prestamo` CHAR(10) NOT NULL,
  `fecha_fin_prestamo` CHAR(10) NOT NULL,
  PRIMARY KEY (`numero_transaccion`),
  INDEX `fk_Libro_has_Lector_Lector1_idx` (`id_lector` ASC) VISIBLE,
  INDEX `fk_Libro_has_Lector_Libro1_idx` (`id_libro` ASC) VISIBLE,
  CONSTRAINT `fk_Libro_has_Lector_Libro1`
    FOREIGN KEY (`id_libro`)
    REFERENCES `BIBLIOTECA`.`Libro` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libro_has_Lector_Lector1`
    FOREIGN KEY (`id_lector`)
    REFERENCES `BIBLIOTECA`.`Lector` (`id_lector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
