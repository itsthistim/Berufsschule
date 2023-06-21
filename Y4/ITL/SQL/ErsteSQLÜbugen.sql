/*
	Tim Hofmann, 16.05.2023
    Übung zu select statements
*/

-- Funktionen
-- h) Personen ausgeben, Vor- u. Nachnamen in einer Spalte i. per_id (als PID) in eigener Spalte
SELECT CONCAT(per_vname, '', per_nname) AS "Person", per_id AS PID
  FROM person;

SELECT CONCAT_WS(' ', per_vname, per_nname) AS "Person", per_id AS PID
  FROM person;

-- i) Anzahl der Personen ausgeben
SELECT COUNT(*) AS "Anzahl Personen"
  FROM person;

-- j) Personen nach Nachnamen sortiert ausgeben
SELECT *
  FROM person
 ORDER BY per_nname ASC;

-- K) wie j), aber absteigend
SELECT *
  FROM person
 ORDER BY per_nname DESC;

-- l) Personen nach Nachnamen sortiert ausgeben, bei gleichen Nachnamen nach Vornamen sortieren
SELECT *
  FROM person
 ORDER BY per_nname ASC, per_vname DESC;

-- m) wie l, aber nur den 2ten Datensatz ausgeben
SELECT *
  FROM person
 ORDER BY per_nname ASC, per_vname DESC
 LIMIT 1,1;

-- n) alle personen deren nacnamen mit n beginnt
SELECT *
  FROM person
 WHERE per_nname LIKE 'n%';

-- Aufgabe:
-- Ortsname mit e im Wortverlauf
-- Personen deren Vorname an 2ten Stelle ein a enthält
-- Personen deren Nachname nicht auf r endet

SELECT * FROM ort WHERE ort_name LIKE '%e%';

SELECT * FROM person WHERE per_vname LIKE '_a%';

SELECT * FROM person WHERE per_nname NOT LIKE '%r';

SELECT * FROM strasse;

SELECT * FROM person;

-- Alle personen mit Straßennamen ausgeben
SELECT CONCAT_WS(' ', per_vname, per_nname) AS "Person", str_name AS "Straße"
  FROM person p,
       strasse s,
       person_strasse_ort_plz ps
 WHERE p.per_id = ps.per_id
   AND s.str_id = ps.str_id;

/*
PERSON, STRASSE, PLZ, ORT
sortiert nach Ortsnamen, Nachnamen, Vornamen
*/

SELECT CONCAT_WS(' ', per_vname, per_nname) AS "Person",
       str_name                             AS "Straße",
       plz.plz_nr                           AS "PLZ",
       ort.ort_name                         AS "Ort"
  FROM person_strasse_ort_plz
           NATURAL JOIN (person, strasse_ort_plz)
           NATURAL JOIN strasse
           NATURAL JOIN ort_plz
           NATURAL JOIN (ort, plz)
 ORDER BY ort.ort_name ASC, per_nname ASC, per_vname ASC;
#

-- Anzahl der personen pro ort
SELECT o.ort_name AS "Ort", COUNT(*) AS "Anzahl Personen"
  FROM person_strasse_ort_plz psop,
       ort o,
       ort_plz op
 WHERE psop.orpl_id = op.orpl_id
   AND op.ort_id = o.ort_id
 GROUP BY o.ort_name;

-- Outer Join
-- left outer join
-- 1) alle orte, und falls vorhanden, auch die plz_id
SELECT o.*, plz_id
  FROM ort o
           LEFT OUTER JOIN ort_plz op ON o.ort_id = op.ort_id;

-- test daten

SELECT * FROM person;

INSERT INTO person
VALUES (4, 'Erwin', 'Freud');

-- anzahl der personen, die noch keiner addresse zugeordnet sind
          SELECT COUNT(*) AS "Anzahl Personen"
           FROM person p
LEFT OUTER JOIN person_strasse_ort_plz psop ON p.per_id = psop.per_id
          WHERE psop.per_id IS NULL;