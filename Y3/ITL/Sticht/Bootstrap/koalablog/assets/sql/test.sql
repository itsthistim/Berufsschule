-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blog_cms
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `blog_cms` ;

-- -----------------------------------------------------
-- Schema blog_cms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog_cms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blog_cms` ;

-- -----------------------------------------------------
-- Table `blog_cms`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`users` ;

CREATE TABLE IF NOT EXISTS `blog_cms`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_cms`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`projects` ;

CREATE TABLE IF NOT EXISTS `blog_cms`.`projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `Description` VARCHAR(1024) NOT NULL,
  `color_main` CHAR(8) NULL DEFAULT NULL,
  `color_secondary` CHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_cms`.`articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`articles` ;

CREATE TABLE IF NOT EXISTS `blog_cms`.`articles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(191) NOT NULL,
  `body` TEXT NULL DEFAULT NULL,
  `published` TINYINT(1) NULL DEFAULT '0',
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `slug` (`slug` ASC) VISIBLE,
  INDEX `user_key` (`user_id` ASC) VISIBLE,
  INDEX `project_key` (`project_id` ASC) VISIBLE,
  CONSTRAINT `articles_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog_cms`.`users` (`id`),
  CONSTRAINT `articles_ibfk_2`
    FOREIGN KEY (`project_id`)
    REFERENCES `blog_cms`.`projects` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_cms`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`tags` ;

CREATE TABLE IF NOT EXISTS `blog_cms`.`tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(191) NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `title` (`title` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog_cms`.`articles_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_cms`.`articles_tags` ;

CREATE TABLE IF NOT EXISTS `blog_cms`.`articles_tags` (
  `article_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`article_id`, `tag_id`),
  INDEX `tag_key` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `articles_tags_ibfk_1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `blog_cms`.`tags` (`id`),
  CONSTRAINT `articles_tags_ibfk_2`
    FOREIGN KEY (`article_id`)
    REFERENCES `blog_cms`.`articles` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
