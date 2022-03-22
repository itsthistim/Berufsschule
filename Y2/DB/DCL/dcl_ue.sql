/*
	Tim Hofmann, 14.04.2021
    Übung zu Benutzerverwaltung und -rechte / Trigger
*/

-- neue DB anlegen
drop database if exists firma;
create database firma default character set utf8;
use firma;

create table person (
	per_id int primary key auto_increment,
    per_nname varchar(50) not null);
    
-- Benutzer anlegen und Rechte vergeben
drop user if exists maier@localhost;
create user maier@localhost identified by 'maier';
grant select, update, insert on firma.* to maier@localhost;
show grants for maier@localhost;

-- DB zum speichern der Trigger-Ergebnisse
drop database if exists sniff_trigger;
create database sniff_trigger;
use sniff_trigger;

create table after_insert_person(
	aip_id int primary key auto_increment,
    aip_username varchar(255) not null,
    aip_per_id int not null,
    aip_attime timestamp default current_timestamp);
    
create table after_update_person(
	aup_id int primary key auto_increment,
    aup_username varchar(255) not null,
    aup_per_id int not null,
    aup_per_nname_old varchar(50),
    aup_per_nname_new varchar(50),
    aup_attime timestamp default current_timestamp);
    
-- Trigger
use firma;
drop trigger if exists after_insert_person;
create trigger after_insert_person after insert on person
for each row
insert into sniff_trigger.after_insert_person (aip_username, aip_per_id)
	values (user(), new.per_id);

drop trigger if exists after_update_person;
create trigger after_update_person after update on person
for each row
insert into sniff_trigger.after_update_person values (default, user(), new.per_id, old.per_nname, new.per_nname, default);
show triggers;

-- Trigger testen
use firma;
insert into person (per_nname) values('Maier');
select * from sniff_trigger.after_insert_person;

update person set per_nname = "Mayr" where per_id = 1;
select * from sniff_trigger.after_update_person;

/*
	Aufgabe: Erstellen Sie einen after update Trigger.
    Den Benutzername, den alten und neune Nachnamen, usw in die Tabelle sniff_trigger.after_update_trigger speichern.
    Auf den alten Nachnamen kann man mit old.per_nname kommen.
    Auf den neuen nachnamen kann man mit new.per_nname kommen.
    Dann testen.
*/

