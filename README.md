# PostgreSQL Student Course Registration Database

**Course:** CSCE 4355 – Database Administration  
**Team:** Veronica Tawfik and Jacob Lutt  
**DBMS:** PostgreSQL  
**Management tool:** pgAdmin 4

## Project overview
This project demonstrates a small student course-registration database and core database-administration tasks: relational design, role-based permissions, query-plan comparison with `EXPLAIN ANALYZE`, and backup/recovery verification.

All records in this project are fictional. Do not add real student information, passwords, or private connection details to this repository.

## Prerequisites
- PostgreSQL installed and running
- pgAdmin 4 (or `psql`)
- A PostgreSQL account with permission to create tables and roles for the security exercise

## Setup
1. Open pgAdmin 4 and connect to your PostgreSQL server.
2. Create a database named `course_registration_db`.
3. Select that database, open **Query Tool**, and run these scripts in order:
   - `sql/01_create_schema.sql`
   - `sql/02_sample_data.sql`
   - `sql/03_roles_permissions.sql`
   - `sql/04_index_performance.sql`
4. Run `sql/05_verification.sql` to check the tables and sample records.

Run the scripts as a database owner or administrator. The role script requires permission to create roles and grant privileges. See the comments in that file before running it.

## Project files
- `sql/01_create_schema.sql` — creates students, courses, and registrations.
- `sql/02_sample_data.sql` — inserts fictional sample records.
- `sql/03_roles_permissions.sql` — creates group roles and grants limited permissions.
- `sql/04_index_performance.sql` — compares query plans before and after an index.
- `sql/05_verification.sql` — provides checks for data and relationships.
- `tests/permission_test_guide.md` — step-by-step permission test instructions.
- `docs/` — store the proposal, final report, screenshots, and architecture diagram.
- `demo/` — store the demonstration outline and script.

## Security test note
The SQL creates `course_admin` and `registration_user` as **NOLOGIN group roles**. It does not create passwords or login accounts. For the demonstration, use `SET ROLE registration_user` from an authorized administrator session after the role has been granted to that session's login. Do not commit passwords to GitHub.

## Performance test note
PostgreSQL may choose a sequential scan for a small table even after an index is created. Record the actual `EXPLAIN ANALYZE` output and explain what happened; do not claim an improvement unless your measurements show one.

## Backup and restore
Use pgAdmin's Backup and Restore features, or PostgreSQL's `pg_dump` and `pg_restore` commands. Restore to a separate test database, not over the original project database. Follow the verification checklist in `sql/05_verification.sql` and record your actual results in the final report.

## Team contributions
- **Veronica Tawfik:** schema, sample data, roles/permissions, and related report/demo sections.
- **Jacob Lutt:** index performance, backup/restore testing, and related report/demo sections.
- Both team members review the report, validate the database, and contribute to the final demonstration.

## Evidence to add before submission
Add screenshots showing the created tables and records, successful allowed actions, denied unauthorized actions, before/after query plans, and a successful restore with verification. Caption and explain each screenshot in the final report.
