-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema schule
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `schule` ;

-- -----------------------------------------------------
-- Schema schule
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `schule` DEFAULT CHARACTER SET utf8 ;
USE `schule` ;

-- -----------------------------------------------------
-- Table `schule`.`beruf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schule`.`beruf` (
  `ber_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ber_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ber_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `schule`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schule`.`person` (
  `per_id` INT(11) NOT NULL AUTO_INCREMENT,
  `per_nname` VARCHAR(50) NOT NULL,
  `per_vname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`per_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `schule`.`person_beruf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schule`.`person_beruf` (
  `pebe_id` INT NOT NULL AUTO_INCREMENT,
  `per_id` INT(11) NOT NULL,
  `ber_id` INT(11) NOT NULL,
  INDEX `per_id` (`per_id` ASC),
  INDEX `ber_id` (`ber_id` ASC),
  PRIMARY KEY (`pebe_id`),
  CONSTRAINT `person_beruf_ibfk_1`
    FOREIGN KEY (`per_id`)
    REFERENCES `schule`.`person` (`per_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `person_beruf_ibfk_2`
    FOREIGN KEY (`ber_id`)
    REFERENCES `schule`.`beruf` (`ber_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `schule`.`beruf`
-- -----------------------------------------------------
START TRANSACTION;
USE `schule`;
INSERT INTO `schule`.`beruf` (`ber_id`, `ber_name`) VALUES (NULL, 'Direktor');
INSERT INTO `schule`.`beruf` (`ber_id`, `ber_name`) VALUES (NULL, 'Lehrer');
INSERT INTO `schule`.`beruf` (`ber_id`, `ber_name`) VALUES (NULL, 'Schüler');
INSERT INTO `schule`.`beruf` (`ber_id`, `ber_name`) VALUES (NULL, 'Reinigungspersonal');
INSERT INTO `schule`.`beruf` (`ber_id`, `ber_name`) VALUES (NULL, 'Schulwart');
INSERT INTO `schule`.`beruf` (`ber_id`, `ber_name`) VALUES (NULL, 'Schularzt');

COMMIT;


-- -----------------------------------------------------
-- Data for table `schule`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `schule`;
INSERT INTO `schule`.`person` (`per_id`, `per_nname`, `per_vname`) VALUES (NULL, 'Huber', 'Maria');
INSERT INTO `schule`.`person` (`per_id`, `per_nname`, `per_vname`) VALUES (NULL, 'Maier', 'Christian');
INSERT INTO `schule`.`person` (`per_id`, `per_nname`, `per_vname`) VALUES (NULL, 'Hauser', 'Max');
INSERT INTO `schule`.`person` (`per_id`, `per_nname`, `per_vname`) VALUES (NULL, 'Baum', 'Felizita');

COMMIT;


-- -----------------------------------------------------
-- Data for table `schule`.`person_beruf`
-- -----------------------------------------------------
START TRANSACTION;
USE `schule`;
INSERT INTO `schule`.`person_beruf` (`pebe_id`, `per_id`, `ber_id`) VALUES (NULL, 3, 1);
INSERT INTO `schule`.`person_beruf` (`pebe_id`, `per_id`, `ber_id`) VALUES (NULL, 1, 2);
INSERT INTO `schule`.`person_beruf` (`pebe_id`, `per_id`, `ber_id`) VALUES (NULL, 2, 2);

COMMIT;

