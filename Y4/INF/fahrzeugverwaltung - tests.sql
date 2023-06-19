/*
    Tim Hofmann
    05.06.2023
    Fahrzeugverwaltung
*/

# Wer hat einen bestimmten Wagen gekauft?
SELECT CONCAT(p.firstname, ' ', p.lastname)   AS Käufer,
       CONCAT(p2.firstname, ' ', p2.lastname) AS Verkäufer,
       f.fahrgestellnummer                    AS Fahrgestellnummer,
       m.name                                 AS Marke,
       mo.name                                AS Modell,
       t.name                                 AS Typ,
       f.baujahr                              AS Baujahr,
       f.kilometerstand                       AS Kilometerstand
  FROM person p,
       person p2,
       fahrzeug f,
       verkauf v,
       marke m,
       modell mo,
       typ t
 WHERE p.id = v.käufer_id
   AND f.id = v.fahrzeug_id
   AND f.marke_id = m.id
   AND f.modell_id = mo.id
   AND f.typ_id = t.id
   AND p2.id = v.verkäufer_id;

SELECT * FROM fahrzeug;

# Wie viele gebrauchte und wie viele neue Autos hat ein bestimmter Verkäufer verkauft?
SELECT CONCAT(p.firstname, ' ', p.lastname)                                                        AS verkäufer,
       (SELECT COUNT(*)
          FROM verkauf v
         WHERE v.verkäufer_id = p.id
           AND v.fahrzeug_id IN (SELECT b.fahrzeug_id FROM besitzer b WHERE b.to IS NOT NULL))     AS Gebrauchtwagen,
       (SELECT COUNT(*)
          FROM verkauf v
         WHERE v.verkäufer_id = p.id
           AND v.fahrzeug_id NOT IN (SELECT b.fahrzeug_id FROM besitzer b WHERE b.to IS NOT NULL)) AS Neuwagen
  FROM person p;

# Autos im Bestand (Autos, ohne Besitzer und ohne Verkauf)
SELECT f.baujahr,
       m.name,
       mo.name,
       t.name,
       f.fahrgestellnummer,
       f.kilometerstand
  FROM fahrzeug f,
       marke m,
       modell mo,
       typ t
 WHERE f.id NOT IN (SELECT b.fahrzeug_id FROM besitzer b WHERE b.to IS NULL)
   AND f.id NOT IN (SELECT v.fahrzeug_id FROM verkauf v)
   AND f.marke_id = m.id
   AND f.modell_id = mo.id
   AND f.typ_id = t.id;

# Wie viele Fahrzeuge einer bestimmten Fahrzeugart (Kombi, PKW, etc.) gibt es im Bestand?
SELECT t.name,
       COUNT(*) as Anzahl
  FROM fahrzeug f,
       typ t
 WHERE f.id NOT IN (SELECT b.fahrzeug_id FROM besitzer b WHERE b.to IS NULL)
   AND f.id NOT IN (SELECT v.fahrzeug_id FROM verkauf v)
   AND f.typ_id = t.id
 GROUP BY t.name;

# Wie viele Fahrzeuge gibt es eines bestimmten Typs und Marke?
SELECT m.name,
       t.name,
       COUNT(*) as Anzahl
  FROM fahrzeug f,
       marke m,
       typ t
 WHERE f.marke_id = m.id
   AND f.typ_id = t.id
 GROUP BY m.name,
          t.name;