-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lager_artikel
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lager_artikel` ;

-- -----------------------------------------------------
-- Schema lager_artikel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lager_artikel` DEFAULT CHARACTER SET utf8 ;
USE `lager_artikel` ;

-- -----------------------------------------------------
-- Table `lager_artikel`.`artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager_artikel`.`artikel` (
  `art_id` INT NOT NULL AUTO_INCREMENT,
  `art_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`art_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lager_artikel`.`verpackung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager_artikel`.`verpackung` (
  `ver_id` INT NOT NULL AUTO_INCREMENT,
  `ver_groesse` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ver_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lager_artikel`.`eigenschaft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager_artikel`.`eigenschaft` (
  `eig_id` INT NOT NULL AUTO_INCREMENT,
  `eig_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`eig_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lager_artikel`.`artikel_eigenschaft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager_artikel`.`artikel_eigenschaft` (
  `arei_id` INT NOT NULL AUTO_INCREMENT,
  `art_id` INT NOT NULL,
  `eig_id` INT NOT NULL,
  INDEX `fk_artikel_has_eigenschaft_eigenschaft1_idx` (`eig_id` ASC),
  INDEX `fk_artikel_has_eigenschaft_artikel1_idx` (`art_id` ASC),
  PRIMARY KEY (`arei_id`),
  CONSTRAINT `fk_artikel_has_eigenschaft_artikel1`
    FOREIGN KEY (`art_id`)
    REFERENCES `lager_artikel`.`artikel` (`art_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artikel_has_eigenschaft_eigenschaft1`
    FOREIGN KEY (`eig_id`)
    REFERENCES `lager_artikel`.`eigenschaft` (`eig_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lager_artikel`.`artikel_verpackung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager_artikel`.`artikel_verpackung` (
  `arve_id` INT NOT NULL AUTO_INCREMENT,
  `arei_id` INT NOT NULL,
  `ver_id` INT NOT NULL,
  `arve_einheit` DECIMAL(11,2) NOT NULL,
  INDEX `fk_artikel_has_verpackung_verpackung1_idx` (`ver_id` ASC),
  INDEX `fk_artikel_verpackung_artikel_eigenschaft1_idx` (`arei_id` ASC),
  PRIMARY KEY (`arve_id`),
  CONSTRAINT `fk_artikel_has_verpackung_verpackung1`
    FOREIGN KEY (`ver_id`)
    REFERENCES `lager_artikel`.`verpackung` (`ver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artikel_verpackung_artikel_eigenschaft1`
    FOREIGN KEY (`arei_id`)
    REFERENCES `lager_artikel`.`artikel_eigenschaft` (`arei_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `lager_artikel`.`artikel`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager_artikel`;
INSERT INTO `lager_artikel`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Mehl');
INSERT INTO `lager_artikel`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Zucker');
INSERT INTO `lager_artikel`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Gries');
INSERT INTO `lager_artikel`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Salz');
INSERT INTO `lager_artikel`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Backpulver');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lager_artikel`.`verpackung`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager_artikel`;
INSERT INTO `lager_artikel`.`verpackung` (`ver_id`, `ver_groesse`) VALUES (DEFAULT, 'g');
INSERT INTO `lager_artikel`.`verpackung` (`ver_id`, `ver_groesse`) VALUES (DEFAULT, 'kg');
INSERT INTO `lager_artikel`.`verpackung` (`ver_id`, `ver_groesse`) VALUES (DEFAULT, 'l');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lager_artikel`.`eigenschaft`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager_artikel`;
INSERT INTO `lager_artikel`.`eigenschaft` (`eig_id`, `eig_name`) VALUES (DEFAULT, 'grob');
INSERT INTO `lager_artikel`.`eigenschaft` (`eig_id`, `eig_name`) VALUES (DEFAULT, 'fein');
INSERT INTO `lager_artikel`.`eigenschaft` (`eig_id`, `eig_name`) VALUES (DEFAULT, 'jodfrei');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lager_artikel`.`artikel_eigenschaft`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager_artikel`;
INSERT INTO `lager_artikel`.`artikel_eigenschaft` (`arei_id`, `art_id`, `eig_id`) VALUES (DEFAULT, 1, 1);
INSERT INTO `lager_artikel`.`artikel_eigenschaft` (`arei_id`, `art_id`, `eig_id`) VALUES (DEFAULT, 1, 2);
INSERT INTO `lager_artikel`.`artikel_eigenschaft` (`arei_id`, `art_id`, `eig_id`) VALUES (DEFAULT, 2, 1);
INSERT INTO `lager_artikel`.`artikel_eigenschaft` (`arei_id`, `art_id`, `eig_id`) VALUES (DEFAULT, 2, 2);
INSERT INTO `lager_artikel`.`artikel_eigenschaft` (`arei_id`, `art_id`, `eig_id`) VALUES (DEFAULT, 3, 1);
INSERT INTO `lager_artikel`.`artikel_eigenschaft` (`arei_id`, `art_id`, `eig_id`) VALUES (DEFAULT, 4, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `lager_artikel`.`artikel_verpackung`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager_artikel`;
INSERT INTO `lager_artikel`.`artikel_verpackung` (`arve_id`, `arei_id`, `ver_id`, `arve_einheit`) VALUES (DEFAULT, 1, 1, 500);
INSERT INTO `lager_artikel`.`artikel_verpackung` (`arve_id`, `arei_id`, `ver_id`, `arve_einheit`) VALUES (DEFAULT, 1, 2, 1.5);
INSERT INTO `lager_artikel`.`artikel_verpackung` (`arve_id`, `arei_id`, `ver_id`, `arve_einheit`) VALUES (DEFAULT, 1, 1, 250);
INSERT INTO `lager_artikel`.`artikel_verpackung` (`arve_id`, `arei_id`, `ver_id`, `arve_einheit`) VALUES (DEFAULT, 4, 1, 500);
INSERT INTO `lager_artikel`.`artikel_verpackung` (`arve_id`, `arei_id`, `ver_id`, `arve_einheit`) VALUES (DEFAULT, 4, 1, 250);
INSERT INTO `lager_artikel`.`artikel_verpackung` (`arve_id`, `arei_id`, `ver_id`, `arve_einheit`) VALUES (DEFAULT, 5, 1, 150);

COMMIT;

