-- Database used: ./Data_set/data.db

/* 
Use SQL to discover which day of the week there are usually more visitors on average in
restaurants.
*/


SELECT 
    restaurant_id, 
    day, 
    MAX(visitors_avg) 
    FROM (
        SELECT 
            l.id AS restaurant_id,
            r.day_of_week AS day,
            AVG(l.reserve_visitors) AS visitors_avg
            FROM restaurants_visitors AS l
            LEFT JOIN date_info AS r 
            ON date(substr(l.visit_datetime,7,4)||'-'||substr(l.visit_datetime,4,2)||'-'||substr(l.visit_datetime,1,2)) = r.calendar_date
            GROUP BY day, restaurant_id
        )
    GROUP BY restaurant_id;

