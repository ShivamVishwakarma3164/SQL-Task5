Create database school;

use school;


-- Table 1: Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Table 2: Enrollments (related to Students using student_id as foreign key)
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Students Table
INSERT INTO Students VALUES
(4, 'David'),
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

-- Enrollments Table (note: student_id 4 doesn't exist in Students table)
INSERT INTO Enrollments VALUES
(101, 1, 'Math'),
(102, 2, 'Science'),
(103, 4, 'English');


-- INNER JOIN: Returns only matching records from both tables
SELECT Students.name, Enrollments.course_name
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id;


-- LEFT JOIN: Returns all Students and their Enrollments if available
SELECT Students.name, Enrollments.course_name
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id;


-- 3. RIGHT JOIN: Returns all Enrollments and matched Students
SELECT Students.name, Enrollments.course_name
FROM Students
RIGHT JOIN Enrollments ON Students.student_id = Enrollments.student_id;

-- FULL OUTER JOIN (MySQL workaround using UNION of LEFT and RIGHT JOIN)
SELECT Students.name, Enrollments.course_name
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id

UNION

SELECT Students.name, Enrollments.course_name
FROM Students
RIGHT JOIN Enrollments ON Students.student_id = Enrollments.student_id;
