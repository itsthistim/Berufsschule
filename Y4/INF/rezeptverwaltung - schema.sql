/*
	Tim Hofmann
    12.06. 2023
    Rezeptverwaltung
*/


SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rezept
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rezept`;

-- -----------------------------------------------------
-- Schema rezept
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rezept` DEFAULT CHARACTER SET utf8;
USE `rezept`;

-- -----------------------------------------------------
-- Table `rezept`.`rezeptname`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rezept`.`rezept`;

CREATE TABLE IF NOT EXISTS `rezept`.`rezeptname`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rezept`.`zubereitung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rezept`.`zubereitung`;

CREATE TABLE IF NOT EXISTS `rezept`.`zubereitung`
(
    `id`             INT      NOT NULL AUTO_INCREMENT,
    `beschreibung`   TEXT     NOT NULL,
    `rezept_id`      INT      NOT NULL,
    `bereitgestellt` DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (`id`),
    INDEX `fk_zubereitung_rezeptname_idx` (`rezept_id` ASC) VISIBLE,
    CONSTRAINT `fk_zubereitung_rezeptname`
        FOREIGN KEY (`rezept_id`)
            REFERENCES `rezept`.`rezeptname` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rezept`.`zutat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rezept`.`zutat`;

CREATE TABLE IF NOT EXISTS `rezept`.`zutat`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rezept`.`einheit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rezept`.`einheit`;

CREATE TABLE IF NOT EXISTS `rezept`.`einheit`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rezept`.`zutat_einheit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rezept`.`zutat_einheit`;

CREATE TABLE IF NOT EXISTS `rezept`.`zutat_einheit`
(
    `id`         INT NOT NULL AUTO_INCREMENT,
    `zutat_id`   INT NOT NULL,
    `einheit_id` INT NOT NULL,
    INDEX `fk_zutat_has_einheit_einheit1_idx` (`einheit_id` ASC) VISIBLE,
    INDEX `fk_zutat_has_einheit_zutat1_idx` (`zutat_id` ASC) VISIBLE,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_zutat_has_einheit_zutat1`
        FOREIGN KEY (`zutat_id`)
            REFERENCES `rezept`.`zutat` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_zutat_has_einheit_einheit1`
        FOREIGN KEY (`einheit_id`)
            REFERENCES `rezept`.`einheit` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rezept`.`zubereitung_einheit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rezept`.`zubereitung_einheit`;

CREATE TABLE IF NOT EXISTS `rezept`.`zubereitung_einheit`
(
    `zutat_einheit_id` INT NOT NULL,
    `zubereitung_id`   INT NOT NULL,
    `menge`            INT NOT NULL,
    PRIMARY KEY (`zutat_einheit_id`, `zubereitung_id`),
    INDEX `fk_zutat_einheit_has_zubereitung_zubereitung1_idx` (`zubereitung_id` ASC) VISIBLE,
    INDEX `fk_zutat_einheit_has_zubereitung_zutat_einheit1_idx` (`zutat_einheit_id` ASC) VISIBLE,
    CONSTRAINT `fk_zutat_einheit_has_zubereitung_zutat_einheit1`
        FOREIGN KEY (`zutat_einheit_id`)
            REFERENCES `rezept`.`zutat_einheit` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_zutat_einheit_has_zubereitung_zubereitung1`
        FOREIGN KEY (`zubereitung_id`)
            REFERENCES `rezept`.`zubereitung` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `rezept`.`rezeptname`
-- -----------------------------------------------------
START TRANSACTION;
USE `rezept`;
INSERT INTO `rezept`.`rezeptname` (`id`, `name`) VALUES (DEFAULT, 'Marmorkuchen');
INSERT INTO `rezept`.`rezeptname` (`id`, `name`) VALUES (DEFAULT, 'Schnitzerl');
INSERT INTO `rezept`.`rezeptname` (`id`, `name`) VALUES (DEFAULT, 'Wiener Schnitzerl');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rezept`.`zubereitung`
-- -----------------------------------------------------
START TRANSACTION;
USE `rezept`;
INSERT INTO `rezept`.`zubereitung` (`id`, `beschreibung`, `rezept_id`, `bereitgestellt`)
VALUES (DEFAULT, 'Mischen Sie alle Zutaten zu einem Teig.', 1, '2021-05-14 12:10:25');
INSERT INTO `rezept`.`zubereitung` (`id`, `beschreibung`, `rezept_id`, `bereitgestellt`)
VALUES (DEFAULT, 'Salzen, nicht Klopfen sondern drücken', 2, '2021-10-22 23:40:22');
INSERT INTO `rezept`.`zubereitung` (`id`, `beschreibung`, `rezept_id`, `bereitgestellt`)
VALUES (DEFAULT, 'Verwenden Sie extra dünn geschnittene Filetschnitten', 3, '2022-01-10 16:15:05');
INSERT INTO `rezept`.`zubereitung` (`id`, `beschreibung`, `rezept_id`, `bereitgestellt`)
VALUES (DEFAULT, 'Zuerst Eiklar steif schlagen, dann Mehl langsam untermischen usw', 1, '2022-05-06 10:05:01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rezept`.`zutat`
-- -----------------------------------------------------
START TRANSACTION;
USE `rezept`;
INSERT INTO `rezept`.`zutat` (`id`, `name`) VALUES (DEFAULT, 'Eier');
INSERT INTO `rezept`.`zutat` (`id`, `name`) VALUES (DEFAULT, 'Kakaopulver');
INSERT INTO `rezept`.`zutat` (`id`, `name`) VALUES (DEFAULT, 'Mehl');
INSERT INTO `rezept`.`zutat` (`id`, `name`) VALUES (DEFAULT, 'Salz');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rezept`.`einheit`
-- -----------------------------------------------------
START TRANSACTION;
USE `rezept`;
INSERT INTO `rezept`.`einheit` (`id`, `name`) VALUES (DEFAULT, 'Prise');
INSERT INTO `rezept`.`einheit` (`id`, `name`) VALUES (DEFAULT, 'dag');
INSERT INTO `rezept`.`einheit` (`id`, `name`) VALUES (DEFAULT, 'Stück');
INSERT INTO `rezept`.`einheit` (`id`, `name`) VALUES (DEFAULT, 'kg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rezept`.`zutat_einheit`
-- -----------------------------------------------------
START TRANSACTION;
USE `rezept`;
INSERT INTO `rezept`.`zutat_einheit` (`id`, `zutat_id`, `einheit_id`) VALUES (DEFAULT, 1, 2);
INSERT INTO `rezept`.`zutat_einheit` (`id`, `zutat_id`, `einheit_id`) VALUES (DEFAULT, 1, 4);
INSERT INTO `rezept`.`zutat_einheit` (`id`, `zutat_id`, `einheit_id`) VALUES (DEFAULT, 2, 3);
INSERT INTO `rezept`.`zutat_einheit` (`id`, `zutat_id`, `einheit_id`) VALUES (DEFAULT, 3, 1);
INSERT INTO `rezept`.`zutat_einheit` (`id`, `zutat_id`, `einheit_id`) VALUES (DEFAULT, 4, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rezept`.`zubereitung_einheit`
-- -----------------------------------------------------
START TRANSACTION;
USE `rezept`;
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (1, 1, 50);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (3, 1, 4);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (4, 1, 1);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (5, 1, 20);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (1, 2, 20);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (3, 2, 2);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (4, 2, 3);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (1, 3, 20);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (4, 4, 1);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (5, 4, 25);
INSERT INTO `rezept`.`zubereitung_einheit` (`zutat_einheit_id`, `zubereitung_id`, `menge`) VALUES (1, 4, 75);

COMMIT;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;



# tests


# Zutaten für Rezept "Marmorkuchen" ausgeben
SELECT zubeh.menge AS `Menge`, e.name AS `Einheit`, z.name AS `Zutat`
  FROM zubereitung_einheit zubeh,
       zutat_einheit zuteh,
       zubereitung zub,
       rezeptname r,
       zutat z,
       einheit e
 WHERE zubeh.zutat_einheit_id = zuteh.id
   AND zuteh.zutat_id = z.id
   AND zuteh.einheit_id = e.id
   AND zubeh.zubereitung_id = zub.id
   AND zub.rezept_id = r.id
   AND r.name LIKE 'Marmorkuchen';

SELECT *
  FROM rezeptname
 WHERE name LIKE '%schn%';


# zubereitungen für Rezept "Marmorkuchen" ausgeben
SELECT z.id AS `Zubereitung-ID`, z.beschreibung AS `Zubereitung`, z.bereitgestellt AS `Bereitgestellt`
  FROM zubereitung z,
       rezeptname r
 WHERE z.rezept_id = r.id
   AND r.name LIKE 'Marmorkuchen';


# Zutaten eines bestimmten Zubereitungsschrittes ausgeben
SELECT zubeh.menge AS `Menge`, e.name AS `Einheit`, zut.name AS `Zutat`
  FROM zubereitung z,
       zubereitung_einheit zubeh,
       zutat_einheit zuteh,
       zutat zut,
       einheit e
 WHERE z.id = zubeh.zubereitung_id
   AND zubeh.zutat_einheit_id = zuteh.id
   AND zuteh.zutat_id = zut.id
   AND zuteh.einheit_id = e.id
   AND z.id = 1;

SELECT z.id AS `Zubereitung-ID`, z.beschreibung AS `Zubereitung`, z.bereitgestellt AS `Bereitgestellt`
  FROM zubereitung z,
       rezeptname r
 WHERE z.rezept_id = r.id
   AND r.id = 1;

SELECT z.id AS `Zubereitung-ID`, z.beschreibung AS `Zubereitung`, z.bereitgestellt AS `Bereitgestellt`
  FROM zubereitung z,
       rezeptname r
 WHERE z.rezept_id = r.id
   AND r.id = 3;

# alle rezepte, die an einem bestimmten datum bereitgestellt wurden
SELECT r.name AS `Rezept`, z.bereitgestellt AS `Bereitgestellt`
  FROM rezeptname r,
       zubereitung z
 WHERE r.id = z.rezept_id
   AND DATE(z.bereitgestellt) BETWEEN '2002 -01-01' AND NOW();


SELECT * FROM zubereitung;