Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

-- получаем первый вход в систему - это наименьшая дата
-- дожйним строки с активностью на следующий день
-- там, где при дожйне получился null - человек не заходил на второй день после регистрации
-- делим количество получившихся пользователей на всех пользователей

with
    relog as (
        select
            count(a1.player_id)
        from Activity as a1
        right join (
                    select
                        player_id,
                        min(event_date) as event_date
                    from Activity
                    group by player_id
                    ) as a2 on
            a1.player_id = a2.player_id
            and a1.event_date = a2.event_date + 1
    )

select
    round(1.0 * (select * from relog) / count(distinct player_id), 2) as fraction
from Activity;
