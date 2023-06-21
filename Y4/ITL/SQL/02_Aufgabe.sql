SELECT str_name Strasse, ort_name Ort, plz_nr PLZ FROM plz NATURAL JOIN ort_plz op NATURAL JOIN ort NATURAL JOIN strasse s NATURAL JOIN strasse_ort_plz sop;


select str_id, str_name as "Street" from strasse;

select * from adresse.person_strasse_ort_plz;


SELECT * FROM amazonplusplus.users;