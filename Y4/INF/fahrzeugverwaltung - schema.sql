/*
    Tim Hofmann
    05.06.2023
    Fahrzeugverwaltung
*/

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fahrzeugverwaltung
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `fahrzeugverwaltung`;

-- -----------------------------------------------------
-- Schema fahrzeugverwaltung
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fahrzeugverwaltung` DEFAULT CHARACTER SET utf8;
USE `fahrzeugverwaltung`;

-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`typ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`typ`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`typ`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`marke`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`marke`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`marke`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`modell`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`modell`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`modell`
(
    `id`       INT         NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(45) NOT NULL,
    `marke_id` INT         NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_modell_marke1_idx` (`marke_id` ASC) VISIBLE,
    CONSTRAINT `fk_modell_marke1`
        FOREIGN KEY (`marke_id`)
            REFERENCES `fahrzeugverwaltung`.`marke` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`fahrzeug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`fahrzeug`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`fahrzeug`
(
    `id`                INT         NOT NULL AUTO_INCREMENT,
    `baujahr`           INT         NOT NULL,
    `fahrgestellnummer` VARCHAR(17) NOT NULL,
    `typ_id`            INT         NOT NULL,
    `marke_id`          INT         NOT NULL,
    `modell_id`         INT         NOT NULL,
    `kilometerstand`    INT         NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `fahrgestellnummer_UNIQUE` (`fahrgestellnummer` ASC) VISIBLE,
    INDEX `fk_fahrzeug_typ1_idx` (`typ_id` ASC) VISIBLE,
    INDEX `fk_fahrzeug_marke1_idx` (`marke_id` ASC) VISIBLE,
    INDEX `fk_fahrzeug_modell1_idx` (`modell_id` ASC) VISIBLE,
    CONSTRAINT `fk_fahrzeug_typ1`
        FOREIGN KEY (`typ_id`)
            REFERENCES `fahrzeugverwaltung`.`typ` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_fahrzeug_marke1`
        FOREIGN KEY (`marke_id`)
            REFERENCES `fahrzeugverwaltung`.`marke` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_fahrzeug_modell1`
        FOREIGN KEY (`modell_id`)
            REFERENCES `fahrzeugverwaltung`.`modell` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`ort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`ort`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`ort`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `zip`  VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `zip_UNIQUE` (`zip` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`straße`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`straße`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`straße`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`adresse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`adresse`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`adresse`
(
    `id`            INT NOT NULL AUTO_INCREMENT,
    `ort_id`        INT NOT NULL,
    `straße_id`     INT NOT NULL,
    `straßennummer` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_adresse_ort1_idx` (`ort_id` ASC) VISIBLE,
    INDEX `fk_adresse_straße1_idx` (`straße_id` ASC) VISIBLE,
    CONSTRAINT `fk_adresse_ort1`
        FOREIGN KEY (`ort_id`)
            REFERENCES `fahrzeugverwaltung`.`ort` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_adresse_straße1`
        FOREIGN KEY (`straße_id`)
            REFERENCES `fahrzeugverwaltung`.`straße` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`person`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`person`
(
    `id`          INT         NOT NULL AUTO_INCREMENT,
    `firstname`   VARCHAR(45) NOT NULL,
    `lastname`    VARCHAR(45) NOT NULL,
    `adresse_id`  INT         NOT NULL,
    `is_employee` TINYINT     NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_person_adresse1_idx` (`adresse_id` ASC) VISIBLE,
    CONSTRAINT `fk_person_adresse1`
        FOREIGN KEY (`adresse_id`)
            REFERENCES `fahrzeugverwaltung`.`adresse` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`besitzer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`besitzer`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`besitzer`
(
    `person_id`   INT  NOT NULL,
    `fahrzeug_id` INT  NOT NULL,
    `from`        DATE NOT NULL DEFAULT NOW(),
    `to`          DATE NULL,
    PRIMARY KEY (`person_id`, `fahrzeug_id`),
    INDEX `fk_person_has_fahrzeug_fahrzeug1_idx` (`fahrzeug_id` ASC) VISIBLE,
    INDEX `fk_person_has_fahrzeug_person_idx` (`person_id` ASC) VISIBLE,
    CONSTRAINT `fk_person_has_fahrzeug_person`
        FOREIGN KEY (`person_id`)
            REFERENCES `fahrzeugverwaltung`.`person` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_person_has_fahrzeug_fahrzeug1`
        FOREIGN KEY (`fahrzeug_id`)
            REFERENCES `fahrzeugverwaltung`.`fahrzeug` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`extras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`extras`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`extras`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`verkauf`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`verkauf`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`verkauf`
(
    `id`           INT NOT NULL AUTO_INCREMENT,
    `verkäufer_id` INT NOT NULL,
    `fahrzeug_id`  INT NOT NULL,
    `käufer_id`    INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_verkauf_besitzer1_idx` (`verkäufer_id` ASC, `fahrzeug_id` ASC) VISIBLE,
    INDEX `fk_verkauf_person1_idx` (`käufer_id` ASC) VISIBLE,
    CONSTRAINT `fk_verkauf_besitzer1`
        FOREIGN KEY (`verkäufer_id`, `fahrzeug_id`)
            REFERENCES `fahrzeugverwaltung`.`besitzer` (`person_id`, `fahrzeug_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_verkauf_person1`
        FOREIGN KEY (`käufer_id`)
            REFERENCES `fahrzeugverwaltung`.`person` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fahrzeugverwaltung`.`fahrzeug_extras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrzeugverwaltung`.`fahrzeug_extras`;

CREATE TABLE IF NOT EXISTS `fahrzeugverwaltung`.`fahrzeug_extras`
(
    `fahrzeug_id` INT NOT NULL,
    `extras_id`   INT NOT NULL,
    PRIMARY KEY (`fahrzeug_id`, `extras_id`),
    INDEX `fk_fahrzeug_has_extras_extras1_idx` (`extras_id` ASC) VISIBLE,
    INDEX `fk_fahrzeug_has_extras_fahrzeug1_idx` (`fahrzeug_id` ASC) VISIBLE,
    CONSTRAINT `fk_fahrzeug_has_extras_fahrzeug1`
        FOREIGN KEY (`fahrzeug_id`)
            REFERENCES `fahrzeugverwaltung`.`fahrzeug` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_fahrzeug_has_extras_extras1`
        FOREIGN KEY (`extras_id`)
            REFERENCES `fahrzeugverwaltung`.`extras` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`typ`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`typ` (`id`, `name`) VALUES (DEFAULT, 'Kleinwagen');
INSERT INTO `fahrzeugverwaltung`.`typ` (`id`, `name`) VALUES (DEFAULT, 'Kombi');
INSERT INTO `fahrzeugverwaltung`.`typ` (`id`, `name`) VALUES (DEFAULT, 'SUV');

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`marke`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`marke` (`id`, `name`) VALUES (DEFAULT, 'Mitsubishi');
INSERT INTO `fahrzeugverwaltung`.`marke` (`id`, `name`) VALUES (DEFAULT, 'Kia');
INSERT INTO `fahrzeugverwaltung`.`marke` (`id`, `name`) VALUES (DEFAULT, 'BMW');

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`modell`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`modell` (`id`, `name`, `marke_id`) VALUES (DEFAULT, 'Space Star', 1);
INSERT INTO `fahrzeugverwaltung`.`modell` (`id`, `name`, `marke_id`) VALUES (DEFAULT, 'i3', 3);
INSERT INTO `fahrzeugverwaltung`.`modell` (`id`, `name`, `marke_id`) VALUES (DEFAULT, 'Sportage', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`fahrzeug`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`fahrzeug` (`id`, `baujahr`, `fahrgestellnummer`, `typ_id`, `marke_id`, `modell_id`,
                                             `kilometerstand`)
VALUES (DEFAULT, 2019, 'A0L000051T2123456', 1, 1, 1, 20000);
INSERT INTO `fahrzeugverwaltung`.`fahrzeug` (`id`, `baujahr`, `fahrgestellnummer`, `typ_id`, `marke_id`, `modell_id`,
                                             `kilometerstand`)
VALUES (DEFAULT, 2008, 'W0L030652M2823844', 3, 2, 3, 163000);
INSERT INTO `fahrzeugverwaltung`.`fahrzeug` (`id`, `baujahr`, `fahrgestellnummer`, `typ_id`, `marke_id`, `modell_id`,
                                             `kilometerstand`)
VALUES (DEFAULT, 2003, 'A0L030652X2823467', 2, 3, 2, 70000);
INSERT INTO `fahrzeugverwaltung`.`fahrzeug` (`id`, `baujahr`, `fahrgestellnummer`, `typ_id`, `marke_id`, `modell_id`,
                                             `kilometerstand`)
VALUES (DEFAULT, 2022, 'W0L025652M2823844', 1, 3, 2, 0);
INSERT INTO `fahrzeugverwaltung`.`fahrzeug` (`id`, `baujahr`, `fahrgestellnummer`, `typ_id`, `marke_id`, `modell_id`,
                                             `kilometerstand`)
VALUES (DEFAULT, 2001, 'X0L030652X2823488', 2, 3, 2, 90000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`ort`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`ort` (`id`, `name`, `zip`) VALUES (DEFAULT, 'Wilhering', '4073');
INSERT INTO `fahrzeugverwaltung`.`ort` (`id`, `name`, `zip`) VALUES (DEFAULT, 'Linz', '4020');

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`straße`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`straße` (`id`, `name`) VALUES (DEFAULT, 'Berggasse');
INSERT INTO `fahrzeugverwaltung`.`straße` (`id`, `name`) VALUES (DEFAULT, 'Wiener Straße');

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`adresse`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`adresse` (`id`, `ort_id`, `straße_id`, `straßennummer`) VALUES (DEFAULT, 1, 1, 4);
INSERT INTO `fahrzeugverwaltung`.`adresse` (`id`, `ort_id`, `straße_id`, `straßennummer`) VALUES (DEFAULT, 2, 2, 181);

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`person` (`id`, `firstname`, `lastname`, `adresse_id`, `is_employee`)
VALUES (DEFAULT, 'Tim', 'Hofmann', 1, 0);
INSERT INTO `fahrzeugverwaltung`.`person` (`id`, `firstname`, `lastname`, `adresse_id`, `is_employee`)
VALUES (DEFAULT, 'Jan', 'Hofmann', 1, 1);
INSERT INTO `fahrzeugverwaltung`.`person` (`id`, `firstname`, `lastname`, `adresse_id`, `is_employee`)
VALUES (DEFAULT, 'Leander', 'Kieweg', 2, 0);
INSERT INTO `fahrzeugverwaltung`.`person` (`id`, `firstname`, `lastname`, `adresse_id`, `is_employee`)
VALUES (DEFAULT, 'Lukas', 'Natotea', 3, 1);
INSERT INTO `fahrzeugverwaltung`.`person` (`id`, `firstname`, `lastname`, `adresse_id`, `is_employee`)
VALUES (DEFAULT, 'Firma', 'Graupel', 2, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`besitzer`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`besitzer` (`person_id`, `fahrzeug_id`, `from`, `to`)
VALUES (1, 1, '2019-08-19 13:20:00', NULL);
INSERT INTO `fahrzeugverwaltung`.`besitzer` (`person_id`, `fahrzeug_id`, `from`, `to`)
VALUES (2, 3, '2018-02-21 17:10:00', NULL);
INSERT INTO `fahrzeugverwaltung`.`besitzer` (`person_id`, `fahrzeug_id`, `from`, `to`)
VALUES (3, 2, '2021-04-12 09:23:00', '2022-09-13 09:23:00');
INSERT INTO `fahrzeugverwaltung`.`besitzer` (`person_id`, `fahrzeug_id`, `from`, `to`)
VALUES (4, 2, '2022-09-13 09:23:00', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`extras`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`extras` (`id`, `name`) VALUES (DEFAULT, 'Sitzheizung');
INSERT INTO `fahrzeugverwaltung`.`extras` (`id`, `name`) VALUES (DEFAULT, 'Klimaanlage');

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`verkauf`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`verkauf` (`id`, `verkäufer_id`, `fahrzeug_id`, `käufer_id`)
VALUES (DEFAULT, 3, 2, 4);
INSERT INTO `fahrzeugverwaltung`.`verkauf` (`id`, `verkäufer_id`, `fahrzeug_id`, `käufer_id`)
VALUES (DEFAULT, 5, 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `fahrzeugverwaltung`.`fahrzeug_extras`
-- -----------------------------------------------------
START TRANSACTION;
USE `fahrzeugverwaltung`;
INSERT INTO `fahrzeugverwaltung`.`fahrzeug_extras` (`fahrzeug_id`, `extras_id`) VALUES (1, 1);
INSERT INTO `fahrzeugverwaltung`.`fahrzeug_extras` (`fahrzeug_id`, `extras_id`) VALUES (3, 2);

COMMIT;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;