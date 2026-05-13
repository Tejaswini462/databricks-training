-- Question 11
SELECT customer_id,
       order_id,
       total_amount,
       total_amount - LAG(total_amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS amount_difference
FROM orders;

-- Question 12
SELECT order_id,
       order_date,
       total_amount,
       AVG(total_amount) OVER (
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_average
FROM orders;

-- Question 13
SELECT employee_id,
       employee_name,
       department,
       salary,
       NTILE(4) OVER (
           ORDER BY salary DESC
       ) AS salary_quartile
FROM employees;

-- Question 14
SELECT *
FROM (
    SELECT customer_id,
           order_id,
           order_date,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY order_date
           ) AS row_num
    FROM orders
) first_orders
WHERE row_num = 1;

-- Question 15
SELECT *
FROM (
    SELECT customer_id,
           order_id,
           order_date,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY order_date DESC
           ) AS row_num
    FROM orders
) latest_orders
WHERE row_num = 1;

-- Question 16
SELECT employee_id,
       employee_name,
       department,
       salary,
       AVG(salary) OVER (
           PARTITION BY department
       ) AS department_average_salary
FROM employees;

-- Question 17
SELECT *
FROM (
    SELECT employee_id,
           employee_name,
           department,
           salary,
           AVG(salary) OVER (
               PARTITION BY department
           ) AS department_average_salary
    FROM employees
) emp_data
WHERE salary > department_average_salary;

-- Question 18
SELECT employee_id,
       employee_name,
       department,
       salary,
       SUM(salary) OVER (
           PARTITION BY department
       ) AS department_payroll
FROM employees;

-- Question 19
SELECT employee_id,
       employee_name,
       department,
       salary,
       ROUND(
           salary * 100.0 /
           SUM(salary) OVER (PARTITION BY department),
           2
       ) AS salary_percentage
FROM employees;

-- Question 20
SELECT employee_id,
       employee_name,
       department,
       salary,
       COUNT(*) OVER () AS total_employees
FROM employees;
