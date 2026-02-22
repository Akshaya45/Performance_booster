
CREATE VIEW vw_StudentPerformance AS
SELECT 
    s.student_id,
    s.name,
    d.department_name,
    s.batch,
    s.marks,
    s.attendance,
    c.course_name,
    c.fees
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
JOIN Courses c ON s.course_id = c.course_id;

SELECT * FROM vw_StudentPerformance;