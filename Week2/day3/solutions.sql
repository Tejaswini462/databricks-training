-- Question 21
WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT *
FROM employee_sales;

-- Question 22
WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),
average_sales AS (
    SELECT AVG(total_sales) AS avg_sales
    FROM employee_sales
)
SELECT es.*
FROM employee_sales es,
     average_sales a
WHERE es.total_sales > a.avg_sales;

-- Question 23
WITH customer_spending AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
),
customer_ranking AS (
    SELECT customer_id,
           total_spending,
           RANK() OVER (
               ORDER BY total_spending DESC
           ) AS spending_rank
    FROM customer_spending
)
SELECT *
FROM customer_ranking;

-- Question 24
WITH RECURSIVE numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT *
FROM numbers;

-- Question 25
WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id,
           employee_name,
           department
    FROM employees
)
SELECT *
FROM employee_hierarchy;

-- Question 26
WITH average_order AS (
    SELECT AVG(total_amount) AS avg_amount
    FROM orders
)
SELECT *
FROM orders
WHERE total_amount > (
    SELECT avg_amount
    FROM average_order
);

-- Question 27
WITH customer_spending AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id,
       total_spending,
       RANK() OVER (
           ORDER BY total_spending DESC
       ) AS spending_rank
FROM customer_spending;

-- Question 28
SELECT *
FROM (
    SELECT employee_id,
           employee_name,
           department,
           salary,
           DENSE_RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
) ranked_salaries
WHERE salary_rank = 2;

-- Question 29
SELECT employee_id,
       employee_name,
       department,
       salary,
       MAX(salary) OVER (
           PARTITION BY department
       ) - salary AS salary_difference
FROM employees;

-- Question 30
WITH employee_sales AS (
    SELECT employee_id,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),
ranked_employees AS (
    SELECT employee_id,
           total_sales,
           RANK() OVER (
               ORDER BY total_sales DESC
           ) AS sales_rank
    FROM employee_sales
)
SELECT *
FROM ranked_employees
WHERE sales_rank = 1;
