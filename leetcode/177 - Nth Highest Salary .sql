Create table If Not Exists Employee (Id int, Salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');


CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    SELECT
      CASE
        WHEN N <= 0 THEN NULL
        ELSE (
          SELECT DISTINCT salary
          FROM Employee
          ORDER BY salary DESC
          LIMIT 1
          OFFSET N - 1
        )
      END
  );
END;
$$ LANGUAGE plpgsql;

SELECT * FROM NthHighestSalary(1);