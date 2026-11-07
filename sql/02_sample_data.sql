-- CSCE 4355: fictional sample data
-- Run after 01_create_schema.sql.
-- These records are made up and are not real student information.

INSERT INTO students (first_name, last_name, email, major) VALUES
('Ava', 'Brooks', 'ava.brooks@example.edu', 'Computer Science'),
('Noah', 'Reed', 'noah.reed@example.edu', 'Information Technology'),
('Mia', 'Patel', 'mia.patel@example.edu', 'Computer Science'),
('Ethan', 'Cruz', 'ethan.cruz@example.edu', 'Cybersecurity'),
('Sofia', 'Nguyen', 'sofia.nguyen@example.edu', 'Information Technology'),
('Liam', 'Morgan', 'liam.morgan@example.edu', 'Computer Science'),
('Isabella', 'Price', 'isabella.price@example.edu', 'Data Science'),
('Lucas', 'Bennett', 'lucas.bennett@example.edu', 'Cybersecurity'),
('Amara', 'Johnson', 'amara.johnson@example.edu', 'Data Science'),
('Mason', 'Rivera', 'mason.rivera@example.edu', 'Computer Science');

INSERT INTO courses (course_code, course_name, credits) VALUES
('CSCE 1010', 'Introduction to Computing', 3),
('CSCE 2100', 'Computer Organization', 3),
('CSCE 3110', 'Data Structures', 3),
('CSCE 4355', 'Database Administration', 3),
('CSCE 3600', 'Systems Programming', 3),
('CSCE 4210', 'Database Systems', 3);

INSERT INTO registrations (student_id, course_id, semester, registration_date, status) VALUES
(1, 1, 'Fall 2026', '2026-08-20', 'Enrolled'),
(1, 3, 'Fall 2026', '2026-08-20', 'Enrolled'),
(2, 1, 'Fall 2026', '2026-08-21', 'Enrolled'),
(2, 4, 'Fall 2026', '2026-08-21', 'Enrolled'),
(3, 3, 'Fall 2026', '2026-08-21', 'Enrolled'),
(3, 4, 'Fall 2026', '2026-08-21', 'Enrolled'),
(4, 2, 'Fall 2026', '2026-08-22', 'Enrolled'),
(4, 5, 'Fall 2026', '2026-08-22', 'Enrolled'),
(5, 1, 'Fall 2026', '2026-08-22', 'Enrolled'),
(5, 6, 'Fall 2026', '2026-08-22', 'Enrolled'),
(6, 3, 'Fall 2026', '2026-08-23', 'Enrolled'),
(6, 4, 'Fall 2026', '2026-08-23', 'Enrolled'),
(7, 4, 'Fall 2026', '2026-08-23', 'Enrolled'),
(7, 6, 'Fall 2026', '2026-08-23', 'Enrolled'),
(8, 2, 'Fall 2026', '2026-08-24', 'Enrolled'),
(8, 5, 'Fall 2026', '2026-08-24', 'Enrolled'),
(9, 4, 'Fall 2026', '2026-08-24', 'Enrolled'),
(9, 6, 'Fall 2026', '2026-08-24', 'Enrolled'),
(10, 1, 'Fall 2026', '2026-08-25', 'Enrolled'),
(10, 3, 'Fall 2026', '2026-08-25', 'Enrolled');
