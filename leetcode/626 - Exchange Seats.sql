Create table If Not Exists Seat (id int, student varchar(255));
Truncate table Seat;
insert into Seat (id, student) values ('1', 'Abbot');
insert into Seat (id, student) values ('2', 'Doris');
insert into Seat (id, student) values ('3', 'Emerson');
insert into Seat (id, student) values ('4', 'Green');
insert into Seat (id, student) values ('5', 'Jeames');


select
    case when id = (select max(id) from seat) and id % 2 <> 0
        then id
        when id % 2 = 0
        then id - 1
        else id + 1
    end as id,
    student
from seat
order by id