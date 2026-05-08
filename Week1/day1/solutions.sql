-- Question 1 --
SELECT * FROM Employee;


-- Question 2 --
SELECT name, salary
FROM Employee;


-- Question 3 --
SELECT *
FROM Employee
WHERE age > 30;


-- Question 4 --
SELECT name
FROM Department;


-- Question 5 --
SELECT e.*
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name = 'IT';


-- Question 6 --
SELECT *
FROM Employee
WHERE name LIKE 'J%';


-- Question 7 --
SELECT *
FROM Employee
WHERE name LIKE '%e';


-- Question 8 --
SELECT *
FROM Employee
WHERE name LIKE '%a%';


-- Question 9 --
SELECT *
FROM Employee
WHERE LENGTH(name) = 9;


-- Question 10 --
SELECT *
FROM Employee
WHERE name LIKE '_o%';


-- Question 11 --
SELECT *
FROM Employee
WHERE YEAR(hire_date) = 2020;


-- Question 12 --
SELECT *
FROM Employee
WHERE MONTH(hire_date) = 1;


-- Question 13 --
SELECT *
FROM Employee
WHERE YEAR(hire_date) < 2019;


-- Question 14 --
SELECT *
FROM Employee
WHERE hire_date >= '2021-03-01';


-- Question 15 --
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
