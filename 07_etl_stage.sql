--ETL Mini Demonstration

--Create staging table:

CREATE TABLE Staging_StudentMarks (
    student_id INT,
    name VARCHAR(100),
    marks VARCHAR(10)   -- raw data as string
);

INSERT INTO Staging_StudentMarks VALUES
(201, '  Neha  ', '85'),
(202, 'Rohit', NULL),
(203, 'Anjali ', ' 90 ');

SELECT * from Staging_StudentMarks;

INSERT INTO Students (student_id, name, department_id, batch, marks, attendance, course_id)
SELECT 
    student_id,
    LTRIM(RTRIM(name)) AS clean_name,
    1,                  -- default department
    2023,
    ISNULL(CAST(marks AS INT), 0),
    80,
    1
FROM Staging_StudentMarks;

SELECT * from Students;
