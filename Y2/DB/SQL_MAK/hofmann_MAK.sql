show tables;
use hardware;
select * from artikelart;
select * from hersteller;
select * from artikelart_hersteller;
select * from zusatz;

select art_id, art_name, arhe_name, zus_name from artikelart
natural join hersteller
natural join artikelart_hersteller
natural join zusatz
order by art_id;

-- 1)
select concat_ws(' ', zus_name, arhe_name) as "Artikel" from zusatz
natural join artikelart_hersteller;

-- 2)
select her_name1, her_name2 from hersteller
	where her_name1 like '%.%' or her_name2 like '%.%';
    
-- 3)
-- a)
select concat_ws(' ', h.her_name1, h.her_name2) as "Hersteller", a.art_name as "Artikelart", concat_ws(' ', z.zus_name, ah.arhe_name) as "Zusatz+Artikel"
	from artikelart a, artikelart_hersteller ah, hersteller h, zusatz z
    where ah.art_id = a.art_id
    and ah.her_id = h.her_id
    and ah.zus_id = z.zus_id
    order by Hersteller;
    
-- b)
select concat_ws(' ', h.her_name1, h.her_name2) as "Hersteller", a.art_name as "Artikelart", concat_ws(' ', z.zus_name, ah.arhe_name) as "Zusatz+Artikel"
	from artikelart a
	inner join artikelart_hersteller ah on a.art_id = ah.art_id
    inner join hersteller h on ah.her_id = h.her_id
    inner join zusatz z on ah.zus_id = z.zus_id
    order by Hersteller;
    
-- 4) ?
-- a)

select concat_ws(' ', h.her_name1, h.her_name2) as "Hersteller", a.art_name as "Artikelart" from artikelart_hersteller
	natural join (artikelart a)
    natural join (hersteller h);
    
-- b)
select concat_ws(' ', h.her_name1, h.her_name2) as "Hersteller", a.art_name, count(ah.art_id) from artikelart a
	inner join artikelart_hersteller ah on a.art_id = ah.art_id
    inner join hersteller h on ah.her_id = h.her_id;
    
-- 5 nicht

-- 6)
show tables;
