-- Creating The project_pal schema
CREATE DATABASE IF NOT EXISTS Project_pal;
USE Project_pal;

-- All attributes and entities related to students
CREATE TABLE student(
    student_id INT AUTO_INCREMENT,
    major VARCHAR(75),
    name VARCHAR(75),
    on_campus BOOLEAN,
    email VARCHAR(75),
    speciality VARCHAR(75),
    year INT,

    -- Create Keys
    PRIMARY KEY (student_id)
              );

CREATE TABLE name(
    first_name VARCHAR(75),
    last_name VARCHAR(75)
);

CREATE TABLE availability(
    time TIME,
    days DATE
);

-- All attributes related to TA's

CREATE TABLE TA(
    ta_id INT AUTO_INCREMENT,
    email VARCHAR(75)

);

CREATE TABLE name(
    first_name VARCHAR(75),
    last_name VARCHAR(75)
);

CREATE TABLE availability(
    time TIME,
    days DATE
);

-- All attributes and entities for Professors

CREATE TABLE professors(
    faculty_id INT AUTO_INCREMENT,
    email VARCHAR(75)
);

CREATE TABLE department(
    deptName VARCHAR(75),
    dept_id INT
);

CREATE TABLE class(
    CRN INT,
    time TIME,
    course_name VARCHAR(75),
    dept_name VARCHAR(75)
)