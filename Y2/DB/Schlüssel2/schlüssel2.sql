-- a) show all data
select * from job;
select * from roomkey;
select * from keytype;
select * from person;
select * from room;
select * from room_has_key;
select * from roomtype;

-- b) count all data
select sum(table_rows) as "Anzahl der Datensätze" from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'schlüssel2';

-- c) Keys of TeacherA
select count(*) as "Schlüssel von Lehrer A" from roomkey where personID = 1;

-- d) amount of X key
select count(*) as "Generalschlüssel" from roomkey where keyTypeID = 1;
select count(*) as "Hauptschlüssel" from roomkey where keyTypeID = 2;
select count(*) as "Laborschlüssel" from roomkey where keyTypeID = 3;
select count(*) as "Turnhallenschlüssel" from roomkey where keyTypeID = 4;
select count(*) as "Schwimmbadschlüssel" from roomkey where keyTypeID = 5;
select count(*) as "Konferenzzimmerschlüssel" from roomkey where keyTypeID = 6;
select count(*) as "Büroschlüssel" from roomkey where keyTypeID = 7;

-- e) all people that can access the labs (Hauptschlüssel und Laborschlüssel)
select person.personFirstname as "Name"
	from person
    inner join roomkey on person.personID = roomkey.personID
    where keyTypeID = 2 OR keytypeID = 3;
    
-- f) all people who have a general key (Hauptschlüssel)
select person.personFirstname as "Name" from person
	inner join roomkey on person.personID = roomkey.personID
    where keyTypeID = 1;
    
-- g) keys of teacherC
select keyName as "Schlüssel" from roomkey where personID = 3;