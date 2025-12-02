Create table If Not Exists Department (id int, revenue int, month varchar(5));
insert into Department (id, revenue, month) values ('1', '8000', 'Jan');
insert into Department (id, revenue, month) values ('2', '9000', 'Jan');
insert into Department (id, revenue, month) values ('3', '10000', 'Feb');
insert into Department (id, revenue, month) values ('1', '7000', 'Feb');
insert into Department (id, revenue, month) values ('1', '6000', 'Mar');

-- ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].



select
    id,
    sum(case when month = 'Jan' then revenue end) as Jan_Revenue,
    sum(case when month = 'Feb' then revenue end) as Feb_Revenue,
    sum(case when month = 'Mar' then revenue end) as Mar_Revenue,
    sum(case when month = 'Apr' then revenue end) as Apr_Revenue,
    sum(case when month = 'May' then revenue end) as May_Revenue,
    sum(case when month = 'Jan' then revenue end) as Jun_Revenue,
    sum(case when month = 'Jul' then revenue end) as Jul_Revenue,
    sum(case when month = 'Aug' then revenue end) as Aug_Revenue,
    sum(case when month = 'Sep' then revenue end) as Sep_Revenue,
    sum(case when month = 'Oct' then revenue end) as Oct_Revenue,
    sum(case when month = 'Nov' then revenue end) as Nov_Revenue,
    sum(case when month = 'Dec' then revenue end) as Dec_Revenue
from Department
group by id;
