
-- ============================================================
-- FILE 1: DML PRACTICE
-- Topics: INSERT, UPDATE, DELETE, MERGE
-- ============================================================

-- SETUP: Run this section only once.

CREATE TABLE PRACTICE_DEPT (
    DEPT_ID NUMBER PRIMARY KEY,
    DEPT_NAME VARCHAR2(30) NOT NULL
);

CREATE TABLE PRACTICE_EMP (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(40) NOT NULL,
    JOB VARCHAR2(30),
    SALARY NUMBER(10,2),
    DEPT_ID NUMBER,
    EMAIL VARCHAR2(100),
    CONSTRAINT FK_PRACTICE_EMP_DEPT
        FOREIGN KEY (DEPT_ID)
        REFERENCES PRACTICE_DEPT(DEPT_ID)
);

INSERT INTO PRACTICE_DEPT VALUES (10, 'HR');
INSERT INTO PRACTICE_DEPT VALUES (20, 'IT');
INSERT INTO PRACTICE_DEPT VALUES (30, 'SALES');

INSERT INTO PRACTICE_EMP
VALUES (101, 'Asha', 'ANALYST', 4500, 20, 'asha@example.com');

INSERT INTO PRACTICE_EMP
VALUES (102, 'Ravi', 'CLERK', 2500, 10, 'ravi@example.com');

INSERT INTO PRACTICE_EMP
VALUES (103, 'Meera', 'SALESMAN', 3500, 30, 'meera@example.com');

INSERT INTO PRACTICE_EMP
VALUES (104, 'Arun', 'ANALYST', 5200, 20, 'arun@example.com');

COMMIT;


-- Q1. Insert a new department with ID 40 and name FINANCE.

INSERT INTO PRACTICE_DEPT (DEPT_ID, DEPT_NAME)
VALUES (40, 'FINANCE');


-- Q2. Insert a new employee with all column values.

INSERT INTO PRACTICE_EMP
    (EMP_ID, EMP_NAME, JOB, SALARY, DEPT_ID, EMAIL)
VALUES
    (105, 'Nisha', 'CLERK', 2800, 10, 'nisha@example.com');


-- Q3. Insert an employee without providing EMAIL.

INSERT INTO PRACTICE_EMP
    (EMP_ID, EMP_NAME, JOB, SALARY, DEPT_ID)
VALUES
    (106, 'Kiran', 'TRAINEE', 2200, 20);


-- Q4. Insert an employee using INSERT with SELECT.

INSERT INTO PRACTICE_EMP
    (EMP_ID, EMP_NAME, JOB, SALARY, DEPT_ID, EMAIL)
SELECT 107, 'Divya', 'ANALYST', 4800, 20, 'divya@example.com'
FROM DUAL;


-- Q5. Increase salary by 10% for employees in department 20.

UPDATE PRACTICE_EMP
SET SALARY = SALARY * 1.10
WHERE DEPT_ID = 20;


-- Q6. Change Ravi's job to SENIOR CLERK.

UPDATE PRACTICE_EMP
SET JOB = 'SENIOR CLERK'
WHERE EMP_NAME = 'Ravi';


-- Q7. Change the email of employee 101.

UPDATE PRACTICE_EMP
SET EMAIL = 'asha.das@example.com'
WHERE EMP_ID = 101;


-- Q8. Increase salary by 500 for employees earning below 3000.

UPDATE PRACTICE_EMP
SET SALARY = SALARY + 500
WHERE SALARY < 3000;


-- Q9. Delete employee 106.

DELETE FROM PRACTICE_EMP
WHERE EMP_ID = 106;


-- Q10. Delete employees from department 30.

DELETE FROM PRACTICE_EMP
WHERE DEPT_ID = 30;


-- Q11. If employee 101 exists, update the employee.
-- Otherwise, insert the employee.

MERGE INTO PRACTICE_EMP T
USING (
    SELECT 101 AS EMP_ID,
           'Asha' AS EMP_NAME,
           'SENIOR ANALYST' AS JOB,
           6000 AS SALARY,
           20 AS DEPT_ID,
           'asha.new@example.com' AS EMAIL
    FROM DUAL
) S
ON (T.EMP_ID = S.EMP_ID)
WHEN MATCHED THEN
    UPDATE SET T.EMP_NAME = S.EMP_NAME,
               T.JOB = S.JOB,
               T.SALARY = S.SALARY,
               T.DEPT_ID = S.DEPT_ID,
               T.EMAIL = S.EMAIL
WHEN NOT MATCHED THEN
    INSERT (EMP_ID, EMP_NAME, JOB, SALARY, DEPT_ID, EMAIL)
    VALUES (S.EMP_ID, S.EMP_NAME, S.JOB,
            S.SALARY, S.DEPT_ID, S.EMAIL);


-- Q12. Insert employee 108 if not present; otherwise update
-- the employee's salary and job.

MERGE INTO PRACTICE_EMP T
USING (
    SELECT 108 AS EMP_ID,
           'Suman' AS EMP_NAME,
           'DEVELOPER' AS JOB,
           5500 AS SALARY,
           20 AS DEPT_ID,
           'suman@example.com' AS EMAIL
    FROM DUAL
) S
ON (T.EMP_ID = S.EMP_ID)
WHEN MATCHED THEN
    UPDATE SET T.SALARY = S.SALARY,
               T.JOB = S.JOB
WHEN NOT MATCHED THEN
    INSERT (EMP_ID, EMP_NAME, JOB, SALARY, DEPT_ID, EMAIL)
    VALUES (S.EMP_ID, S.EMP_NAME, S.JOB,
            S.SALARY, S.DEPT_ID, S.EMAIL);


-- CHECK THE FINAL DATA

SELECT * FROM PRACTICE_DEPT ORDER BY DEPT_ID;

SELECT * FROM PRACTICE_EMP ORDER BY EMP_ID;


-- ============================================================
-- OVERALL EXPLANATION / IMPORTANT NOTES
-- ============================================================

-- INSERT:
-- Adds new rows to a table.

-- UPDATE:
-- Modifies existing rows.
-- Always check the WHERE condition before running UPDATE.

-- DELETE:
-- Removes rows from a table.
-- Without WHERE, all rows are deleted.

-- MERGE:
-- WHEN MATCHED means update an existing matching row.
-- WHEN NOT MATCHED means insert a new row.

-- DUAL:
-- Oracle's one-row helper table, often used to select
-- literal values or expressions.

-- COMMIT:
-- Saves changes permanently.

-- ROLLBACK:
-- Undoes changes that have not been committed.

-- PRIMARY KEY:
-- Identifies each row uniquely.

-- FOREIGN KEY:
-- Ensures DEPT_ID in PRACTICE_EMP refers to a department
-- that exists in PRACTICE_DEPT.

-- IMPORTANT:
-- Run the setup section only once.
-- DML statements change data, so review each WHERE condition.
-- ============================================================
