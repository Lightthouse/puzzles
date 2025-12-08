CREATE TABLE course_completions (
    user_id INT,
    course_id INT,
    course_name VARCHAR(100),
    completion_date DATE,
    course_rating INT
);
Truncate table course_completions;
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('1', '101', 'Python Basics', '2024-01-05', '5');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('1', '102', 'SQL Fundamentals', '2024-02-10', '4');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('1', '103', 'JavaScript', '2024-03-15', '5');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('1', '104', 'React Basics', '2024-04-20', '4');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('1', '105', 'Node.js', '2024-05-25', '5');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('1', '106', 'Docker', '2024-06-30', '4');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('2', '101', 'Python Basics', '2024-01-08', '4');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('2', '104', 'React Basics', '2024-02-14', '5');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('2', '105', 'Node.js', '2024-03-20', '4');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('2', '106', 'Docker', '2024-04-25', '5');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('2', '107', 'AWS Fundamentals', '2024-05-30', '4');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('3', '101', 'Python Basics', '2024-01-10', '3');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('3', '102', 'SQL Fundamentals', '2024-02-12', '3');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('3', '103', 'JavaScript', '2024-03-18', '3');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('3', '104', 'React Basics', '2024-04-22', '2');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('3', '105', 'Node.js', '2024-05-28', '3');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('4', '101', 'Python Basics', '2024-01-12', '5');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('4', '108', 'Data Science', '2024-02-16', '5');
insert into course_completions (user_id, course_id, course_name, completion_date, course_rating) values ('4', '109', 'Machine Learning', '2024-03-22', '5');


with
    cool_users as (
        select
            user_id
        from course_completions
        group by
            user_id
        having avg(course_rating) >= 4
            and count(course_id) > 4
    ),
    course_rank as (
        select
            *,
            dense_rank() over(partition by user_id order by completion_date)
        from course_completions
        where user_id in (select * from cool_users)
        )


select
     cr1.course_name as first_course,
     cr2.course_name as second_course,
     count(*) as transition_count
from course_rank as cr1
join course_rank as cr2 on
    cr1.user_id = cr2.user_id
    and cr1.dense_rank + 1 = cr2.dense_rank
group by cr1.course_name, cr2.course_name
order by
    transition_count desc,
    LOWER(cr1.course_name),
    LOWER(cr2.course_name)



