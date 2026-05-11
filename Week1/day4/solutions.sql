-- Question 46
SELECT *
FROM Employee
WHERE department_id IS NULL;

-- Question 47
SELECT d.*
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- Question 48
SELECT *
FROM Employee
WHERE salary = (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
);

-- Question 49
SELECT *
FROM Employee
WHERE salary BETWEEN 50000 AND 70000;

-- Question 50
SELECT *
FROM Employee
WHERE age NOT BETWEEN 25 AND 35;

-- Question 51
SELECT *
FROM Employee
WHERE name IN ('John Doe', 'Jane Smith');

-- Question 52
SELECT e.*
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name <> 'HR';

-- Question 53
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- Question 54
SELECT *
FROM Employee
WHERE salary > 60000
AND age < 40;

-- Question 55
SELECT *
FROM Employee
WHERE name LIKE '%a%'
AND name LIKE '%e%';

-- Question 56
SELECT e.name AS employee_name, p.project_name
FROM Employee e
JOIN Project p
ON e.project_id = p.project_id;

-- Question 57
SELECT project_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY project_id
HAVING COUNT(*) > 2;

-- Question 58
SELECT e.*
FROM Employee e
JOIN Project p
ON e.project_id = p.project_id
WHERE p.project_name = 'Website Redesign';

-- Question 59
SELECT p.project_name, COUNT(e.employee_id) AS employee_count
FROM Project p
JOIN Employee e
ON p.project_id = e.project_id
GROUP BY p.project_name;

-- Question 60
SELECT *
FROM Employee
WHERE project_id IS NULL;

-- Question 61
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- Question 62
SELECT d.name AS department_name, e.name AS employee_name
FROM Employee e
RIGHT JOIN Department d
ON e.department_id = d.department_id;

-- Question 63
SELECT *
FROM Employee
WHERE project_id IS NULL;

-- Question 64
SELECT d.*
FROM Department d
WHERE d.department_id NOT IN (
    SELECT department_id
    FROM Employee
    WHERE salary > 80000
);

-- Question 65
SELECT e.*
FROM Employee e
WHERE e.salary = (
    SELECT MIN(e2.salary)
    FROM Employee e2
    WHERE e2.department_id = e.department_id
);
