-- Question 1
SELECT employee_id,
       employee_name,
       department,
       salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- Question 2
SELECT employee_id,
       employee_name,
       department,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Question 3
SELECT employee_id,
       employee_name,
       department,
       salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_salary_rank
FROM employees;

-- Question 4
SELECT *
FROM (
    SELECT employee_id,
           employee_name,
           department,
           salary,
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
    FROM employees
) ranked_employees
WHERE row_num <= 3;

-- Question 5
SELECT employee_id,
       employee_name,
       department,
       salary,
       RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS dept_rank
FROM employees;

-- Question 6
SELECT employee_id,
       employee_name,
       department,
       salary,
       MAX(salary) OVER (
           PARTITION BY department
       ) AS highest_department_salary
FROM employees;

-- Question 7
SELECT order_id,
       order_date,
       total_amount,
       SUM(total_amount) OVER (
           ORDER BY order_date
       ) AS running_total
FROM orders;

-- Question 8
SELECT employee_id,
       order_id,
       total_amount,
       SUM(total_amount) OVER (
           PARTITION BY employee_id
           ORDER BY order_date
       ) AS cumulative_sales
FROM orders;

-- Question 9
SELECT customer_id,
       order_id,
       total_amount,
       LAG(total_amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS previous_order_amount
FROM orders;

-- Question 10
SELECT customer_id,
       order_id,
       total_amount,
       LEAD(total_amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS next_order_amount
FROM orders;
