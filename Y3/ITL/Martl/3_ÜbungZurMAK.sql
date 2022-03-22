/*
	Tim Hofmann
    Nachholung von 3. Aufgabe Übung zur MAK
*/

use bs2_mak;

-- 2
select scja.scja_name as "Schuljahr", count(sch.sch_id) as "Anzahl der Schüler"
	from schuljahr scja, schueler sch, schuljahr_klasse sckl
    where sckl.scja_id = scja.scja_id
    and sckl.sckl_id = sch.sckl_id
    group by scja.scja_id;

-- 3
select kla_name
	from schuljahr_klasse sckl
	join schuljahr scja using (scja_id)
    right join klasse kla using (kla_id)
    where scja_id is null;

-- 4
select concat(per_vname, ' ', per_nname) as "Schueler der 4. Klasse", kla_name as "Klasse" from person per
	join schueler sch using (per_id)
    join schuljahr_klasse sckl using (sckl_id)
    join klasse kla using (kla_id)
    where kla_name like '4%';

-- 5
select concat(scja_name, ' ', kla_name) as "SJ/Klasse", count(per_id) as "Schueler"
	from schuljahr_klasse sckl
	join schuljahr scja using (scja_id)
	right join klasse kla using (kla_id)
	join schueler sch using (sckl_id)
	right join person per using (per_id)
    group by kla_name, scja_name;

-- 6
select concat(per_vname, ' ', per_nname) as "Schueler ohne Schuljahrzuordnung" 
	from schuljahr_klasse sckl
	join schuljahr scja using(scja_id)
    join schueler sch using (sckl_id)
    right join person per using (per_id)
    where scja_id is null;

-- 7
-- a
select kla_name as "Klasse", count(scja.scja_id) as "Anzahl Schuljahre"
	from schuljahr_klasse sckl, klasse kla, schuljahr scja
    where sckl.kla_id = kla.kla_id
    and sckl.scja_id = scja.scja_id
    group by kla_name
    order by 1;

-- b
select kla_name as "Klasse", count(scja.scja_id) as "Anzahl Schuljahre"
	from schuljahr_klasse sckl, klasse kla, schuljahr scja
    where sckl.kla_id = kla.kla_id
    and sckl.scja_id = scja.scja_id
    group by kla_name
    order by 1
    limit 1 offset 1;
    
-- c
select kla_name as "Klasse", count(scja.scja_id) as "Anzahl Schuljahre"
	from schuljahr_klasse sckl, klasse kla, schuljahr scja
    where sckl.kla_id = kla.kla_id
    and sckl.scja_id = scja.scja_id
    group by kla_name
    having count(scja.scja_id) > 1
    order by 1;

-- 8
select * from person
	where per_nname like '_er%'
    or per_vname like '_er%';

-- 9
select scja_name as "Schuljahr", kla_name as "Klasse", concat(per_nname, ' ', per_vname) as "Schueler"
	from schuljahr_klasse sckl, schuljahr scja, klasse kla, schueler sch, person per
    where sckl.scja_id = scja.scja_id
    and sckl.kla_id = kla.kla_id
    and sckl.sckl_id = sch.sckl_id
    and per.per_id = sch.per_id
    order by 1, 2, 3;

-- 10
show create table schueler;