SELECT f1.origin_city AS origin_city, ISNULL(CAST((SELECT COUNT(*) FROM FLIGHTS AS f2
                                            WHERE f2.actual_time < 180
                                            AND f2.origin_city = f1.origin_city
                                            AND f2.canceled = 0
                                            GROUP BY f2.origin_city) AS FLOAT) * 100 / COUNT(*), 0) AS percentage
    FROM FLIGHTS AS f1
    GROUP BY f1.origin_city
    ORDER BY percentage, origin_city ASC;