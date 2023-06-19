/*
    Tim Hofmann
    23.05.2023
    Übung zu Trigger
    Adresse & Addresse_Trigger
*/

-- schema
CREATE SCHEMA IF NOT EXISTS addresse_trigger;

## after insert
# table
CREATE TABLE IF NOT EXISTS addresse_trigger.after_insert_ort
(
    aio_id         INT PRIMARY KEY AUTO_INCREMENT,
    aio_user       VARCHAR(255) NOT NULL,
    aio_time       DATETIME     NOT NULL DEFAULT NOW(),
    aio_new_ort_id INT          NOT NULL
);

# trigger
-- DROP TRIGGER adresse.after_insert_ort;
CREATE TRIGGER IF NOT EXISTS adresse.after_insert_ort
    AFTER INSERT
    ON adresse.ort
    FOR EACH ROW
BEGIN
    INSERT INTO addresse_trigger.after_insert_ort (aio_user, aio_new_ort_id)
    VALUES (USER(), NEW.ort_id);
END;

# select & insert
INSERT INTO adresse.ort (ort_name) VALUES ('Wien');

SELECT * FROM addresse_trigger.after_insert_ort;


## after update
# table
CREATE TABLE addresse_trigger.after_update_ort
(
    aio_id           INT PRIMARY KEY AUTO_INCREMENT,
    aio_user         VARCHAR(255) NOT NULL,
    aio_time         DATETIME     NOT NULL DEFAULT NOW(),
    aio_old_ort_name VARCHAR(255) NOT NULL,
    aio_new_ort_name VARCHAR(255) NOT NULL,
    aio_old_ort_id   INT          NOT NULL
);

# trigger
-- DROP TRIGGER adresse.after_update_ort;
CREATE TRIGGER adresse.after_update_ort
    AFTER UPDATE
    ON ort
    FOR EACH ROW
BEGIN
    INSERT INTO addresse_trigger.after_update_ort (aio_user, aio_old_ort_name, aio_new_ort_name, aio_old_ort_id)
    VALUES (USER(), OLD.ort_name, NEW.ort_name, OLD.ort_id);
END;

# select & update
SELECT * FROM adresse.ort;

UPDATE adresse.ort SET ort_name = 'Wien 1' WHERE ort_id = 1;

SELECT * FROM addresse_trigger.after_update_ort;