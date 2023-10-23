-- Result: 3 rows
SELECT DISTINCT flight_num AS flight_num
    FROM FLIGHTS AS f, CARRIERS as c, WEEKDAYS as w
    WHERE f.origin_city = "Seattle WA" AND 
            f.dest_city = "Boston MA"  AND
            c.name = "Alaska Airlines Inc." AND
            f.carrier_id = c.cid AND
            w.day_of_week = "Monday" AND
            f.day_of_week_id = w.did;