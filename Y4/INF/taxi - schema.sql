/*
    Tim Hofmann
    30.05.2023
    Taxi
*/

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema taxi
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `taxi`;

-- -----------------------------------------------------
-- Schema taxi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taxi` DEFAULT CHARACTER SET utf8;
USE `taxi`;

-- -----------------------------------------------------
-- Table `taxi`.`street`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`street`;

CREATE TABLE IF NOT EXISTS `taxi`.`street`
(
    `id`          INT         NOT NULL AUTO_INCREMENT,
    `street_name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taxi`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`city`;

CREATE TABLE IF NOT EXISTS `taxi`.`city`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `zip`  INT         NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taxi`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`address`;

CREATE TABLE IF NOT EXISTS `taxi`.`address`
(
    `id`            INT NOT NULL AUTO_INCREMENT,
    `street_id`     INT NOT NULL,
    `city_id`       INT NOT NULL,
    `street_number` INT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_address_street1_idx` (`street_id` ASC) VISIBLE,
    INDEX `fk_address_city1_idx` (`city_id` ASC) VISIBLE,
    CONSTRAINT `fk_address_street1`
        FOREIGN KEY (`street_id`)
            REFERENCES `taxi`.`street` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_address_city1`
        FOREIGN KEY (`city_id`)
            REFERENCES `taxi`.`city` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taxi`.`charging_station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`charging_station`;

CREATE TABLE IF NOT EXISTS `taxi`.`charging_station`
(
    `id`          INT NOT NULL AUTO_INCREMENT,
    `location_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_station_location1_idx` (`location_id` ASC) VISIBLE,
    CONSTRAINT `fk_station_location1`
        FOREIGN KEY (`location_id`)
            REFERENCES `taxi`.`address` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taxi`.`car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`car`;

CREATE TABLE IF NOT EXISTS `taxi`.`car`
(
    `id`                  INT         NOT NULL AUTO_INCREMENT,
    `license_plate`       VARCHAR(45) NOT NULL,
    `charging_station_id` INT         NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `license_plate_UNIQUE` (`license_plate` ASC) VISIBLE,
    INDEX `fk_car_charging_station1_idx` (`charging_station_id` ASC) VISIBLE,
    CONSTRAINT `fk_car_charging_station1`
        FOREIGN KEY (`charging_station_id`)
            REFERENCES `taxi`.`charging_station` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taxi`.`driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`driver`;

CREATE TABLE IF NOT EXISTS `taxi`.`driver`
(
    `id`        INT         NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(45) NOT NULL,
    `lastname`  VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taxi`.`car_driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`car_driver`;

CREATE TABLE IF NOT EXISTS `taxi`.`car_driver`
(
    `id`        INT  NOT NULL AUTO_INCREMENT,
    `driver_id` INT  NOT NULL,
    `car_id`    INT  NOT NULL,
    `date`      DATE NOT NULL DEFAULT NOW(),
    PRIMARY KEY (`id`),
    INDEX `fk_car_driver_car1_idx` (`car_id` ASC) VISIBLE,
    INDEX `fk_car_driver_driver1_idx` (`driver_id` ASC) VISIBLE,
    CONSTRAINT `fk_car_driver_car1`
        FOREIGN KEY (`car_id`)
            REFERENCES `taxi`.`car` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_car_driver_driver1`
        FOREIGN KEY (`driver_id`)
            REFERENCES `taxi`.`driver` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taxi`.`route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`route`;

CREATE TABLE IF NOT EXISTS `taxi`.`route`
(
    `id`              INT     NOT NULL AUTO_INCREMENT,
    `car_driver_id`   INT     NOT NULL,
    `start_location`  INT     NOT NULL,
    `target_location` INT     NOT NULL,
    `km`              INT     NOT NULL DEFAULT 0,
    `empty`           TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    INDEX `fk_route_location1_idx` (`target_location` ASC) VISIBLE,
    INDEX `fk_route_address1_idx` (`start_location` ASC) VISIBLE,
    INDEX `fk_route_car_driver1_idx` (`car_driver_id` ASC) VISIBLE,
    CONSTRAINT `fk_route_location1`
        FOREIGN KEY (`target_location`)
            REFERENCES `taxi`.`address` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_route_address1`
        FOREIGN KEY (`start_location`)
            REFERENCES `taxi`.`address` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_route_car_driver1`
        FOREIGN KEY (`car_driver_id`)
            REFERENCES `taxi`.`car_driver` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taxi`.`charging`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taxi`.`charging`;

CREATE TABLE IF NOT EXISTS `taxi`.`charging`
(
    `car_id`              INT      NOT NULL,
    `charging_station_id` INT      NOT NULL,
    `charge_duration`     TIME     NOT NULL DEFAULT '00:00:00',
    `charge_price`        DOUBLE   NOT NULL DEFAULT 0,
    `charge_time`         DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (`car_id`, `charging_station_id`),
    INDEX `fk_car_has_charging_station_charging_station1_idx` (`charging_station_id` ASC) VISIBLE,
    INDEX `fk_car_has_charging_station_car1_idx` (`car_id` ASC) VISIBLE,
    CONSTRAINT `fk_car_has_charging_station_car1`
        FOREIGN KEY (`car_id`)
            REFERENCES `taxi`.`car` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_car_has_charging_station_charging_station1`
        FOREIGN KEY (`charging_station_id`)
            REFERENCES `taxi`.`charging_station` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `taxi`.`street`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`street` (`id`, `street_name`) VALUES (DEFAULT, 'Urltal');
INSERT INTO `taxi`.`street` (`id`, `street_name`) VALUES (DEFAULT, 'Gsöllstraße');
INSERT INTO `taxi`.`street` (`id`, `street_name`) VALUES (DEFAULT, 'Berggasse');
INSERT INTO `taxi`.`street` (`id`, `street_name`) VALUES (DEFAULT, 'Wiener Straße');

COMMIT;


-- -----------------------------------------------------
-- Data for table `taxi`.`city`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`city` (`id`, `name`, `zip`) VALUES (DEFAULT, 'St. Peter/Au', 3352);
INSERT INTO `taxi`.`city` (`id`, `name`, `zip`) VALUES (DEFAULT, 'Wilhering', 4037);
INSERT INTO `taxi`.`city` (`id`, `name`, `zip`) VALUES (DEFAULT, 'Steinbach', 4989);
INSERT INTO `taxi`.`city` (`id`, `name`, `zip`) VALUES (DEFAULT, 'Linz', 4020);

COMMIT;


-- -----------------------------------------------------
-- Data for table `taxi`.`address`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`address` (`id`, `street_id`, `city_id`, `street_number`) VALUES (DEFAULT, 1, 1, 9);
INSERT INTO `taxi`.`address` (`id`, `street_id`, `city_id`, `street_number`) VALUES (DEFAULT, 3, 2, 5);
INSERT INTO `taxi`.`address` (`id`, `street_id`, `city_id`, `street_number`) VALUES (DEFAULT, 2, 3, 1);
INSERT INTO `taxi`.`address` (`id`, `street_id`, `city_id`, `street_number`) VALUES (DEFAULT, 4, 4, 181);

COMMIT;


-- -----------------------------------------------------
-- Data for table `taxi`.`charging_station`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`charging_station` (`id`, `location_id`) VALUES (DEFAULT, 4);
INSERT INTO `taxi`.`charging_station` (`id`, `location_id`) VALUES (DEFAULT, 1);
INSERT INTO `taxi`.`charging_station` (`id`, `location_id`) VALUES (DEFAULT, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `taxi`.`car`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`car` (`id`, `license_plate`, `charging_station_id`) VALUES (DEFAULT, 'LL 337 PN', 3);
INSERT INTO `taxi`.`car` (`id`, `license_plate`, `charging_station_id`) VALUES (DEFAULT, 'AM - 122 IR', 2);
INSERT INTO `taxi`.`car` (`id`, `license_plate`, `charging_station_id`) VALUES (DEFAULT, 'PP - VSML 2', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `taxi`.`driver`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`driver` (`id`, `firstname`, `lastname`) VALUES (DEFAULT, 'Stephan', 'Berndl');
INSERT INTO `taxi`.`driver` (`id`, `firstname`, `lastname`) VALUES (DEFAULT, 'Leander', 'Kieweg');
INSERT INTO `taxi`.`driver` (`id`, `firstname`, `lastname`) VALUES (DEFAULT, 'Tim', 'Hofmann');

COMMIT;


-- -----------------------------------------------------
-- Data for table `taxi`.`car_driver`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`car_driver` (`id`, `driver_id`, `car_id`, `date`) VALUES (DEFAULT, 1, 2, DEFAULT);
INSERT INTO `taxi`.`car_driver` (`id`, `driver_id`, `car_id`, `date`) VALUES (DEFAULT, 2, 3, DEFAULT);
INSERT INTO `taxi`.`car_driver` (`id`, `driver_id`, `car_id`, `date`) VALUES (DEFAULT, 3, 1, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `taxi`.`route`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`route` (`id`, `car_driver_id`, `start_location`, `target_location`, `km`, `empty`)
VALUES (DEFAULT, 1, 4, 1, 60, 0);
INSERT INTO `taxi`.`route` (`id`, `car_driver_id`, `start_location`, `target_location`, `km`, `empty`)
VALUES (DEFAULT, 2, 2, 3, 20, 1);
INSERT INTO `taxi`.`route` (`id`, `car_driver_id`, `start_location`, `target_location`, `km`, `empty`)
VALUES (DEFAULT, 3, 1, 2, 50, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `taxi`.`charging`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`charging` (`car_id`, `charging_station_id`, `charge_duration`, `charge_price`, `charge_time`)
VALUES (3, 1, '00:20:00', 25.00, DEFAULT);
INSERT INTO `taxi`.`charging` (`car_id`, `charging_station_id`, `charge_duration`, `charge_price`, `charge_time`)
VALUES (2, 2, '00:25:00', 30.00, DEFAULT);
INSERT INTO `taxi`.`charging` (`car_id`, `charging_station_id`, `charge_duration`, `charge_price`, `charge_time`)
VALUES (1, 3, '00:18:00', 28.00, DEFAULT);
INSERT INTO `taxi`.`charging` (`car_id`, `charging_station_id`, `charge_duration`, `charge_price`, `charge_time`)
VALUES (4, 4, '00:29:00', 30.00, DEFAULT);

COMMIT;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;