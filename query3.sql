-- Database used: ./Data_set/data.db

/* 
How was the percentage of growth of the amount of visitors week over week for the
last four weeks of the data? Use SQL too.
*/


SELECT 
    r.week_year,
    r.count*100/l.count-100 AS growth_rate
    FROM (
        SELECT
            ROW_NUMBER() OVER (ORDER BY week_year) AS index_,
            count
            FROM (
                SELECT
                strftime('%W', date(substr(l.visit_datetime,7,4)||'-'||substr(l.visit_datetime,4,2)||'-'||substr(l.visit_datetime,1,2))) AS week_year,
                COUNT(reserve_visitors) as count
                FROM restaurants_visitors AS l
                WHERE week_year IN ('18','19','20','21','22') 
                AND strftime('%Y', date(substr(l.visit_datetime,7,4)||'-'||substr(l.visit_datetime,4,2)||'-'||substr(l.visit_datetime,1,2))) = '2017'
                GROUP BY week_year)
    ) AS l
    JOIN (
        SELECT
            ROW_NUMBER() OVER (ORDER BY week_year) AS index_,
            week_year,
            count
            FROM (
                SELECT
                strftime('%W', date(substr(l.visit_datetime,7,4)||'-'||substr(l.visit_datetime,4,2)||'-'||substr(l.visit_datetime,1,2))) AS week_year,
                COUNT(reserve_visitors) as count
                FROM restaurants_visitors AS l
                WHERE week_year IN ('19','20','21','22') 
                AND strftime('%Y', date(substr(l.visit_datetime,7,4)||'-'||substr(l.visit_datetime,4,2)||'-'||substr(l.visit_datetime,1,2))) = '2017'
                GROUP BY week_year)
    ) AS r
    ON l.index_=r.index_
    ORDER BY r.week_year DESC;
    