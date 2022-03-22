-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema business
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `business` ;

-- -----------------------------------------------------
-- Schema business
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `business` DEFAULT CHARACTER SET utf8 ;
USE `business` ;

-- -----------------------------------------------------
-- Table `business`.`articlegroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business`.`articlegroup` (
  `argr_id` INT NOT NULL AUTO_INCREMENT,
  `argr_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`argr_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `business`.`producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business`.`producer` (
  `pro_id` INT NOT NULL AUTO_INCREMENT,
  `pro_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pro_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `business`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business`.`article` (
  `art_id` INT NOT NULL AUTO_INCREMENT,
  `art_name1` VARCHAR(45) NOT NULL,
  `art_name2` VARCHAR(45) NULL,
  `argr_id` INT NOT NULL,
  `pro_id` INT NOT NULL,
  PRIMARY KEY (`art_id`),
  INDEX `fk_article_articlegroup_idx` (`argr_id` ASC) VISIBLE,
  INDEX `fk_article_producer1_idx` (`pro_id` ASC) VISIBLE,
  CONSTRAINT `fk_article_articlegroup`
    FOREIGN KEY (`argr_id`)
    REFERENCES `business`.`articlegroup` (`argr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_producer1`
    FOREIGN KEY (`pro_id`)
    REFERENCES `business`.`producer` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `business`.`articlegroup`
-- -----------------------------------------------------
START TRANSACTION;
USE `business`;
INSERT INTO `business`.`articlegroup` (`argr_id`, `argr_name`) VALUES (DEFAULT, 'Kamera');
INSERT INTO `business`.`articlegroup` (`argr_id`, `argr_name`) VALUES (DEFAULT, 'Monitor');
INSERT INTO `business`.`articlegroup` (`argr_id`, `argr_name`) VALUES (DEFAULT, 'Leinwand');

COMMIT;


-- -----------------------------------------------------
-- Data for table `business`.`producer`
-- -----------------------------------------------------
START TRANSACTION;
USE `business`;
INSERT INTO `business`.`producer` (`pro_id`, `pro_name`) VALUES (DEFAULT, 'Canon');
INSERT INTO `business`.`producer` (`pro_id`, `pro_name`) VALUES (DEFAULT, 'Dell');
INSERT INTO `business`.`producer` (`pro_id`, `pro_name`) VALUES (DEFAULT, 'Elite Screens');

COMMIT;


-- -----------------------------------------------------
-- Data for table `business`.`article`
-- -----------------------------------------------------
START TRANSACTION;
USE `business`;
INSERT INTO `business`.`article` (`art_id`, `art_name1`, `art_name2`, `argr_id`, `pro_id`) VALUES (DEFAULT, 'EOS 2000D', NULL, 1, 1);
INSERT INTO `business`.`article` (`art_id`, `art_name1`, `art_name2`, `argr_id`, `pro_id`) VALUES (DEFAULT, 'P2419H', NULL, 2, 2);
INSERT INTO `business`.`article` (`art_id`, `art_name1`, `art_name2`, `argr_id`, `pro_id`) VALUES (DEFAULT, 'Saker', NULL, 3, 3);
INSERT INTO `business`.`article` (`art_id`, `art_name1`, `art_name2`, `argr_id`, `pro_id`) VALUES (DEFAULT, 'EOS R6', NULL, 1, 1);
INSERT INTO `business`.`article` (`art_id`, `art_name1`, `art_name2`, `argr_id`, `pro_id`) VALUES (DEFAULT, 'PowerShot G7', 'MarkII', 1, 1);
INSERT INTO `business`.`article` (`art_id`, `art_name1`, `art_name2`, `argr_id`, `pro_id`) VALUES (DEFAULT, 'Ixus 190', NULL, 1, 1);

COMMIT;

