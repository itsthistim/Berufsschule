/*
	Tim Hofmann, 11.02.2022
	DB Lager
*/

use lager;

show tables;

select * from artikel;
select * from eigenschaft;
select * from verpackung;
select * from artikel_verpackung;
select * from artikel_eigenschaft;

use lager;

show tables;

select * from artikel;
select * from eigenschaft;
select * from verpackung;
select * from artikel_verpackung;
select * from artikel_eigenschaft;

-- a
select a.art_name as "Artikel", e.eig_name as "Eigenschaft", concat(av.arve_einheit, " ", v.ver_groesse) as "Verpackungseinheit"
	from artikel_verpackung av, artikel a, eigenschaft e, verpackung v
	where av.art_id = a.art_id
	and av.eig_id = e.eig_id	
	and av.ver_id = v.ver_id;

-- b
select a.art_name as "artikel", e.eig_name as "eigenschaft", concat(av.arve_einheit, " ", v.ver_groesse) as "verpackungseinheit"
	from artikel_eigenschaft ae
	left join artikel_verpackung av on (av.art_id = ae.art_id)
	and (av.eig_id = ae.eig_id)
	right join artikel a on (a.art_id = ae.art_id)
	left join eigenschaft e on (e.eig_id = ae.eig_id)
	left join verpackung v on (v.ver_id = av.ver_id);

-- c
select art_name as "Noch keiner Eigenschaft zugeordnet" from artikel_eigenschaft
		right join artikel using (art_id)
        where artikel_eigenschaft.eig_id is null;
    
-- d
select art_name as "Noch keiner Eigenschaft zugeordnet" from artikel
	where art_id not in (select art_id from artikel_eigenschaft);

-- e
select a.art_name, count(av.art_id) as "Anzahl Verpackungseinheiten" from artikel_verpackung av, artikel a
	where av.art_id= a.art_id
	group by av.art_id
    order by 2;

-- f
select a.art_name, count(av.art_id) as "Anzahl Verpackungseinheiten" from artikel_verpackung av, artikel a
	where av.art_id = a.art_id
	group by av.art_id
	having count(av.art_id) > 1
    order by 2;

-- g
select a.art_name from artikel_verpackung av
	right join artikel a on (a.art_id = av.art_id)
	where av.ver_id is null;

-- h
select * from artikel a
	where a.art_id not in (select av.art_id from artikel_verpackung av);