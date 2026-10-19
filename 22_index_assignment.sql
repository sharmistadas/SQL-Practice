
-- ============================================================
-- SQL INDEX ASSIGNMENT
-- ============================================================


-- Q1. Create an index on LAST_NAME in EMPLOYEES.

CREATE INDEX IDX_EMP_LAST_NAME
ON EMPLOYEES (LAST_NAME);


-- Q2. Create an index on SALARY in EMPLOYEES.

CREATE INDEX IDX_EMP_SALARY
ON EMPLOYEES (SALARY);


-- Q3. Create an index on DEPARTMENT_ID in EMPLOYEES.

CREATE INDEX IDX_EMP_DEPARTMENT_ID
ON EMPLOYEES (DEPARTMENT_ID);


-- Q4. Create an index on HIRE_DATE in EMPLOYEES.

CREATE INDEX IDX_EMP_HIRE_DATE
ON EMPLOYEES (HIRE_DATE);


-- Q5. Create an index on JOB_ID in EMPLOYEES.

CREATE INDEX IDX_EMP_JOB_ID
ON EMPLOYEES (JOB_ID);


-- Q6. Create a composite index on FIRST_NAME and LAST_NAME.

CREATE INDEX IDX_EMP_FIRST_LAST
ON EMPLOYEES (FIRST_NAME, LAST_NAME);


-- Q7. Create a composite index on DEPARTMENT_ID and SALARY.

CREATE INDEX IDX_EMP_DEPT_SALARY
ON EMPLOYEES (DEPARTMENT_ID, SALARY);


-- Q8. Create an index on DEPARTMENT_NAME in DEPARTMENTS.

CREATE INDEX IDX_DEPT_NAME
ON DEPARTMENTS (DEPARTMENT_NAME);


-- Q9. Create an index on LOCATION_ID in DEPARTMENTS.

CREATE INDEX IDX_DEPT_LOCATION_ID
ON DEPARTMENTS (LOCATION_ID);


-- Q10. Create a composite index on CITY and STATE_PROVINCE.

CREATE INDEX IDX_LOC_CITY_STATE
ON LOCATIONS (CITY, STATE_PROVINCE);


-- Q11. Drop the index created on LAST_NAME in EMPLOYEES.

DROP INDEX IDX_EMP_LAST_NAME;


-- Q12. Drop the index created on SALARY in EMPLOYEES.

DROP INDEX IDX_EMP_SALARY;


-- Q13. Drop the composite index on FIRST_NAME and LAST_NAME.

DROP INDEX IDX_EMP_FIRST_LAST;


-- Q14. Drop the index created on DEPARTMENT_NAME.

DROP INDEX IDX_DEPT_NAME;


-- Q15. Drop the composite index on DEPARTMENT_ID and SALARY.

DROP INDEX IDX_EMP_DEPT_SALARY;











-- ============================================================
-- OVERALL EXPLANATION / IMPORTANT NOTES
-- ============================================================

-- 1. INDEX:
-- An index helps Oracle locate table rows more efficiently.

-- 2. CREATE INDEX:
-- Syntax:
-- CREATE INDEX index_name
-- ON table_name (column_name);

-- 3. COMPOSITE INDEX:
-- An index created on two or more columns.
-- Example:
-- CREATE INDEX IDX_EMP_DEPT_SALARY
-- ON EMPLOYEES (DEPARTMENT_ID, SALARY);

-- 4. COLUMN ORDER:
-- In a composite index, column order matters.
-- An index on (DEPARTMENT_ID, SALARY) is most useful
-- for queries filtering by DEPARTMENT_ID first, or by
-- both DEPARTMENT_ID and SALARY.
-- It is not generally equivalent to an index on
-- (SALARY, DEPARTMENT_ID).

-- 5. DROP INDEX:
-- Syntax:
-- DROP INDEX index_name;

-- 6. INDEX NAMES:
-- Index names must be unique within the Oracle schema.
-- Use meaningful names to identify their tables and columns.

-- 7. PRIMARY KEY:
-- Oracle automatically creates or uses an index to enforce
-- a primary key or unique constraint. Do not create a
-- duplicate index unnecessarily.

-- 8. PERFORMANCE:
-- Indexes can speed up searches and joins, but they use
-- storage and can slow down INSERT, UPDATE, and DELETE
-- operations because indexes also need to be maintained.

-- 9. EXECUTION ORDER:
-- Q11-Q15 drop indexes created in earlier questions.
-- After running all statements, those five indexes
-- will no longer exist.

-- ============================================================
