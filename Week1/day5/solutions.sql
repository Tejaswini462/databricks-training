-- Question 1
SELECT s.student_name, c.course_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id;

-- Question 2
SELECT c.course_name
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.student_id IS NULL;

-- Question 3
SELECT i.instructor_name, c.course_name
FROM instructors i
LEFT JOIN courses c
ON i.instructor_id = c.instructor_id;

-- Question 4
SELECT *
FROM courses
WHERE instructor_id IS NULL;

-- Question 5
SELECT s.student_name, e.course_id
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;

-- Question 6
SELECT s.student_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.course_id IS NULL;

-- Question 7
SELECT s.student_name, e.course_id
FROM students s
FULL OUTER JOIN enrollments e
ON s.student_id = e.student_id;

-- Question 8
SELECT c.course_name
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

-- Question 9
SELECT i.instructor_name, c.course_name
FROM instructors i
FULL OUTER JOIN courses c
ON i.instructor_id = c.instructor_id;

-- Question 10
SELECT s.student_name,
       c.course_name,
       i.instructor_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id
LEFT JOIN instructors i
ON c.instructor_id = i.instructor_id;
