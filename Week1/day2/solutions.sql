-- Question 16
SELECT SUM(salary) AS total_salary
FROM Employee;

-- Question 17
SELECT AVG(salary) AS average_salary
FROM Employee;

-- Question 18
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- Question 19
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

-- Question 20
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;

-- Question 21
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- Question 22
SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;

-- Question 23
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date);

-- Question 24
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- Question 25
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC
LIMIT 1;

-- Question 26
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Question 27
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Question 28
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- Question 29
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- Question 30
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;
