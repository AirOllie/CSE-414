SELECT DISTINCT c.name AS carrier
    FROM CARRIERS AS c, FLIGHTS AS f
    WHERE c.cid = f.carrier_id 
        AND f.dest_city = 'New York NY' 
        AND f.origin_city = 'Seattle WA'
    ORDER BY carrier ASC;