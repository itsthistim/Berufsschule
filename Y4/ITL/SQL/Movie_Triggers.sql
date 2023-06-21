# Erstellen Sie eine Datenbank (Schema) movie_trigger mit folgenden Tabellen:
DROP SCHEMA IF EXISTS movie_trigger;
CREATE SCHEMA movie_trigger;

# Erstellen Sie folgende Tabellen:
## AFTER_INSERT_PROTAGONIST
CREATE TABLE movie_trigger.after_insert_protagonist
(
    aip_id        INT          NOT NULL AUTO_INCREMENT,
    aip_user      VARCHAR(100) NOT NULL,
    aip_time      DATETIME     NOT NULL DEFAULT NOW(),
    aip_pro_vname VARCHAR(100) NOT NULL,
    aip_pro_nname VARCHAR(100) NOT NULL,
    PRIMARY KEY (aip_id)
);

## AFTER_UPDATE_COUNTRY
CREATE TABLE movie_trigger.after_update_country
(
    auc_id           INT          NOT NULL AUTO_INCREMENT,
    auc_user         VARCHAR(100) NOT NULL,
    auc_time         DATETIME     NOT NULL DEFAULT NOW(),
    auc_cou_id       INT          NOT NULL,
    auc_cou_old_name VARCHAR(100) NOT NULL,
    auc_cou_new_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (auc_id)
);

# Erstellen Sie folgende Trigger:
## AFTER_INSERT_PROTAGONIST
### Speichern Sie, wer wann welchen Datensatz gespeichert hat
CREATE TRIGGER movie.user_insert_protagonist
    AFTER INSERT
    ON protagonist
    FOR EACH ROW
BEGIN
    INSERT INTO movie_trigger.after_insert_protagonist (aip_user, aip_pro_vname, aip_pro_nname)
    VALUES (USER(), new.pro_fname, new.pro_sname);
END;

## AFTER_UPDATE_COUNTRY
### Speichern Sie, wer wann welchen Datensatz geändert hat
CREATE TRIGGER movie.user_update_country
    AFTER UPDATE
    ON country
    FOR EACH ROW
BEGIN
    INSERT INTO movie_trigger.after_update_country (auc_user, auc_cou_id, auc_cou_old_name, auc_cou_new_name)
    VALUES (USER(), new.cou_id, old.cou_name, new.cou_name);
END;

# Testen der Trigger
## AFTER_INSERT_PROTAGONIST
SELECT * FROM movie.protagonist ORDER BY 1;

INSERT INTO movie.protagonist (pro_fname, pro_sname)
VALUES ('Tim', 'Hofmann');

SELECT * FROM movie_trigger.after_insert_protagonist ORDER BY 1;

## AFTER_UPDATE_COUNTRY
SELECT * FROM movie.country ORDER BY 1;

UPDATE movie.country SET cou_name = 'Austria' WHERE cou_id = 3;

SELECT * FROM movie_trigger.after_update_country ORDER BY 1;