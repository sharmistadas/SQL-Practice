
-- ============================================================
-- SQL SET OPERATORS ASSIGNMENT
-- File Name: sql_set_operators_assignment.sql
-- Tables Used: EMP and DEPT
-- ============================================================


-- Q1. Names of employees from department 10 combined with
-- names of employees from department 20.

SELECT ENAME
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT ENAME
FROM EMP
WHERE DEPTNO = 20;


-- Q2. Names and salaries of employees from department 10
-- combined with department 20, including duplicates.

SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = 20;


-- Q3. Salary and hire date of employees that appear in
-- both department 10 and department 20.

SELECT SAL, HIREDATE
FROM EMP
WHERE DEPTNO = 10
INTERSECT
SELECT SAL, HIREDATE
FROM EMP
WHERE DEPTNO = 20;


-- Q4. Names of employees from department 10 that do not
-- appear in department 20.

SELECT ENAME
FROM EMP
WHERE DEPTNO = 10
MINUS
SELECT ENAME
FROM EMP
WHERE DEPTNO = 20;


-- Q5. Department numbers present in both EMP and DEPT.

SELECT DEPTNO
FROM EMP
INTERSECT
SELECT DEPTNO
FROM DEPT;


-- Q6. Department numbers present in EMP but not in DEPT.

SELECT DEPTNO
FROM EMP
MINUS
SELECT DEPTNO
FROM DEPT;


-- Q7. Names of employees from department 30 combined with
-- department 40, removing duplicates.

SELECT ENAME
FROM EMP
WHERE DEPTNO = 30
UNION
SELECT ENAME
FROM EMP
WHERE DEPTNO = 40;


-- Q8. Names of employees from departments 10, 20, and 30,
-- including duplicates.

SELECT ENAME
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT ENAME
FROM EMP
WHERE DEPTNO = 20
UNION ALL
SELECT ENAME
FROM EMP
WHERE DEPTNO = 30;


-- Q9. Department names that have no matching employees.

SELECT DNAME
FROM DEPT
MINUS
SELECT D.DNAME
FROM DEPT D
JOIN EMP E
ON D.DEPTNO = E.DEPTNO;


-- Q10. Names of employees that occur in both departments
-- 10 and 30.

SELECT ENAME
FROM EMP
WHERE DEPTNO = 10
INTERSECT
SELECT ENAME
FROM EMP
WHERE DEPTNO = 30;


-- Q11. Unique department numbers from EMP without DISTINCT.

SELECT DEPTNO
FROM EMP
UNION
SELECT DEPTNO
FROM EMP;


-- Q12. Combined department numbers from EMP and DEPT
-- without repetition.

SELECT DEPTNO
FROM EMP
UNION
SELECT DEPTNO
FROM DEPT;


-- Q13. All department numbers from EMP and DEPT,
-- including duplicates.

SELECT DEPTNO
FROM EMP
UNION ALL
SELECT DEPTNO
FROM DEPT;


-- Q14. Department numbers that exist in both EMP and DEPT.

SELECT DEPTNO
FROM EMP
INTERSECT
SELECT DEPTNO
FROM DEPT;


-- Q15. Department numbers present in DEPT but not used
-- by any employee in EMP.

SELECT DEPTNO
FROM DEPT
MINUS
SELECT DEPTNO
FROM EMP;


-- Q16. Unique jobs from EMP combined with unique
-- department names from DEPT.

SELECT JOB
FROM EMP
UNION
SELECT DNAME
FROM DEPT;


-- Q17. Hire dates of employees earning more than 2000,
-- combined with hire dates of employees in department 30.

SELECT HIREDATE
FROM EMP
WHERE SAL > 2000
UNION
SELECT HIREDATE
FROM EMP
WHERE DEPTNO = 30;


-- Q18. Names of employees working as CLERK but not
-- in department 10.

SELECT ENAME
FROM EMP
WHERE JOB = 'CLERK'
MINUS
SELECT ENAME
FROM EMP
WHERE JOB = 'CLERK'
  AND DEPTNO = 10;


-- Q19. Employee numbers of employees who are not managers.

SELECT EMPNO
FROM EMP
MINUS
SELECT MGR
FROM EMP
WHERE MGR IS NOT NULL;


-- Q20. Employee numbers of employees who are managers.

SELECT EMPNO
FROM EMP
INTERSECT
SELECT MGR
FROM EMP
WHERE MGR IS NOT NULL;


-- ============================================================
-- OVERALL EXPLANATION / IMPORTANT NOTES
-- ============================================================

-- 1. UNION
-- Combines results and removes duplicate rows.

-- 2. UNION ALL
-- Combines results and keeps duplicate rows.

-- 3. INTERSECT
-- Returns only rows that exist in both query results.

-- 4. MINUS
-- Returns rows from the first query that do not exist
-- in the second query.

-- 5. ORDER OF QUERIES
-- In MINUS, order matters.
-- A MINUS B is not the same as B MINUS A.

-- 6. COLUMN RULES
-- Both SELECT statements must return the same number
-- of columns, in the same order.
-- Corresponding columns must have compatible data types.

-- 7. DUPLICATES
-- UNION removes duplicate complete rows.
-- UNION ALL keeps duplicate complete rows.
-- INTERSECT and MINUS return distinct rows.

-- 8. MANAGER LOGIC
-- EMP.MGR stores the employee number of an employee's
-- manager.
-- If an EMPNO appears in another employee's MGR column,
-- that employee is a manager.

-- 9. NULL MANAGER VALUES
-- MGR IS NOT NULL excludes employees who have no manager.
-- This avoids returning NULL as a manager employee number.

-- 10. IMPORTANT DIFFERENCE
-- Q5 and Q14 ask for department numbers in both tables.
-- Q6 checks EMP minus DEPT.
-- Q15 checks DEPT minus EMP.

-- 11. NOTE ABOUT Q3 AND Q10
-- INTERSECT compares the selected values, not employee IDs.
-- Employees cannot normally belong to both departments
-- at the same time, but their selected values may match.

-- 12. NOTE ABOUT Q16
-- JOB and DNAME are both character columns in the standard
-- SCOTT schema, so they can be combined with UNION.
-- The output contains values from two different categories.

-- ============================================================
