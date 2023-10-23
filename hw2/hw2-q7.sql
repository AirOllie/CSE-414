-- Result: 1 rows
SELECT SUM(f.capacity) AS capacity
	FROM FLIGHTS AS f, MONTHS AS m
	WHERE f.month_id = m.mid AND 
		((f.origin_city = 'Seattle WA' AND f.dest_city = 'San Francisco CA') OR 
		(f.dest_city = 'Seattle WA' AND f.origin_city = 'San Francisco CA')) AND 
		m.month = 'July' AND 
		f.day_of_month = 10;