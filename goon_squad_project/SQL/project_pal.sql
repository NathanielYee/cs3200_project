-- Creating The project_pal schema
CREATE DATABASE IF NOT EXISTS Project_pal;
USE Project_pal;

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

CREATE TABLE availability(
    time TIME,
    days DATE
)