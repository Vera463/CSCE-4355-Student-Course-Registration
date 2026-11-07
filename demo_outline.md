# Final demonstration outline

1. Introduce the project, team members, and PostgreSQL/pgAdmin environment.
2. Show the students, courses, and registrations tables and a few fictional records.
3. Explain primary keys, foreign keys, UNIQUE constraints, and CHECK constraints.
4. Switch to `registration_user`; demonstrate an allowed SELECT/INSERT and a blocked UPDATE or DELETE.
5. Show the same query's `EXPLAIN ANALYZE` output before and after adding the index. Explain the actual results.
6. Back up the database and restore it to a separate test database.
7. Run the verification script in the restored database and compare row counts.
8. Show the GitHub repository, README, SQL scripts, tests, and documentation.
9. Summarize limitations and possible future improvements.

Use only actual test results in the recording. Do not show passwords or private connection details.
