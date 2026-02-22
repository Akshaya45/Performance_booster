CREATE PROCEDURE sp_GetTopStudentsByBatch
    @BatchId INT,
    @MinMarks INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        student_id,
        name,
        batch,
        marks
    FROM Students
    WHERE batch = @BatchId
      AND marks >= @MinMarks
    ORDER BY marks DESC;
END;


EXEC sp_GetTopStudentsByBatch 2023, 75;