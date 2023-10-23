-- Result: 3 rows
SELECT c.name AS carrier, MAX(f.price) AS max_price
	FROM FLIGHTS AS f, CARRIERS AS c
	WHERE f.carrier_id = c.cid AND 
	    ((f.origin_city = 'Seattle WA' AND f.dest_city = 'New York NY') OR 
		(f.dest_city = 'Seattle WA' AND f.origin_city = 'New York NY'))
	GROUP BY c.name;