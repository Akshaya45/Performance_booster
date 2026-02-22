CREATE TABLE MarksAudit (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    old_marks INT,
    new_marks INT,
    changed_on DATETIME DEFAULT GETDATE()
);


create TRIGGER trg_MarksUpdate
ON Students
AFTER UPDATE
AS
BEGIN
    INSERT INTO MarksAudit (student_id, old_marks, new_marks)
    SELECT 
        d.student_id,
        d.marks,
        i.marks
    FROM deleted d
    JOIN inserted i 
        ON d.student_id = i.student_id
    WHERE d.marks <> i.marks;
END;

UPDATE Students
SET Marks = 90
WHERE StudentId = 5;

SELECT * FROM MarksAudit;

