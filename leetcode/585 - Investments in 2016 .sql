Create Table If Not Exists Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float);
Truncate table Insurance;
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20');
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40');


with
    un_tv as (
        select
            tiv_2015
        from Insurance
        group by tiv_2015
        having count(tiv_2015) > 1
    ),
    mult_tv as (
        select
            lat,
            lon,
            count(tiv_2015)
        from Insurance
        group by lat, lon
        having count(tiv_2015) = 1
    )

select
    round(1.0 * sum(tiv_2016)::numeric, 2) as tiv_2016
from insurance
where tiv_2015 in (select * from un_tv)
    and (lon,lat) in (select lon,lat from mult_tv)
