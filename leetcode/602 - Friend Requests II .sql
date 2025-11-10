Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');


select
    case when rout is null then rin else rout end as id,
    COALESCE(cntout, 0) + COALESCE(cntin, 0) as num
from (
        select
            requester_id as rout,
            count(distinct accepter_id ) as cntout
        from requestaccepted
        group by requester_id
     ) as out

full join (
        select
            accepter_id as rin,
            count(distinct requester_id) as cntin
        from requestaccepted
        group by accepter_id
     ) as input on

    out.rout = input.rin
order by num desc
limit 1

