-- ue_db.sql
/*
	T. Hofmann, 23.03.2021
*/
show databases;
use mysql;
show tables;

-- or 'desc person;' - Shows structur.
describe person;

-- select attributes
-- all
select * from person;
-- specific
select PER_NNAME from person;
select person.PER_NNAME as "Nachname" from person;
select p.per_nname from person p;

-- simple queries
-- WHERE
select * from person where per_id = 1 or per_id = 2;
-- LIKE
select * from person where per_nname not like 'm%'; -- % for all chars
-- Personen mit "a"
select * from person where per_vname like '%a%' or per_nname like '%a%';
-- limit
select * from person limit 1,2;

-- funcs
-- count
select count(*) as "Anzahl der Personen" from person;
-- concat (merge attributes to one)
select concat_ws(' ', per_id, per_vname, per_nname) as "Person" from person;
select concat(per_id, ' - ', per_vname, ' ', per_nname) as "Person" from person;

-- order by
select * from person order by per_id desc;
select per_id, per_vname, per_nname from person order by 3,2;
select per_vname, per_id, per_nname from person order by 1,3;