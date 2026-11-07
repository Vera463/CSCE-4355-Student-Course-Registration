-- CSCE 4355: role-based access control
-- IMPORTANT:
-- 1. Run as a PostgreSQL administrator/role manager.
-- 2. These are NOLOGIN group roles; no passwords are stored in this file.
-- 3. The GRANT ... TO CURRENT_USER line lets the account running this script
--    use SET ROLE for the classroom test. If your account cannot grant roles,
--    ask the database administrator/instructor to grant membership.

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'course_admin') THEN
        CREATE ROLE course_admin NOLOGIN;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'registration_user') THEN
        CREATE ROLE registration_user NOLOGIN;
    END IF;
END
$$;

-- Administrator group: full control of the project tables and identity sequences.
GRANT ALL PRIVILEGES ON TABLE students, courses, registrations TO course_admin;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO course_admin;

-- Registration user: can view students/courses and view/add registrations.
-- It cannot update or delete existing records.
GRANT SELECT ON TABLE students, courses TO registration_user;
GRANT SELECT, INSERT ON TABLE registrations TO registration_user;
GRANT USAGE, SELECT ON SEQUENCE registrations_registration_id_seq
    TO registration_user;

-- Allow the account executing this script to switch into these roles for testing.
-- This does not create a new login or set a password.
GRANT course_admin, registration_user TO CURRENT_USER;

-- Review granted privileges:
SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE table_schema = 'public'
  AND table_name IN ('students', 'courses', 'registrations')
  AND grantee IN ('course_admin', 'registration_user')
ORDER BY grantee, table_name, privilege_type;
