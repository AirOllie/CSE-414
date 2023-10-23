SELECT DISTINCT f.dest_city AS city
	FROM FLIGHTS AS f
	WHERE f.dest_city NOT IN 
		(SELECT DISTINCT f1.dest_city AS city
				FROM FLIGHTS AS f1
				WHERE f1.origin_city = 'Seattle WA')
	AND f.dest_city NOT IN 
		(SELECT DISTINCT f3.dest_city AS city
				FROM FLIGHTS AS f2, FlIGHTS AS f3
				WHERE f2.origin_city = 'Seattle WA'
				AND f2.dest_city = f3.origin_city)
ORDER BY city ASC;