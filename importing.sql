-- SQLite3 Command Line
-- First, we have to create the data base and then run sqlite3:
-- $ sqlite3 db_name.db
-- In terminal we copy the following:
create table date_info(calendar_date,day_of_week,holiday_flg);
.separator ,
.import date_info.csv tmp
insert into date_info(calendar_date,day_of_week,holiday_flg) select * from tmp;
drop table tmp;
create table restaurants_visitors(id,visit_date,visit_datetime,reserve_datetime,reserve_visitors);
.separator ,
.import restaurants_visitors.csv tmp
insert into restaurants_visitors(id,visit_date,visit_datetime,reserve_datetime,reserve_visitors) select * from tmp;
drop table tmp;
create table store_info(store_id,genre_name,area_name,latitude,longitude);
.separator ,
.import store_info.csv tmp
insert into store_info(store_id,genre_name,area_name,latitude,longitude) select * from tmp;
drop table tmp;
.quit
