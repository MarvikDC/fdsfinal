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
-- Table `mydb`.`Articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Articulo` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `seccion` VARCHAR(20) NOT NULL,
  `precio` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `email` VARCHAR(254) NULL,
  `telefono` VARCHAR(9) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedido` (
  `id` INT NOT NULL,
  `numero` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `entregado` TINYINT NOT NULL,
  `cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `cliente`
    FOREIGN KEY (`id`)
    REFERENCES `mydb`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Art_ped`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Art_ped` (
  `articulo` INT NOT NULL,
  `pedido` INT NOT NULL,
  `id` INT NOT NULL,
  INDEX `pedido_idx` (`pedido` ASC) VISIBLE,
  PRIMARY KEY (`id`, `articulo`, `pedido`),
  CONSTRAINT `articulo`
    FOREIGN KEY (`articulo`)
    REFERENCES `mydb`.`Articulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pedido`
    FOREIGN KEY (`pedido`)
    REFERENCES `mydb`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
