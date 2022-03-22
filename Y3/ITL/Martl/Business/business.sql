/*
	Tim Hofmann
    2. SQL Übung
    Business
*/

use business;
show tables;
select * from article;
select * from article_producer;
select * from producer;

-- a)
select * from article;

-- b)
/*
	Tim Hofmann
    2. SQL Übung
    Business
*/

use business;
show tables;
select * from article;
select * from article_producer;
select * from producer;

-- a)
select * from article;

-- b)
DESCRIBE producer;

-- c)
show create table article_producer;

-- d)
select * from producer order by 2;

-- e.1)
SHOW VARIABLES LIKE "%version%";

-- c)
show create table article_producer;

-- d)
select * from producer order by 2;

-- e.1)
select a.art_name as "Article", p.pro_name as "Producer"
	from article a
    inner join article_producer ap using(art_id)
    inner join producer p using(pro_id)
    order by p.pro_name desc, a.art_name asc;

-- e.2)
select a.art_name as "Article", p.pro_name as "Producer"
	from article a
    natural join article_producer ap
    natural join producer p
    order by p.pro_name desc, a.art_name asc;

-- e.3)
select a.art_name as "Article", p.pro_name as "Producer"
	from article a, article_producer ap, producer p
	where a.art_id = ap.art_id
    AND p.pro_id = ap.pro_id
    order by p.pro_name desc, a.art_name asc;

-- f)
select p.pro_name as "Hersteller", a.art_name as "Artikel", a.art_price as "Preis"
	from article a, producer p, article_producer ap
    where a.art_id = ap.art_id
    AND p.pro_id = ap.pro_id
    order by 3, 1, 2;
    
-- g)
select p.pro_name as "Hersteller", a.art_name as "Artikel", a.art_price as "Preis"
	from article a, producer p, article_producer ap
    where a.art_id = ap.art_id
    AND p.pro_id = ap.pro_id
    order by 3, 1, 2
    limit 1 offset 3;
    
-- h)
select a.art_name as "Artikel", p.pro_name as "Herstellerbezeichnung"
	from article_producer ap
    join article a using (art_id)
    right join producer p using (pro_id)
    order by p.pro_name desc, a.art_name asc;
    
-- i)
select count(a.art_id), p.pro_name
	from article a, producer p, article_producer ap
    where ap.art_id = a.art_id
    and ap.pro_id = p.pro_id;
    
select a.art_name as "Article", p.pro_name as "Producer", count(a.art_id)
	from article a
    inner join article_producer ap using(art_id)
    inner join producer p using(pro_id)
    order by p.pro_name desc, a.art_name asc;
    
select * from article;