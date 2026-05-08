-- Question 31
SELECT *
FROM Employee
ORDER BY salary DESC;

-- Question 32
SELECT *
FROM Employee
ORDER BY name ASC;

-- Question 33
SELECT *
FROM Employee
ORDER BY hire_date ASC;

-- Question 34
SELECT *
FROM Department
ORDER BY budget DESC;

-- Question 35
SELECT *
FROM Employee
ORDER BY department_id ASC, salary DESC;

-- Question 36
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- Question 37
SELECT e.*
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name = 'Finance';

-- Question 38
SELECT e.name AS employee_name, d.name AS department_name, e.salary
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- Question 39
SELECT e.name, d.name AS department_name, e.hire_date
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE YEAR(e.hire_date) > 2020;

-- Question 40
SELECT DISTINCT d.*
FROM Department d
JOIN Employee e
ON d.department_id = e.department_id;

-- Question 41
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

-- Question 42
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- Question 43
SELECT e.*
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.budget > 100000;

-- Question 44
SELECT *
FROM Employee
WHERE YEAR(hire_date) = (
    SELECT YEAR(hire_date)
    FROM Employee
    WHERE name = 'John Doe'
);

-- Question 45
SELECT e.*
FROM Employee e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employee e2
    WHERE e2.department_id = e.department_id
);
