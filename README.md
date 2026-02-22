# Performance_booster



# 📘 Performance Booster + Analytics Layer

## 📌 Project Overview

As student data grows, reporting queries on the Student Portal become slower.
This project improves query performance and introduces an analytics-ready layer using:

* Views for reusable reporting
* Stored procedures for parameterized queries
* Triggers for audit logging
* Indexing for performance optimization
* A simple ETL staging process for data transformation

The objective is to demonstrate performance tuning and production-ready SQL design.

---

## 📂 Project Structure

```
SQL2_INDEX_VIEW_PROC_ETL/
│
├── 03_views.sql
├── 04_stored_procedures.sql
├── 05_triggers.sql
├── 06_indexing.sql
├── 07_etl_stage.sql
├── output/
│     └── performance_notes.txt
└── README.md
```

---

## ⚙️ How to Run (SQL Server / SSMS)

> Assumes base tables (Students, Departments, Courses) already exist.

### Step 1 – Create Analytics View

Run:

```
03_views.sql
```

Creates:

* `vw_StudentPerformance`
  A reusable reporting layer combining Students, Departments, and Courses.

---

### Step 2 – Create Stored Procedure

Run:

```
04_stored_procedures.sql
```

Creates:

* `sp_GetTopStudentsByBatch(@BatchId, @MinMarks)`

Example usage:

```
EXEC sp_GetTopStudentsByBatch 2023, 75;
```

Returns sorted student results by marks.

---

### Step 3 – Create Trigger

Run:

```
05_triggers.sql
```

Creates:

* `MarksAudit` table
* `trg_MarksUpdate` trigger

Whenever student marks are updated:

* Old marks
* New marks
* Timestamp

are stored in the audit table.

This simulates real-world change tracking.

---

### Step 4 – Apply Indexes

Run:

```
06_indexing.sql
```

Creates non-clustered indexes to support:

* Batch-based filtering
* Marks-based filtering and sorting
* Faster JOIN operations

Performance explanation is provided in:

```
output/performance_notes.txt
```

---

### Step 5 – Execute ETL Stage Script

Run:

```
07_etl_stage.sql
```

This script demonstrates:

* Creation of a staging table
* Loading raw data
* Cleaning operations:

  * Trimming whitespace
  * Handling NULL values
  * Type conversion
* Inserting cleaned data into main Students table

This connects to Data Warehousing + ETL concepts.

## 🚀 Performance Improvements Implemented

✔ Non-clustered indexing
✔ Reduced full table scans
✔ Improved filtering speed
✔ Faster stored procedure execution
✔ Reusable reporting layer using views
✔ Basic audit tracking using trigger

---

## 📊 Reusable SQL Objects Created

| Object Type      | Object Name                            | Purpose                |
| ---------------- | -------------------------------------- | ---------------------- |
| View             | vw_StudentPerformance                  | Reporting layer        |
| Stored Procedure | sp_GetTopStudentsByBatch               | Filter & rank students |
| Trigger          | trg_MarksUpdate                        | Audit mark changes     |
| Indexes          | idx_students_batch, idx_students_marks | Performance tuning     |

---

## 🎯 Key Concepts Demonstrated

* Performance optimization using indexing
* Query tuning fundamentals
* Reusable SQL design
* Audit logging using triggers
* Basic ETL transformation process
* Production-oriented database thinking

---

## 🛠 Technologies Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* T-SQL

