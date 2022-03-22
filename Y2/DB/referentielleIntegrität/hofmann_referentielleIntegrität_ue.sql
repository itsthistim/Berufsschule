/*
	Tim Hofmann
    07.04.2021
    Aufgabe referentielle Integrität
*/

-- create database
create database if not exists film default character set utf8;
use film;

-- drop damit man beim ausführen der ganzen datei keine doppelten daten bekommt
drop table darsteller;
drop table filmtitel;

-- create table filmtitel
create table if not exists filmtitel(
	fil_id int primary key auto_increment,
    fil_titel1 varchar(45) not null,
    fil_titel2 varchar(45))
    engine innodb;
    
-- create table darsteller
create table if not exists  darsteller(
	dar_id int auto_increment,
    fil_id int,
    primary key(dar_id),
    foreign key(fil_id) references filmtitel(fil_id)
    on delete cascade
    on update cascade);
    
-- insert values filmtitel
insert into filmtitel values (null, "Sonnie's Edge", "Love, Death & Robots");
insert into filmtitel values (null, "Lucky 13", "Love, Death & Robots");

-- insert values darsteller
insert into darsteller values (null, 1);
insert into darsteller values (null, 2);

-- update filmtitel
update filmtitel set fil_id = 3 where fil_id = 2;

-- output
select * from filmtitel;
select * from darsteller;