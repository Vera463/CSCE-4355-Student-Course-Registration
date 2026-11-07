# Permission test guide

Run these tests in pgAdmin Query Tool while connected to `course_registration_db`.
The role script must have completed successfully first.

## Test 1 — Registration user can read courses
```sql
SET ROLE registration_user;
SELECT course_code, course_name FROM courses ORDER BY course_code;
```
Expected: succeeds.

## Test 2 — Registration user can add a registration
Use a student/course/semester combination that does not already exist:
```sql
INSERT INTO registrations (student_id, course_id, semester)
VALUES (10, 2, 'Spring 2027');
```
Expected: succeeds.

## Test 3 — Registration user cannot change student records
```sql
UPDATE students
SET major = 'Undeclared'
WHERE student_id = 1;
```
Expected: permission denied.

## Test 4 — Registration user cannot delete registrations
```sql
DELETE FROM registrations
WHERE student_id = 10 AND course_id = 2 AND semester = 'Spring 2027';
```
Expected: permission denied.

## Return to the original account
```sql
RESET ROLE;
```

## Evidence
Capture screenshots of:
- A successful SELECT or INSERT as `registration_user`.
- The permission-denied message for UPDATE or DELETE.
- The role privilege query from `03_roles_permissions.sql`.

Record the actual results. If a test behaves differently, do not edit the screenshot or report it as a pass; investigate the grants and role membership.
