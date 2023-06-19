/*
    Tim Hofmann
    30.05.2023
    Taxi
*/

### Test Queries

USE taxi;

SELECT * FROM car;
SELECT * FROM car_driver;
SELECT * FROM charging;
SELECT * FROM charging_station;
SELECT * FROM city;
SELECT * FROM driver;
SELECT * FROM address;
SELECT * FROM route;
SELECT * FROM street;

# get user that is assigned to car with license plate 'LL 337 PN'
SELECT *
  FROM driver
 WHERE id = (SELECT driver_id FROM car_driver WHERE car_id = (SELECT id FROM car WHERE license_plate = 'LL 337 PN'));

# get all routes that are driven by the car with license plate 'LL 337 PN'
SELECT CONCAT_WS(' ', d.firstname, d.lastname)                    AS "Driver",
       CONCAT_WS(' ', s.street_name, a.street_number, ci.name)    AS "Start Location",
       CONCAT_WS(' ', s2.street_name, a2.street_number, ci2.name) AS "Target Location",
       r.km                                                       AS "Kilometers",
       r.empty                                                    AS "Empty"
  FROM route r,
       car_driver cd,
       driver d,
       car c,
       address a,
       street s,
       city ci,
       address a2,
       street s2,
       city ci2
 WHERE r.car_driver_id = cd.id
   AND cd.driver_id = d.id
   AND cd.car_id = c.id
   AND r.start_location = a.id
   AND a.street_id = s.id
   AND a.city_id = ci.id
   AND r.target_location = a2.id
   AND a2.street_id = s2.id
   AND a2.city_id = ci2.id;

# stations with assigned cars
SELECT c.license_plate                                         AS "License Plate",
       cs.id                                                   AS "Station ID",
       CONCAT_WS(' ', s.street_name, a.street_number, ci.name) AS "Station Location"
  FROM charging_station cs,
       car c,
       address a,
       street s,
       city ci
 WHERE cs.location_id = a.id
   AND a.street_id = s.id
   AND a.city_id = ci.id
   AND c.charging_station_id = cs.id;

# monthly statistic for may 2023
# amount of hours charged
# amount of kilometers driven
# amount of money spent on charging
SELECT CONCAT_WS(' ', d.firstname, d.lastname) AS "Driver",
       SUM(r.km)                               AS "Kilometers Driven",
       ch.charge_duration                      AS "Total Time Charged",
       SUM(ch.charge_price)                    AS "Money Spent on Charging",
       cd.date                                 AS "Date"
  FROM driver d,
       car_driver cd,
       car c,
       charging ch,
       route r
 WHERE d.id = cd.driver_id
   AND cd.car_id = c.id
   AND c.id = ch.car_id
   AND cd.id = r.car_driver_id
   AND cd.date BETWEEN STR_TO_DATE('01,05,2023', '%d,%m,%Y') AND STR_TO_DATE('31,05,2023', '%d,%m,%Y')
 GROUP BY d.id;

# Amount of empty kilometers driven vs amount of kilometers driven
SELECT SUM(r.km)                                                AS "Kilometers Driven",
       IF(r.empty = 1, 'Without Passengers', 'With Passengers') AS "Empty"
  FROM route r
 GROUP BY r.empty;

SELECT * FROM route;

### Normal Forms

/*
    1NF is fulfilled because every attribute is atomic.
    For example firstname and lastname are not stored in one column.

    2NF is fulfilled because every non-key attribute is fully dependent on the primary key.
    For example the street name is dependent on the street id.

    3NF is fulfilled because there are no transitive dependencies.
    For example the city name is not dependent on the street name.
*/