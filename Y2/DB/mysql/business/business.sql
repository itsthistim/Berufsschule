/*
	T. Hofmann, 23.03.2021
    Übung Business
*/

show databases;
use business;
show tables;

select * from producer;

select argr_name from articlegroup;

select pro_name as "Name", pro_id as "ID" from producer;

select art_name1 as "Artikelbezeichnung1", art_name2 as "Artikelbezeichnung2"
	from article
    where art_name1 like "%S%"
    or art_name1 like "%S%";
    
-- equi join
select pro_name as "Hersteller", argr_name as "Artikelgruppe", art_name1 as "Artikel"
		from article, articlegroup, producer
        where article.argr_id = articlegroup.argr_id
        and producer.pro_id = article.pro_id
        order by pro_name, articlegroup.argr_name, art_name1;

-- inner join
select pro_name as "Hersteller", argr_name as "Artikelgruppe", art_name1 as "Artikel"
	from producer
    inner join article
    on article.pro_id = producer.pro_id
    inner join articlegroup
    on articlegroup.argr_id = article.argr_id
    order by pro_name, articlegroup.argr_name, art_name1;
    
-- natural join
select pro_name as "Hersteller", argr_name as "Artikelgruppe", art_name1 as "Artikel"
	from articlegroup
    natural join (article, producer)
    order by pro_name, articlegroup.argr_name, art_name1;