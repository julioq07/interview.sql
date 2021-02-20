# Interview exercises in SQL

## About the data
The data used is obtained from 3 csv files.
In the following, a description of the data is presented.

### restaurants_visitors.csv

* id: Unique id string  per restaurant.
* reserve_visitors: Visitors amount of the restaurant on the row.
* visit_datetime: Datetime value the visit occurred.
* visit_date: Date extracted from *visit_datetime* column.
* reserve_datetime: Hour extracted from *visit_datetime* column.

### date_info.csv

* calendar_date: Calendar date info.
* day_of_week: Day of the week that corresponds to the *calendar_date* column.
* holiday_flg: 1 if the calendar day is a holiday in Japan and 0 else.

### store_info.csv

* store_id: Same value that *id* column from *restaurants_visitors*.
* genre_name: Cooking genre of the restaurant.
* area_name: Geographic location of the restaurant.
* latitude: Latitude coordinate of the location.
* longitude: Longitude coordinate of the location.

## Problems

1. Write the SQL queries necessary to generate a list of the five restaurants that have the
highest average number of visitors on holidays. The result table should also contain that
average per restaurant.

2. Use SQL to discover which day of the week there are usually more visitors on average in
restaurants.

3. How was the percentage of growth of the amount of visitors week over week for the
last four weeks of the data? Use SQL too.

4. Obtain the top 3 restaurants on visits for each day of the week.