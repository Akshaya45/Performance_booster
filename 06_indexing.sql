
--Index 1 – For Reports by Batch
CREATE NONCLUSTERED INDEX idx_students_batch
ON Students(batch);

-- This index helps queries filtering by batch
-- Example: AVG marks per batch

--Index 2 – For Marks-Based Queries
-- This index helps sp_GetTopStudentsByBatch
-- because it filters and sorts by marks
CREATE NONCLUSTERED INDEX idx_students_marks

ON Students(marks);


-- SQL Server will automatically use this index to improve performance.
SELECT *
FROM Students
WHERE batch = 2023
ORDER BY marks DESC;

