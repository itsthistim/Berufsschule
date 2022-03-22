/*
	Tim Hofmann
    Schlüssel2 - Verwaltungsbeispiel
    08.04.2021
*/

-- delete tables if exist to prevent duplicated data on multiple runs
drop table if exists room_has_key;
drop table if exists room;
drop table if exists roomtype;
drop table if exists `schlüssel2`.`key`;
drop table if exists roomkey;
drop table if exists keytype;
drop table if exists person;
drop table if exists job;

-- (re)create tables
-- roomtype
create table if not exists roomType(
  roomTypeID int not null auto_increment,
  roomTypeName varchar(45) not null,
  primary key (`roomTypeID`));

-- room
create table if not exists room(
  roomNr int not null auto_increment,
  roomName varchar(45) not null,
  roomTypeID int not null,
  primary key (roomNr),
  foreign key (roomTypeID) references roomType(roomTypeID));

-- keyType
create table if not exists keyType(
  keyTypeID int not null auto_increment,
  keyTypeName varchar(45) not null,
  primary key (keyTypeID));

-- job
create table if not exists job(
  jobID int not null auto_increment,
  jobName varchar(45) not null,
  primary key (jobID));

-- person
create table if not exists person(
  personID int not null auto_increment,
  personFirstname varchar(45) not null,
  personLastname varchar(45) not null,
  jobID int not null,
  primary key (personID),
  foreign key (jobID) references job(jobID));

-- roomkey
create table if not exists roomkey(
  keyID int not null auto_increment,
  keyName varchar(45) not null,
  keyTypeID int not null,
  personId int null,
  primary key (keyID),
  foreign key (keyTypeID) references keyType(keyTypeID),
  foreign key (personID) references person(personID));

-- room_has_key
create table if not exists room_has_key(
  keyId int not null,
  roomNr int not null,
  primary key(keyID, roomNr),
  foreign key(roomNr) references room(roomNr),
  foreign key(keyID) references roomkey(keyID));

-- start autoincrement from 1
alter table person auto_increment = 1;
alter table roomkey auto_increment = 1;
alter table room auto_increment = 1;

-- a)
-- Raumarten einfügen
insert into roomType values (null, 'Labor');
insert into roomType values (null, 'Turnhalle');
insert into roomType values (null, 'Schwimmbad');
insert into roomType values (null, 'Konferenzzimmer');
insert into roomType values (null, 'Büro');
insert into roomtype values (null, "Internat");

-- Räume einfügen
insert into room values(null, "AE04", 1);
insert into room values(null, "AE05", 1);
insert into room values(null, "AE06", 1);
insert into room values(null, "AE07", 1);
insert into room values(null, "NE01", 1);
insert into room values(null, "NE02", 1);
insert into room values(null, "NE03", 1);
insert into room values(null, "NE04", 1);
insert into room values(null, "Turnhalle", 2);
insert into room values(null, "Schwimmbad", 3);
insert into room values(null, "Internat", 6);

-- Schlüsselarten einfügen
insert into keyType values (null, 'Generalschlüssel');
insert into keyType values (null, 'Hauptschlüssel');
insert into keyType values (null, 'Laborschlüssel');
insert into keyType values (null, 'Turnhallenschlüssel');
insert into keyType values (null, 'Schwimmbadschlüssel');
insert into keyType values (null, 'Konferenzzimmerschlüssel');
insert into keyType values (null, 'Büroschlüssel');
insert into keyType values (null, 'Internatschlüssel');

-- Schlüssel einfügen
insert into roomkey values(null, "AE04 - Schlüssel", 3, null);
insert into roomkey values(null, "AE05 - Schlüssel", 3, null);
insert into roomkey values(null, "AE06 - Schlüssel", 3, null);
insert into roomkey values(null, "AE07 - Schlüssel", 3, null);
insert into roomkey values(null, "NE01 - Schlüssel", 3, null);
insert into roomkey values(null, "NE02 - Schlüssel", 3, null);
insert into roomkey values(null, "NE03 - Schlüssel", 3, null);
insert into roomkey values(null, "NE04 - Schlüssel", 3, null);
insert into roomkey values(null, "Turnhalle - Schlüssel", 4, null);
insert into roomkey values(null, "Schwimmbad - Schlüssel", 5, null);
insert into roomkey values(null, "Internat - Schlüssel", 8, null);
insert into roomkey values(null, "Generalschlüssel", 1, null);
insert into roomkey values(null, "Hauptschlüssel", 2, null);

-- Schlüssel den Räumen hinzufügen
insert into room_has_key values(1, 1);
insert into room_has_key values(2, 2);
insert into room_has_key values(3, 3);
insert into room_has_key values(4, 4);
insert into room_has_key values(5, 5);
insert into room_has_key values(6, 6);
insert into room_has_key values(7, 7);
insert into room_has_key values(8, 8);
insert into room_has_key values(9, 9);
insert into room_has_key values(10, 10);
insert into room_has_key values(11, 11);

insert into room_has_key values(12, 1);
insert into room_has_key values(12, 2);
insert into room_has_key values(12, 3);
insert into room_has_key values(12, 4);
insert into room_has_key values(12, 5);
insert into room_has_key values(12, 6);
insert into room_has_key values(12, 7);
insert into room_has_key values(12, 8);
insert into room_has_key values(12, 9);
insert into room_has_key values(12, 10);
insert into room_has_key values(12, 11);

insert into room_has_key values(13, 1);
insert into room_has_key values(13, 2);
insert into room_has_key values(13, 3);
insert into room_has_key values(13, 4);
insert into room_has_key values(13, 5);
insert into room_has_key values(13, 6);
insert into room_has_key values(13, 7);
insert into room_has_key values(13, 8);

-- Jobs einfügen
insert into job values (null, "Lehrer");
insert into job values (null, "Schulwart");
insert into job values (null, "Reinigungspersonal");
insert into job values (null, "Direktor");
insert into job values (null, "Sekretär");

-- Personen einfügen
insert into person values(null, "Anton", "Weißalles", 5);
insert into person values(null, "Erna", "Weißalles", 1);
insert into person values(null, "Klara", "Kannalles", 1);
insert into person values(null, "Emil", "Siehtklar", 1);
insert into person values(null, "Werner", "Pauser", 1);
insert into person values(null, "Hanna", "Machtviel", 3);
insert into person values(null, "Martha", "Tutalles", 2);

-- Schlüssel zuordnen
-- Die Schlüssel zu den Räumen gibt es je nur einmal in meinem Schema! Deswegen wird jeder Schlüssel der bei mehreren Personen vorkommt and die Nächste weitergegeben.
update roomkey set personID = 1 where keyID = 3 OR keyID = 4 OR keyID = 2 OR keyID = 5;
update roomkey set personID = 2 where keyID = 3 OR keyID = 13 OR keyID = 10;
update roomkey set personID = 3 where keyID = 10 OR keyID = 13;
update roomkey set personID = 4 where keyID = 12;

-- Teil 2
-- a) Alle Personen deren deren  Nachname  an  dritter  Stelle  ein  i  oder e enthält.
select concat_ws(' ', personFirstname, personLastname) from person where personLastname LIKE "__e%" OR personLastname LIKE "__i%";

-- b) Alle Lehrerschlüssel sortiert nach keyName
select keyName as "Lehrerschlüssel" from roomkey
	natural join(person)
    where person.jobID = 1
    order by keyName;
    
-- c) Anzahl der Schlüssel per Lehrer
select count(*) from roomkey
	natural join (person)
    where personID = 2;
select count(*) from roomkey
	natural join (person)
    where personID = 3;
select count(*) from roomkey
	natural join (person)
    where personID = 4;
select count(*) from roomkey
	natural join (person)
    where personID = 5;
    
    select * from keyType;
    
-- d) Anzahl der Personen per keyType
select keyTypeId, count(personID) "Personen" from roomkey
	where keyTypeId = 1;
select keyTypeId, count(personID) from roomkey
	where keyTypeId = 2;
select keyTypeId, count(personID) from roomkey
	where keyTypeId = 3;
select keyTypeId, count(personID) from roomkey
	where keyTypeId = 4;
select keyTypeId, count(personID) from roomkey
	where keyTypeId = 5;
select keyTypeId, count(personID) from roomkey
	where keyTypeId = 6;
select keyTypeId, count(personID) from roomkey
	where keyTypeId = 7;
select keyTypeId, count(personID) from roomkey
	where keyTypeId = 8;
    
-- e) Alle Lehrer sortiert nach Nachname und Vorname
select personID, concat_ws(' ', personLastname, personFirstname) from person
	order by personLastname, personFirstname;
    
-- f) keyTypes die nur einmal vergeben wurden.
select keyName as "Schlüsselname", room.roomName as "Raumname",  room.roomNr as "Raumnummer" from roomkey
natural join(room_has_key)
natural join(room)
group by keyTypeID having count(keyTypeID) = 1;
