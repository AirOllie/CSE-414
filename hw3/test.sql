SELECT COUNT(*) FROM FLIGHTS AS f2
        WHERE f2.actual_time < 90
        AND f2.canceled = 0
        GROUP BY f2.origin_city