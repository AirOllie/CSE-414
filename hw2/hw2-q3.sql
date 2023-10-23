-- Result: 1 rows
SELECT w.day_of_week AS day_of_week, AVG(arrival_delay) AS delay 
    FROM FLIGHTS as f, WEEKDAYS as w
    WHERE f.day_of_week_id = w.did
    GROUP BY f.day_of_week_id
    ORDER BY AVG(f.arrival_delay) DESC
    LIMIT 1;
