# CSCE 4355 — Final Technical Demonstration Script

## 1. Project Introduction
- Introduce the Student Course Registration Database.
- Introduce team members Veronica Tawfik and Jacob Lutt.
- Identify PostgreSQL and pgAdmin 4 as the database environment.
- Explain the project's purpose and objectives.

## 2. Database Tables and Sample Data
- Show the students, courses, and registrations tables.
- Display several fictional student, course, and registration records.
- Explain the relationships between the three tables.

## 3. Database Design and Constraints
- Explain primary keys and foreign keys.
- Demonstrate UNIQUE constraints.
- Explain CHECK constraints, including valid course credits and registration statuses.
- Show how these constraints protect data integrity.

## 4. Database Security and Permissions
- Switch to the `registration_user` role.
- Show `SELECT current_user;` to verify the active role.
- Demonstrate an allowed SELECT and INSERT.
- Demonstrate a blocked UPDATE or DELETE.
- Explain the difference between administrator and registration-user permissions.

## 5. Indexing and Performance
- Show the same query's EXPLAIN ANALYZE output before and after creating the index.
- Explain the change in execution plan.
- Present the actual measured execution times:
  - Before index: 42.201 ms.
  - After index: 1.185 ms.
  - Approximate improvement: 97.2%.
- Explain that results depend on the database environment and query conditions.

## 6. Backup and Recovery
- Demonstrate backing up the database.
- Restore the backup to a separate test database.
- Explain why restoring to a separate database helps verify recovery without affecting the original.

## 7. Verification and Testing
- Run the verification script in the restored database.
- Compare the restored row counts with the original:
  - Students: 10,000.
  - Courses: 100.
  - Registrations: 100,000.
- Show successful verification queries and any relevant results.

## 8. GitHub Repository
- Show the GitHub repository and README.
- Walk through the SQL scripts, tests, documentation, and screenshots.
- Explain how another user can set up and run the project.

## 9. Team Contributions
- Veronica Tawfik: database tables, sample data, roles and permissions, and related documentation.
- Jacob Lutt: indexing, performance testing, backup and recovery, and related documentation.
- Both members: testing, report preparation, and final demonstration.

## 10. Limitations and Future Improvements
- Explain that the project uses fictional sample data.
- Discuss the absence of a web interface and real student information system integration.
- Mention possible improvements such as a registration interface, additional auditing, and automated backups.

## 11. Conclusion
- Summarize the database design, security, performance, and recovery features.
- Explain what the team learned from implementing and testing the database.
