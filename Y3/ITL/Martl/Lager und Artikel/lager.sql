-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lager
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lager` ;

-- -----------------------------------------------------
-- Schema lager
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lager` DEFAULT CHARACTER SET utf8 ;
USE `lager` ;

-- -----------------------------------------------------
-- Table `lager`.`artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager`.`artikel` (
  `art_id` INT NOT NULL AUTO_INCREMENT,
  `art_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`art_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lager`.`verpackung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager`.`verpackung` (
  `ver_id` INT NOT NULL AUTO_INCREMENT,
  `ver_groesse` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ver_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lager`.`eigenschaft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager`.`eigenschaft` (
  `eig_id` INT NOT NULL AUTO_INCREMENT,
  `eig_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`eig_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lager`.`artikel_eigenschaft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager`.`artikel_eigenschaft` (
  `art_id` INT NOT NULL,
  `eig_id` INT NOT NULL,
  PRIMARY KEY (`art_id`, `eig_id`),
  INDEX `fk_artikel_has_eigenschaft_eigenschaft1_idx` (`eig_id` ASC),
  INDEX `fk_artikel_has_eigenschaft_artikel1_idx` (`art_id` ASC),
  CONSTRAINT `fk_artikel_has_eigenschaft_artikel1`
    FOREIGN KEY (`art_id`)
    REFERENCES `lager`.`artikel` (`art_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artikel_has_eigenschaft_eigenschaft1`
    FOREIGN KEY (`eig_id`)
    REFERENCES `lager`.`eigenschaft` (`eig_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lager`.`artikel_verpackung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lager`.`artikel_verpackung` (
  `ver_id` INT NOT NULL,
  `art_id` INT NOT NULL,
  `eig_id` INT NOT NULL,
  `arve_einheit` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`ver_id`, `art_id`, `eig_id`, `arve_einheit`),
  INDEX `fk_artikel_has_verpackung_verpackung1_idx` (`ver_id` ASC),
  INDEX `fk_artikel_verpackung_artikel_eigenschaft1_idx` (`art_id` ASC, `eig_id` ASC),
  CONSTRAINT `fk_artikel_has_verpackung_verpackung1`
    FOREIGN KEY (`ver_id`)
    REFERENCES `lager`.`verpackung` (`ver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artikel_verpackung_artikel_eigenschaft1`
    FOREIGN KEY (`art_id` , `eig_id`)
    REFERENCES `lager`.`artikel_eigenschaft` (`art_id` , `eig_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `lager`.`artikel`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager`;
INSERT INTO `lager`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Mehl');
INSERT INTO `lager`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Zucker');
INSERT INTO `lager`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Gries');
INSERT INTO `lager`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Salz');
INSERT INTO `lager`.`artikel` (`art_id`, `art_name`) VALUES (DEFAULT, 'Backpulver');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lager`.`verpackung`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager`;
INSERT INTO `lager`.`verpackung` (`ver_id`, `ver_groesse`) VALUES (DEFAULT, 'g');
INSERT INTO `lager`.`verpackung` (`ver_id`, `ver_groesse`) VALUES (DEFAULT, 'kg');
INSERT INTO `lager`.`verpackung` (`ver_id`, `ver_groesse`) VALUES (DEFAULT, 'l');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lager`.`eigenschaft`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager`;
INSERT INTO `lager`.`eigenschaft` (`eig_id`, `eig_name`) VALUES (DEFAULT, 'grob');
INSERT INTO `lager`.`eigenschaft` (`eig_id`, `eig_name`) VALUES (DEFAULT, 'fein');
INSERT INTO `lager`.`eigenschaft` (`eig_id`, `eig_name`) VALUES (DEFAULT, 'jodfrei');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lager`.`artikel_eigenschaft`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager`;
INSERT INTO `lager`.`artikel_eigenschaft` (`art_id`, `eig_id`) VALUES (1, 1);
INSERT INTO `lager`.`artikel_eigenschaft` (`art_id`, `eig_id`) VALUES (1, 2);
INSERT INTO `lager`.`artikel_eigenschaft` (`art_id`, `eig_id`) VALUES (2, 1);
INSERT INTO `lager`.`artikel_eigenschaft` (`art_id`, `eig_id`) VALUES (2, 2);
INSERT INTO `lager`.`artikel_eigenschaft` (`art_id`, `eig_id`) VALUES (3, 1);
INSERT INTO `lager`.`artikel_eigenschaft` (`art_id`, `eig_id`) VALUES (4, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `lager`.`artikel_verpackung`
-- -----------------------------------------------------
START TRANSACTION;
USE `lager`;
INSERT INTO `lager`.`artikel_verpackung` (`ver_id`, `art_id`, `eig_id`, `arve_einheit`) VALUES (1, 1, 1, 500);
INSERT INTO `lager`.`artikel_verpackung` (`ver_id`, `art_id`, `eig_id`, `arve_einheit`) VALUES (2, 1, 1, 1.5);
INSERT INTO `lager`.`artikel_verpackung` (`ver_id`, `art_id`, `eig_id`, `arve_einheit`) VALUES (1, 1, 1, 250);
INSERT INTO `lager`.`artikel_verpackung` (`ver_id`, `art_id`, `eig_id`, `arve_einheit`) VALUES (1, 2, 2, 500);
INSERT INTO `lager`.`artikel_verpackung` (`ver_id`, `art_id`, `eig_id`, `arve_einheit`) VALUES (1, 2, 2, 250);
INSERT INTO `lager`.`artikel_verpackung` (`ver_id`, `art_id`, `eig_id`, `arve_einheit`) VALUES (1, 3, 1, 150);

COMMIT;