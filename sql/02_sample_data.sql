
-- CSCE 4355: Generate fictional sample data
-- Run after 01_create_schema.sql.
-- Generates 10,000 students, 100 courses, and 100,000 registrations.
-- Run only on an empty database after creating the schema.

-- Generate 10,000 fictional students.
INSERT INTO students (first_name, last_name, email, major)
SELECT
    'Student',
    'Number' || n,
    'student' || LPAD(n::TEXT, 5, '0') || '@example.edu',
    CASE (n % 4)
        WHEN 0 THEN 'Computer Science'
        WHEN 1 THEN 'Information Technology'
        WHEN 2 THEN 'Cybersecurity'
        ELSE 'Data Science'
    END
FROM generate_series(1, 10000) AS n;

-- Generate 100 courses.
INSERT INTO courses (course_code, course_name, credits)
SELECT
    'CSCE' || LPAD(n::TEXT, 4, '0'),
    'Sample Computer Science Course ' || n,
    1 + ((n - 1) % 6)
FROM generate_series(1, 100) AS n;

-- Generate 10 registrations for each student.
-- Total: 100,000 registrations.
INSERT INTO registrations
    (student_id, course_id, semester, registration_date, status)
SELECT
    s.student_id,
    ((s.student_id - 1) * 10 + c.course_number - 1) % 100 + 1,
    'Fall 2026',
    CURRENT_DATE - ((s.student_id + c.course_number) % 365),
    CASE
        WHEN c.course_number % 3 = 0 THEN 'Completed'
        WHEN c.course_number % 3 = 1 THEN 'Enrolled'
        ELSE 'Dropped'
    END
FROM students s
CROSS JOIN generate_series(1, 10) AS c(course_number);

-- Update PostgreSQL statistics for query planning.
ANALYZE students;
ANALYZE courses;
ANALYZE registrations;

-- Verify generated record counts.
SELECT
    (SELECT COUNT(*) FROM students) AS total_students,
    (SELECT COUNT(*) FROM courses) AS total_courses,
    (SELECT COUNT(*) FROM registrations) AS total_registrations;

