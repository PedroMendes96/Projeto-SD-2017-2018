-- MySQL Script generated by MySQL Workbench
-- 12/04/17 08:35:34
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `timetables` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `timetables` DEFAULT CHARACTER SET utf8 ;
USE `timetables` ;

-- -----------------------------------------------------
-- Table `mydb`.`timetables`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `timetables`.`timetables` ;

CREATE TABLE IF NOT EXISTS `timetables`.`timetables` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `day` INT NOT NULL,
  `month` INT NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`periods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `timetables`.`periods` ;

CREATE TABLE IF NOT EXISTS `timetables`.`periods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `startHour` VARCHAR(45) NOT NULL,
  `endHour` VARCHAR(45) NOT NULL,
  `idteacher` INT NOT NULL,
  `idroom` INT NOT NULL,
  `timetables_id` INT NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`, `timetables_id`),
  INDEX `fk_periods_timetables_idx` (`timetables_id` ASC),
  CONSTRAINT `fk_periods_timetables`
    FOREIGN KEY (`timetables_id`)
    REFERENCES `timetables`.`timetables` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
