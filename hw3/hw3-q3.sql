SELECT f1.origin_city AS origin_city, ISNULL(CAST((SELECT COUNT(*) FROM FLIGHTS AS f2
                                            WHERE f2.actual_time < 90
                                            AND f2.origin_city = f1.origin_city
                                            AND f2.canceled = 0) AS FLOAT) * 100 / 
                                            CAST((SELECT COUNT(*) FROM FLIGHTS AS f3
                                            WHERE f3.origin_city = f1.origin_city
                                            AND f3.canceled = 0) AS FLOAT), 0) AS percentage
    FROM FLIGHTS AS f1
    GROUP BY f1.origin_city
    ORDER BY percentage, origin_city ASC;