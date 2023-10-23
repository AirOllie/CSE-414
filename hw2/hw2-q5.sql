-- Result: 6 rows
SELECT c.name AS name, AVG(f.canceled)*100 AS percentage
    FROM FLIGHTS AS f, CARRIERS AS c
    WHERE f.origin_city = "Seattle WA" AND
        f.carrier_id = c.cid
        GROUP BY c.name
        HAVING AVG(f.canceled)*100 > 0.5
        ORDER BY AVG(f.canceled) ASC;