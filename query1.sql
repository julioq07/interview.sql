-- Database used: ./Data_set/data.db

/* 
Write the SQL queries necessary to generate a list of the five restaurants that have the
highest average number of visitors on holidays. The result table should also contain that
average per restaurant. 
*/


SELECT 
    l.id AS restaurant_id, 
    AVG(l.reserve_visitors) AS visitors_avg
    FROM (
        SELECT l.id, l.reserve_visitors, r.day_of_week
        FROM restaurants_visitors AS l
        LEFT JOIN date_info AS r 
        ON date(substr(l.visit_datetime,7,4)||'-'||substr(l.visit_datetime,4,2)||'-'||substr(l.visit_datetime,1,2)) = r.calendar_date
        ) AS l
    INNER JOIN (SELECT calendar_date FROM date_info WHERE holiday_flg = '1') AS r
    GROUP BY l.id
    ORDER BY visitors_avg DESC
    LIMIT 5;