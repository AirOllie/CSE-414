SELECT c.name AS carrier
    FROM CARRIERS AS c, 
        (SELECT DISTINCT f1.carrier_id
                FROM FLIGHTS AS f1
                WHERE f1.origin_city = 'Seattle WA' 
                    AND f1.dest_city = 'New York NY') AS f2
    WHERE c.cid =  f2.carrier_id
    ORDER BY carrier ASC;