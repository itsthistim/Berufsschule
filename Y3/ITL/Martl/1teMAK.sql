/*
	Tim Hofmann
    1. MAK - 04.03.2022
*/

use adresse;

-- a)
select plz_nr as "PLZ", ort_name as "Ort", str_name as "Strasse"
	from plz, ort, strasse str, plz_strasse plst
    where plst.str_id = str.str_id
    and plst.plz_id = plz.plz_id
    and plz.ort_id = ort.ort_id
    order by 2, 1, 3;

-- b)
select ort_name
	from ort
    left join plz using (ort_id)
    where plz_id is null;

-- c)
select plz_nr
	from plz_strasse
    right join plz using (plz_id)
    where str_id is null;

-- d)
select ort_name as "Ort", count(str.str_id) as "Anzahl Strassen"
	from plz, ort, strasse str, plz_strasse plst
    where plst.str_id = str.str_id
    and plst.plz_id = plz.plz_id
    and plz.ort_id = ort.ort_id
    group by ort_name
    having count(str.str_id) > 1;

-- e)
select ort_name as "Ort", count(str.str_id) as "Anzahl Strassen"
	from plz, ort, strasse str, plz_strasse plst
    where plst.str_id = str.str_id
    and plst.plz_id = plz.plz_id
    and plz.ort_id = ort.ort_id
    group by ort_name;
    
-- f)
select str_name as "Strasse"
	from strasse
    where str_name like '%u%';
    
-- g)
select count(*) as "Anzahl"
	from plz_strasse;

-- h)
select count(*) as "Anzahl"
	from plz
    where ort_id is not null;
    
-- i)
select plz_nr as "PLZ", ort_name as "Ort", str_name as "Strasse"
	from plz
    left join plz_strasse using (plz_id)
    right join ort using (ort_id)
    left join strasse using (str_id);