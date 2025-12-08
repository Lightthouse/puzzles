CREATE TABLE if not exists UserActivity (
    user_id INT,
    activity_date DATE,
    activity_type VARCHAR(20),
    activity_duration INT
);
Truncate table UserActivity;
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('1', '2023-01-01', 'free_trial', '45');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('1', '2023-01-02', 'free_trial', '30');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('1', '2023-01-05', 'free_trial', '60');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('1', '2023-01-10', 'paid', '75');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('1', '2023-01-12', 'paid', '90');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('1', '2023-01-15', 'paid', '65');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('2', '2023-02-01', 'free_trial', '55');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('2', '2023-02-03', 'free_trial', '25');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('2', '2023-02-07', 'free_trial', '50');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('2', '2023-02-10', 'cancelled', '0');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('3', '2023-03-05', 'free_trial', '70');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('3', '2023-03-06', 'free_trial', '60');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('3', '2023-03-08', 'free_trial', '80');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('3', '2023-03-12', 'paid', '50');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('3', '2023-03-15', 'paid', '55');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('3', '2023-03-20', 'paid', '85');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('4', '2023-04-01', 'free_trial', '40');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('4', '2023-04-03', 'free_trial', '35');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('4', '2023-04-05', 'paid', '45');
insert into UserActivity (user_id, activity_date, activity_type, activity_duration) values ('4', '2023-04-07', 'cancelled', '0');


--
-- with
--     paid_user as (
--             select
--                 distinct user_id
--             from UserActivity
--             where activity_type = 'paid'
--         )
--
-- select
--     trial.user_id as user_id,
--     trial_avg_duration,
--     paid_avg_duration
-- from (
--         select
--             user_id,
--             round(avg(activity_duration), 2) as trial_avg_duration
--         from UserActivity
--         where user_id in (select * from paid_user)
--             and activity_type = 'free_trial'
--         group by
--             user_id
--         ) as trial
-- join (
--         select
--             user_id,
--             round(avg(activity_duration), 2) as paid_avg_duration
--         from UserActivity
--         where user_id in (select * from paid_user)
--             and activity_type = 'paid'
--         group by
--             user_id
--         ) as paid on
--     trial.user_id = paid.user_id
-- order by 1

-- из решений челов
SELECT *
FROM (
    SELECT
        user_id,
        ROUND(avg(activity_duration) FILTER (WHERE activity_type = 'free_trial'),2) as trial_avg_duration,
        ROUND(avg(activity_duration) FILTER (WHERE activity_type = 'paid'),2) as paid_avg_duration
    FROM UserActivity
    GROUP BY 1)
WHERE paid_avg_duration IS NOT NULL
ORDER BY 1