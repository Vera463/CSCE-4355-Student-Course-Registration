-- CSCE 4355: database verification
-- Run in the original database and again after restoring its backup
-- to a separate test database.

-- 1. Confirm the three tables exist.
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
  AND table_name IN ('students', 'courses', 'registrations')
ORDER BY table_name;

-- 2. Check row counts.
SELECT 'students' AS table_name, COUNT(*) AS row_count FROM students
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'registrations', COUNT(*) FROM registrations;

-- 3. Inspect registration details.
SELECT r.registration_id,
       s.first_name,
       s.last_name,
       c.course_code,
       c.course_name,
       r.semester,
       r.status
FROM registrations AS r
JOIN students AS s ON s.student_id = r.student_id
JOIN courses AS c ON c.course_id = r.course_id
ORDER BY r.registration_id;

-- 4. Check for orphaned foreign-key references (both counts should be zero).
SELECT COUNT(*) AS registrations_without_student
FROM registrations r
LEFT JOIN students s ON s.student_id = r.student_id
WHERE s.student_id IS NULL;

SELECT COUNT(*) AS registrations_without_course
FROM registrations r
LEFT JOIN courses c ON c.course_id = r.course_id
WHERE c.course_id IS NULL;

-- 5. Confirm the performance index exists after running script 04.
SELECT indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public'
  AND tablename = 'registrations'
ORDER BY indexname;

-- For the restore test, compare the table counts and sample rows in the
-- restored test database with the original database. Record the actual
-- counts, restore date, and any errors in the final report.
