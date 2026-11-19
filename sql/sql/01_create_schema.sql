
-- CSCE 4355
-- Student Course Registration Database
-- File: 01_create_schema.sql

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL
        CHECK (credits BETWEEN 1 AND 6)
);

CREATE TABLE registrations (
    registration_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Enrolled',

    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),

    CONSTRAINT unique_student_course
        UNIQUE (student_id, course_id),

    CONSTRAINT valid_status
        CHECK (status IN ('Enrolled', 'Dropped', 'Completed'))
);
