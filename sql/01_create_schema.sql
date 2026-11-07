-- CSCE 4355: Student Course Registration Database
-- Run while connected to course_registration_db.
-- This script is safe to rerun: it drops and recreates the project tables.

DROP TABLE IF EXISTS registrations;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(120) NOT NULL UNIQUE,
    major       VARCHAR(80),
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    course_id    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code  VARCHAR(15) NOT NULL UNIQUE,
    course_name  VARCHAR(120) NOT NULL,
    credits      SMALLINT NOT NULL CHECK (credits BETWEEN 1 AND 6)
);

CREATE TABLE registrations (
    registration_id  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id       INTEGER NOT NULL REFERENCES students(student_id)
                     ON UPDATE CASCADE ON DELETE RESTRICT,
    course_id        INTEGER NOT NULL REFERENCES courses(course_id)
                     ON UPDATE CASCADE ON DELETE RESTRICT,
    semester         VARCHAR(20) NOT NULL,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status           VARCHAR(15) NOT NULL DEFAULT 'Enrolled'
                     CHECK (status IN ('Enrolled', 'Dropped', 'Completed')),
    CONSTRAINT uq_student_course_semester
        UNIQUE (student_id, course_id, semester)
);

-- Note: PostgreSQL automatically creates indexes for primary-key and UNIQUE
-- constraints. It does not automatically index the referencing foreign-key
-- columns. The separate performance exercise adds an index on registrations.
