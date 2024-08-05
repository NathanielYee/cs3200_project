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
    speciality VARCHAR(75), # -- connects to a seperate table! 
    year INT,
    first_name VARCHAR(75),
    last_name VARCHAR(75),
    time TIME, -- changed this to the availability table! 
    days DATE,

    -- Create Keys
    PRIMARY KEY (student_id)
);

-- specialty table 
CREATE TABLE specialty(
    -- need to add in! 
);


-- All attributes related to TA's
CREATE TABLE TA(
    ta_id INT AUTO_INCREMENT,
    email VARCHAR(75),
    first_name VARCHAR(75),
    last_name VARCHAR(75),
    time TIME,
    days DATE,
    PRIMARY KEY (ta_id)
);


-- All attributes and entities for Professors
CREATE TABLE professors(
    faculty_id INT AUTO_INCREMENT,
    email VARCHAR(75),
    first_name VARCHAR(75),
    last_name VARCHAR(75),
    -- ASSIGN KEYS
    PRIMARY KEY (faculty_id)
);

-- Create other Entities
CREATE TABLE department(
    dept_id INT,
    deptName VARCHAR(75),
    PRIMARY KEY (dept_id)
);

CREATE TABLE class(
    CRN INT,
    time TIME,
    course_name VARCHAR(75),
    dept_name VARCHAR(75),
    PRIMARY KEY (CRN)
);

CREATE TABLE group(
    group_name VARCHAR(75),
    group_number INT,

    -- Create Keys
    PRIMARY KEY (group_number)
);

CREATE TABLE submission(
    group_id INT,
    submission_id INT,
    submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (submission_id)
);