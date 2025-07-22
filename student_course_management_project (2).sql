
-- Create Database
CREATE DATABASE student_course_management;
GO
USE student_course_management;
GO

-- Create Students Table
CREATE TABLE students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    email NVARCHAR(100),
    dob DATE
);

-- Create Courses Table
CREATE TABLE courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_name NVARCHAR(100),
    credits INT
);

-- Create Enrollments Table
CREATE TABLE enrollments (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create Grades Table
CREATE TABLE grades (
    grade_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create Attendance Table
CREATE TABLE attendance (
    attendance_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    course_id INT,
    date DATE,
    status NVARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert Sample Data
INSERT INTO students (name, email, dob) VALUES
('Zara', 'zara@example.com', '2002-08-15'),
('John Doe', 'john@example.com', '2001-06-20');

INSERT INTO courses (course_name, credits) VALUES
('SQL Programming', 4),
('DBMS Concepts', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-07-01'),
(1, 2, '2025-07-02'),
(2, 1, '2025-07-01');

INSERT INTO grades (student_id, course_id, marks) VALUES
(1, 1, 85),
(1, 2, 75),
(2, 1, 90);

INSERT INTO attendance (student_id, course_id, date, status) VALUES
(1, 1, '2025-07-10', 'Present'),
(1, 1, '2025-07-11', 'Absent'),
(2, 1, '2025-07-10', 'Present');

-- Create Grade Report View
CREATE VIEW student_grade_report AS
SELECT 
    s.name AS student_name, 
    c.course_name, 
    g.marks
FROM grades g
JOIN students s ON g.student_id = s.student_id
JOIN courses c ON g.course_id = c.course_id;
