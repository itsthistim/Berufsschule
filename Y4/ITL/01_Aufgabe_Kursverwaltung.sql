/*
    Tim Hofmann
    Kursverwaltung
*/

SHOW TABLES;

SELECT * FROM person;

SELECT * FROM kurs;

SELECT * FROM kurstermin;

SELECT * FROM kurspreis;

SELECT * FROM buchung;

-- a) Geben Sie alle Kursteilnehmer eines bestimmten Kurses aus.
-- Alle Teilnehmer des Kurses "PHP 5"
SELECT p.per_vname AS Vorname,
       p.per_nname AS Nachname
  FROM person p,
       buchung b,
       kurstermin kt,
       kurs k
 WHERE p.per_id = b.per_id
   AND b.kute_id = kt.kute_id
   AND kt.kur_id = k.kur_id
   AND k.kur_bezeichnung = 'PHP 5'
 GROUP BY p.per_id -- falls eine Person den gleichen Kurs mehrmals gebucht hat
 ORDER BY 1;

-- b) Anzahl der Teilnehmer je Kurs - sortiert nach Kursbezeichnung
SELECT k.kur_bezeichnung AS Kursbezeichnung,
       COUNT(*)          AS Anzahl
  FROM person p,
       buchung b,
       kurstermin kt,
       kurs k
 WHERE p.per_id = b.per_id
   AND b.kute_id = kt.kute_id
   AND kt.kur_id = k.kur_id
 GROUP BY k.kur_id
 ORDER BY 1;

-- c) Ermitteln Sie alle Kurse und führen Sie die Kursleiter an. Formatieren Sie das Datum mit DATE_FORMAT.
SELECT CONCAT_WS(' ', p.per_vname, p.per_nname) AS Kursleiter,
       k.kur_bezeichnung                        AS Kursbezeichnung,
       DATE_FORMAT(kt.kute_start, '%d.%m.%Y')   AS Beginn
  FROM kurs k,
       kurstermin kt,
       person p
 WHERE k.kur_id = kt.kur_id
   AND kt.vortragender_per_id = p.per_id
   AND kt.kur_id = k.kur_id;

-- d) Ermitteln Sie, wie viele Personen noch nie an einem Kurs teilgenommen haben.
SELECT COUNT(*) AS Anzahl
  FROM person p
 WHERE p.per_id NOT IN (SELECT b.per_id FROM buchung b);

-- e) Ermitteln Sie, welche Personen einen bestimmten Kurs noch nicht besucht haben, sortiert nach Kurs, Personen.
  WITH kurs AS (SELECT k.kur_id,
                       k.kur_bezeichnung
                  FROM kurs k
                 WHERE k.kur_bezeichnung = 'Geschichte der Programmiersprachen')
SELECT CONCAT_WS(' ', p.per_vname, p.per_nname) AS Person,
       kurs.kur_bezeichnung                     AS Kurs
  FROM person p,
       kurs
 WHERE p.per_id NOT IN (SELECT b.per_id
                          FROM buchung b,
                               kurstermin kt,
                               kurs
                         WHERE b.kute_id = kt.kute_id
                           AND kurs.kur_bezeichnung = 'Geschichte der Programmiersprachen')
 ORDER BY 1, 2;

-- f) Geben Sie alle Kurse aus, die mehr als 150 aber weniger als 2000 Euro kosten.
SELECT k.kur_bezeichnung AS Kursbezeichnung,
       kp.kupr_wert      AS Preis
  FROM kurs k,
       kurspreis kp
 WHERE k.kur_id = kp.kur_id
   AND kp.kupr_wert BETWEEN 150 AND 2000;

-- g) Geben Sie alle Personen aus, in deren Nachname an zweiter Stelle ein bestimmter Buchstabe steht (Sie dürfen diesen selbst wählen, z.B. a)
SELECT p.per_vname AS Vorname,
       p.per_nname AS Nachname
  FROM person p
 WHERE p.per_nname LIKE '_a%';

-- h) Geben Sie alle Personen aus deren Nachname mit einem bestimmten Buchstaben beginnt und deren Vorname mit einem bestimmten Buchstaben endet.
SELECT p.per_vname AS Vorname,
       p.per_nname AS Nachname
  FROM person p
 WHERE p.per_nname LIKE 'H%'
   AND p.per_vname LIKE '%n';

-- i) Geben Sie die Preisentwicklung zu einem bestimmten Kurs aus.
SELECT k.kur_bezeichnung kurs, kp.kupr_wert preis, kp.kupr_bis "Gültig bis"
  FROM kurs k,
       kurspreis kp
 WHERE k.kur_id = kp.kur_id
   AND k.kur_bezeichnung = 'PHP 5'
 ORDER BY kupr_wert;

-- j) Geben Sie alle Personen nach Geschlecht, Nachnamen und Vornamen sortiert aus - wählen sie mind. einmal absteigend.
SELECT per_vname vorname, per_nname nachname, per_geschlecht geschlecht
  FROM person p
 ORDER BY per_geschlecht DESC, per_vname, per_nname;

-- k) Welche Kurse finden in einem gewissen Zeitraum statt (legen Sie den Zeitraum selber fest, z.B. 1.10.08 bis 1.02.09
SELECT *
  FROM kurs k,
       kurstermin kt
 WHERE k.kur_id = kt.kur_id
   AND DATE_FORMAT(kt.kute_start, '%y%m%d') BETWEEN DATE_FORMAT('01.10.00', '%d%m%y') AND DATE_FORMAT('01.10.20', '%d%m%y');