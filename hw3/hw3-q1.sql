SELECT DISTINCT f1.origin_city AS origin_city, f1.dest_city AS dest_city, f1.actual_time AS time
    FROM FLIGHTS AS f1, 
        (SELECT f.origin_city, MAX(actual_time) AS maximum 
                FROM FLIGHTS AS f GROUP BY f.origin_city) AS f2
    WHERE f1.origin_city = f2.origin_city AND f1.actual_time = f2.maximum
    ORDER BY origin_city, dest_city ASC;
