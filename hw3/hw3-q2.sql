SELECT DISTINCT f1.origin_city AS city 
    FROM FLIGHTS AS f1
    WHERE f1.origin_city NOT IN (SELECT DISTINCT f2.origin_city
                                    FROM FLIGHTS AS f2
                                    WHERE f2.actual_time >= 240 
                                    AND f2.canceled = 0)
    ORDER BY city ASC;