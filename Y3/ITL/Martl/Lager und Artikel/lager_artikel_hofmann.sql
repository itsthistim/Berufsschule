/*
	Tim Hofmann, 11.02.2022
	DB Lagerartikel
*/

use lager_artikel;

show tables;

select * from artikel;
select * from eigenschaft;
select * from verpackung;
select * from artikel_verpackung;
select * from artikel_eigenschaft;

-- a
select a.art_name as "Artikel", e.eig_name as "Eigenschaft", concat(av.arve_einheit, " ", v.ver_groesse) as "Verpackungseinheit"
  	from artikel_verpackung av, artikel_eigenschaft ae, artikel a, eigenschaft e, verpackung v
  	where av.arei_id = ae.arei_id
  	and ae.art_id = a.art_id
  	and ae.eig_id = e.eig_id
	and av.ver_id = v.ver_id;
    
-- b
select a.art_name as "Artikel", count(a.art_name) as "Anzahl Verpackungseinheiten"
	from artikel_verpackung av, artikel_eigenschaft ae, artikel a
	where av.arei_id = ae.arei_id
	and ae.art_id = a.art_id
	group by a.art_name
	having count(a.art_name) > 1
    order by 2;
        
-- c
select a.art_name as "Artikel", e.eig_name as "Eigenschaft", concat(av.arve_einheit, " ", v.ver_groesse) as "Verpackungseinheit"
	from artikel_eigenschaft ae
	left join artikel_verpackung av on (av.arei_id = ae.arei_id)
	left join eigenschaft e on (e.eig_id = ae.eig_id)
	left join verpackung v on (v.ver_id = av.ver_id)
	right join artikel a on (a.art_id = ae.art_id);
        
-- d
select concat(art_name, concat(' ', IFNULL(eig_name, ' '))) as "Artikel"
	from artikel_eigenschaft ae
	left join artikel_verpackung av on (av.arei_id = ae.arei_id)
	left join eigenschaft e on (e.eig_id = ae.eig_id)
	right join artikel a on (a.art_id = ae.art_id)
	where ae.arei_id is null or av.arve_id is null;
        
-- e
select concat(art_name, concat(' ', eig_name)) as "Artikel"
	from artikel_eigenschaft ae, artikel a, eigenschaft e
	where ae.art_id = a.art_id
	and ae.eig_id = e.eig_id
	and arei_id not in (select arei_id from artikel_verpackung);