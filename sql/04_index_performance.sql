-- CSCE 4355: query performance comparison
-- Run the first EXPLAIN ANALYZE before creating the index.
-- Highlight/run each section separately in pgAdmin Query Tool so the
-- before/after plans can be captured as separate screenshots.

-- A. BEFORE: remove the test index if it already exists.
DROP INDEX IF EXISTS idx_registrations_student_id;

-- B. BEFORE: examine the query plan and execution time.
EXPLAIN (ANALYZE, BUFFERS)
SELECT r.registration_id, r.student_id, r.course_id, r.semester, r.status
FROM registrations AS r
WHERE r.student_id = 4;

-- C. Create an index for searches by student_id.
CREATE INDEX idx_registrations_student_id
    ON registrations(student_id);

-- D. AFTER: run the exact same query and compare the plan.
EXPLAIN (ANALYZE, BUFFERS)
SELECT r.registration_id, r.student_id, r.course_id, r.semester, r.status
FROM registrations AS r
WHERE r.student_id = 4;

-- E. Optional: refresh planner statistics, then run the after-query again.
ANALYZE registrations;

EXPLAIN (ANALYZE, BUFFERS)
SELECT r.registration_id, r.student_id, r.course_id, r.semester, r.status
FROM registrations AS r
WHERE r.student_id = 4;

-- Record actual execution time, scan type, and buffer details in the report.
-- With a small table PostgreSQL may still choose a sequential scan. That is
-- a valid result; explain what the actual plans show instead of claiming
-- that the index made the query faster.
