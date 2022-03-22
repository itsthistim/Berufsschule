/*
	T. Hofmann, 23.03.2021
    Joins
*/
use schule;

-- Inner Joins: Findet Datensätze, die eine Beziehung haben
select *
	from person
    inner join person_job
    on person.per_id = person_job.per_id;

select concat_ws(' ', per_vname, per_nname) as "Person", job_name as "Job"
	from person p
    inner join person_job pj
    on p.per_id = pj.per_id
    inner join job j
    on j.job_id = pj.job_id;
    
-- nur wenn FK und PK den gleichen namen haben:
select concat_ws(' ', per_vname, per_nname) as "Person", job_name as "Job"
	from person p
    inner join person_job pj using(per_id)
    inner join job j using(job_id);

select concat_ws(' ', per_vname, per_nname) as "Name", job_name as "Job"
	from person_job pj
    inner join (person p, job j) using(per_id, job_id);

-- 	Cross Join: Verbindet jeden Eintrag der ersten Tabelle mit der Zweiten.
select *
	from person, person_job;

-- Equi Join: Join mit Where
select *
	from person, person_job
    where person.per_id = person_job.per_id;

select concat_ws(' ', per_vname, per_nname) as "Name", job_name as "Job"
	from person p, person_job pj, job j
	where p.per_id = pj.per_id and j.job_id = pj.job_id;

-- Natural Join: vergleicht alle gleichnamigen attribute aller angegebenen tabellen
select per_nname as "Nachname", job_id as "Job ID"
	from person
    natural join person_job
    order by job_id asc;
    
-- shortest
select concat_ws(' ', per_vname, per_nname) as "Name", job_name as "Job"
	from person_job pj
    natural join (person p, job j);