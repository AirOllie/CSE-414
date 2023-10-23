-- Result: 12 rows
SELECT DISTINCT c.name AS name
    from FLIGHTS as f, CARRIERS as c
    WHERE f.carrier_id = c.cid
    GROUP BY c.name, f.day_of_month, f.month_id
    HAVING COUNT(*) > 1000;