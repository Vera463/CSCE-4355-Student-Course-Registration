# Backup and restore evidence checklist

Use pgAdmin 4 or PostgreSQL backup tools.

1. Confirm the original `course_registration_db` contains the expected tables and data.
2. Create a backup of `course_registration_db` using pgAdmin **Backup** (or `pg_dump`).
3. Create a separate empty database named `course_registration_restore_test`.
4. Restore the backup into `course_registration_restore_test` using pgAdmin **Restore** (or `pg_restore`, depending on the backup format).
5. Connect to the restored database and run `sql/05_verification.sql`.
6. Compare table names, row counts, sample records, and indexes with the original database.
7. Capture screenshots of the backup completion, restore completion, and verification output.
8. Record the actual date, backup format, restore result, row counts, and any errors in the final report.

Never restore over the original project database during the demonstration.
