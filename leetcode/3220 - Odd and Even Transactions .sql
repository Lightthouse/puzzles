Create table if not exists transactions ( transaction_id int, amount int, transaction_date date);
Truncate table transactions;
insert into transactions (transaction_id, amount, transaction_date) values ('1', '150', '2024-07-01');
insert into transactions (transaction_id, amount, transaction_date) values ('2', '200', '2024-07-01');
insert into transactions (transaction_id, amount, transaction_date) values ('3', '75', '2024-07-01');
insert into transactions (transaction_id, amount, transaction_date) values ('4', '300', '2024-07-02');
insert into transactions (transaction_id, amount, transaction_date) values ('5', '50', '2024-07-02');
insert into transactions (transaction_id, amount, transaction_date) values ('6', '120', '2024-07-03');



select
    transaction_date,
    sum(case when amount % 2 > 0 then amount else 0 end) as odd_sum,
    sum(case when amount % 2 = 0 then amount else 0 end) as even_sum
from transactions
group by
    transaction_date
order by transaction_date