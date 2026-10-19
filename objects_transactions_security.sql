-- =========================================================
-- FILE 4: DATABASE OBJECTS, TRANSACTIONS AND SECURITY
-- =========================================================


-- =========================================================
-- PART 1: VIEWS
-- =========================================================

-- Q1. Create a view displaying employee details.
CREATE OR REPLACE VIEW PRACTICE_EMP_VIEW AS
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM SCOTT.EMP;


-- Q2. Display all records from the view.
SELECT *
FROM PRACTICE_EMP_VIEW;


-- Q3. Display employees earning more than 2000 using the view.
SELECT ENAME, SAL
FROM PRACTICE_EMP_VIEW
WHERE SAL > 2000;


-- Q4. Create a view showing employee name and department name.
CREATE OR REPLACE VIEW PRACTICE_EMP_DEPT_VIEW AS
SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME, D.LOC
FROM SCOTT.EMP E
JOIN SCOTT.DEPT D ON E.DEPTNO = D.DEPTNO;


-- Q5. Display employee names and their department details.
SELECT *
FROM PRACTICE_EMP_DEPT_VIEW;


-- Q6. Remove the first view.
DROP VIEW PRACTICE_EMP_VIEW;


-- =========================================================
-- PART 2: SEQUENCES
-- =========================================================

-- Q7. Create a sequence for generating numeric IDs.
CREATE SEQUENCE PRACTICE_EMP_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


-- Q8. Generate the next sequence number.
SELECT PRACTICE_EMP_SEQ.NEXTVAL AS NEW_ID
FROM DUAL;


-- Q9. Display the current sequence number.
-- Run NEXTVAL first in your session.
SELECT PRACTICE_EMP_SEQ.CURRVAL AS CURRENT_ID
FROM DUAL;


-- Q10. Use a sequence to insert a record into a practice table.
-- Create the table first.
CREATE TABLE PRACTICE_SEQUENCE_DEMO (
    ID NUMBER PRIMARY KEY,
    DESCRIPTION VARCHAR2(100)
);

INSERT INTO PRACTICE_SEQUENCE_DEMO (ID, DESCRIPTION)
VALUES (PRACTICE_EMP_SEQ.NEXTVAL, 'First practice record');


-- Q11. Display the inserted record.
SELECT *
FROM PRACTICE_SEQUENCE_DEMO;


-- Q12. Drop the sequence when no longer needed.
-- Run only after completing sequence practice.
-- DROP SEQUENCE PRACTICE_EMP_SEQ;


-- =========================================================
-- PART 3: TRANSACTION CONTROL LANGUAGE (TCL)
-- =========================================================

-- Q13. Create a table for transaction practice.
CREATE TABLE PRACTICE_TRANSACTION (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(50),
    AMOUNT NUMBER(10,2)
);


-- Q14. Insert a record into the transaction table.
INSERT INTO PRACTICE_TRANSACTION (ID, NAME, AMOUNT)
VALUES (1, 'Sample A', 1000);


-- Q15. Save the current transaction permanently.
-- COMMIT makes the current transaction permanent.
COMMIT;


-- Q16. Update an amount and undo the update using ROLLBACK.
UPDATE PRACTICE_TRANSACTION
SET AMOUNT = 1500
WHERE ID = 1;

ROLLBACK;

-- Check the amount: it should remain 1000 after the rollback.
SELECT *
FROM PRACTICE_TRANSACTION;


-- Q17. Use SAVEPOINT and roll back to it.
UPDATE PRACTICE_TRANSACTION
SET AMOUNT = 1200
WHERE ID = 1;

SAVEPOINT BEFORE_SECOND_UPDATE;

UPDATE PRACTICE_TRANSACTION
SET AMOUNT = 2000
WHERE ID = 1;

ROLLBACK TO BEFORE_SECOND_UPDATE;

-- The amount should be 1200 in the current transaction.
SELECT *
FROM PRACTICE_TRANSACTION;

-- Commit the remaining update if you want to keep it.
COMMIT;


-- =========================================================
-- PART 4: DATA CONTROL LANGUAGE (DCL)
-- =========================================================

-- Q18. Give SELECT permission to another database user.
-- Replace OTHER_USERNAME with an existing database username.
-- You need the required privileges to run this command.
-- GRANT SELECT ON PRACTICE_TRANSACTION TO OTHER_USERNAME;


-- Q19. Remove SELECT permission from another database user.
-- Use the same username that received the permission.
-- REVOKE SELECT ON PRACTICE_TRANSACTION FROM OTHER_USERNAME;


-- Q20. Give SELECT and INSERT permissions to another user.
-- GRANT SELECT, INSERT ON PRACTICE_TRANSACTION TO OTHER_USERNAME;


-- =========================================================
-- PART 5: ADDITIONAL OBJECT AND TRANSACTION PRACTICE
-- =========================================================

-- Q21. Add a new column to the transaction table.
ALTER TABLE PRACTICE_TRANSACTION
ADD STATUS VARCHAR2(20);


-- Q22. Update the status of the sample record.
UPDATE PRACTICE_TRANSACTION
SET STATUS = 'COMPLETED'
WHERE ID = 1;

COMMIT;


-- Q23. Display the transaction table structure.
-- Run this command in SQL*Plus or SQL Developer.
DESC PRACTICE_TRANSACTION;


-- Q24. Display all records from the transaction table.
SELECT *
FROM PRACTICE_TRANSACTION;


-- Q25. Drop the practice view if it still exists.
-- Uncomment and run only if the view exists.
-- DROP VIEW PRACTICE_EMP_DEPT_VIEW;


