/*
	Tim Hofmann
    DB erstellen & referientelle Integrität
    07.04.2021
*/

drop database if exists schule;
create database schule default character set utf8;
use schule;

create table person(
	perID int primary key auto_increment,
    perNname varchar(50) not null)
    engine = INNODB;

create table beruf(
	berID int auto_increment,
    berName varchar(50) not null,
    primary key(berID))
    engine = INNODB;
    
create table person_beruf(
	perID int not null,
    berID int not null,
    foreign key(perID) references person(perID)
    on delete cascade
    on update cascade)
    engine = INNODB;
    
insert into person(perNname) values ("Huber");
insert into beruf(berName) values ("Lehrer");
insert into person_beruf values (1,1);
select * from person_beruf;

delete from beruf where berID = 1;
select * from person_beruf;