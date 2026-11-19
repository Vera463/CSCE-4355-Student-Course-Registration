# PostgreSQL Student Course Registration Database

**Course:** CSCE 4355 – Database Administration  
**Team Members:** Veronica Tawfik and Jacob Lutt  
**DBMS:** PostgreSQL  
**Management Tool:** pgAdmin 4

## 1. Project Overview

This project implements a Student Course Registration Database using PostgreSQL. It demonstrates relational database design and database administration concepts, including table creation, sample data generation, role-based access control, query optimization, and database backup and recovery.

All student and course records are fictional and are used for educational and testing purposes.

## 2. Project Objectives

- Design a relational database for student course registration.
- Implement primary keys, foreign keys, unique constraints, and check constraints.
- Populate the database with fictional sample data.
- Create administrator and limited-access database roles.
- Test authorized and unauthorized database operations.
- Evaluate query performance before and after indexing.
- Perform a database backup and restore it into a separate test database.

## 3. Technologies Used

- PostgreSQL
- pgAdmin 4
- SQL
- GitHub

## 4. Database Structure

The database is named `student_course_registration` and contains three main tables:

| Table | Description |
|---|---|
| Students | Stores fictional student information. |
| Courses | Stores course codes, names, and credit hours. |
| Registrations | Connects students to courses and stores registration dates and statuses. |

The Registrations table connects Students and Courses through foreign keys.

## 5. Sample Data

The database contains:

- 10,000 fictional students
- 100 fictional courses
- 100,000 registration records

## 6. Security Implementation

Two login roles were created:

- `course_admin`: Administrator role with privileges to manage project database objects and data.
- `registration_user`: Limited-access role that can view students and courses and view, insert, and update registrations.

Permission testing verified that the registration user could perform authorized operations but could not delete registrations or modify student and course records.

Passwords are configured locally and are not stored in this repository.

## 7. Performance Optimization

Query performance was evaluated using PostgreSQL `EXPLAIN (ANALYZE, BUFFERS)`.

An index was created on `registrations.registration_date`.

The recorded execution times were:

| Measurement | Before Index | After Index |
|---|---:|---:|
| Scan method | Sequential Scan | Bitmap Heap Scan |
| Execution time | 42.201 ms | 1.185 ms |
| Rows returned | 280 | 280 |

The observed execution time decreased by approximately 97.2% in this test.

## 8. Backup and Recovery

A custom-format PostgreSQL backup was created using pgAdmin 4. The backup was restored into a separate database named `student_course_restore_test`.

The restored database was verified using record counts and SQL join queries.

## 9. Repository Structure

- `sql/` — Database creation, sample data, security, performance, and verification scripts.
- `docs/` — Screenshots, architecture diagram, and final project report.
- `tests/` — Permission-testing instructions.
- `demo/` — Technical demonstration script and video link.
- `backup/` — Backup documentation.

## 10. Setup and Execution

### Prerequisites

- PostgreSQL installed and running.
- pgAdmin 4 or `psql`.
- An administrator account with permission to create tables and database roles.

### Setup Instructions

1. Open pgAdmin 4 and connect to your PostgreSQL server.
2. Create a database named `student_course_registration`.
3. Open Query Tool for that database.
4. Execute the SQL scripts in the following order:

   1. `sql/01_create_schema.sql`
   2. `sql/02_sample_data.sql`
   3. `sql/03_roles_permissions.sql`
   4. `sql/04_index_performance.sql`
   5. `sql/05_verification.sql`

5. Follow the permission testing instructions in `tests/permission_test_guide.md`.
6. Perform backup and restore testing using pgAdmin 4.

**Important:** The sample data script is intended to be executed once on an empty database. Review the comments in each script before execution. The role script requires suitable administrative privileges. Configure passwords locally; never commit passwords to GitHub.

## 11. Team Contributions

**Veronica Tawfik**
- Database schema and table implementation.
- Fictional sample data.
- Database roles and permissions.
- Related report and demonstration sections.

**Jacob Lutt**
- Indexing and performance evaluation.
- Database backup and restoration.
- Related report and demonstration sections.

**Both Members**
- Database testing and verification.
- Final report review.
- Technical demonstration.

## 12. Project Evidence

Screenshots documenting database creation, sample data, permissions, query performance, backup, restoration, and verification are available in `docs/screenshots/`.

## 13. Limitations and Future Work

This project is an educational database-administration implementation. It does not include a web application, a production student information system, cloud hosting, or database replication.

Future improvements could include additional database auditing, automated backup scheduling, and a user-facing registration application.

---
