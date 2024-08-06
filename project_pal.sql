-- Create The project_pal schema
CREATE DATABASE IF NOT EXISTS Project_pal;
USE Project_pal;

-- Department Table
CREATE TABLE Department (
    dept_id INT AUTO_INCREMENT,
    deptName VARCHAR(75) NOT NULL,
    PRIMARY KEY (dept_id)
);

-- Professor Table
CREATE TABLE Professor (
    professor_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    dept_id INT,
    office_location VARCHAR(100),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    PRIMARY KEY (professor_id)
);

-- Project Table
CREATE TABLE Project (
    project_id INT AUTO_INCREMENT,
    instructions TEXT,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id),
    PRIMARY KEY (project_id)
);

-- Group Table
CREATE TABLE `Group` (
    group_id INT AUTO_INCREMENT,
    group_name VARCHAR(100) NOT NULL,
    submission_id INT,
    ta_id INT, -- Assuming each group can have one TA
    FOREIGN KEY (submission_id) REFERENCES Submission(submission_id),
    FOREIGN KEY (ta_id) REFERENCES TA(ta_id),
    PRIMARY KEY (group_id)
);

-- Student Table
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(75) NOT NULL,
    last_name VARCHAR(75) NOT NULL,
    email VARCHAR(75) NOT NULL UNIQUE,
    major VARCHAR(75),
    year INT,
    on_campus BOOLEAN,
    group_id INT, -- Assuming each student can only be in one group
    FOREIGN KEY (group_id) REFERENCES `Group`(group_id),
    PRIMARY KEY (student_id)
);

-- Student Speciality Table
CREATE TABLE StudentSpeciality (
    student_id INT,
    speciality_description VARCHAR(255),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- TA Table
CREATE TABLE TA (
    ta_id INT AUTO_INCREMENT,
    first_name VARCHAR(75) NOT NULL,
    last_name VARCHAR(75) NOT NULL,
    email VARCHAR(75),
    group_id INT, -- Assuming each TA belongs to one group
    FOREIGN KEY (group_id) REFERENCES `Group`(group_id),
    PRIMARY KEY (ta_id)
);

-- TA Speciality Table
CREATE TABLE TASpeciality (
    ta_id INT,
    speciality_description VARCHAR(255),
    FOREIGN KEY (ta_id) REFERENCES TA(ta_id)
);

-- Submission Table
CREATE TABLE Submission (
    submission_id INT AUTO_INCREMENT,
    group_id INT,
    submitted_at DATETIME,
    submission_link VARCHAR(100),
    FOREIGN KEY (group_id) REFERENCES `Group`(group_id),
    PRIMARY KEY (submission_id)
);

-- Availability Table
CREATE TABLE Availability (
    availability_id INT AUTO_INCREMENT,
    student_id INT,
    ta_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (ta_id) REFERENCES TA(ta_id),
    PRIMARY KEY (availability_id)
);

-- Days Table (Part of Availability Composite Attribute)
CREATE TABLE Days (
    day_id INT AUTO_INCREMENT,
    day ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday',
        'Saturday', 'Sunday') NOT NULL,
    availability_id INT,
    FOREIGN KEY (availability_id) REFERENCES 
Availability(availability_id),
    PRIMARY KEY (day_id)
);

-- Time Table (Part of Availability Composite Attribute)
CREATE TABLE Time (
    time_id INT AUTO_INCREMENT,
    time TIME,
    availability_id INT,
    FOREIGN KEY (availability_id) REFERENCES 
Availability(availability_id),
    PRIMARY KEY (time_id)
);

-- Location Table (Part of Availability Composite Attribute)
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT,
    location VARCHAR(255) NOT NULL,
    availability_id INT,
    FOREIGN KEY (availability_id) REFERENCES 
Availability(availability_id),
    PRIMARY KEY (location_id)
);

