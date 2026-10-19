
-- ==========================================
-- SQL SPECIAL OPERATORS PRACTICE
-- TABLE: EMP
-- ==========================================

-- Q1. WAQTD name and department of employees
-- working in department 10, 20 or 30.
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (10, 20, 30);


-- Q2. WAQTD details of MANAGERS or ANALYSTS
-- working in department 20 or 30.
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'ANALYST')
AND DEPTNO IN (20, 30);


-- Q3. WAQTD details of all employees except CLERKS.
SELECT *
FROM EMP
WHERE JOB <> 'CLERK';


-- Q4. WAQTD details of all employees except SMITH,
-- SCOTT, ADAMS and ALLEN.
SELECT *
FROM EMP
WHERE ENAME NOT IN ('SMITH', 'SCOTT', 'ADAMS', 'ALLEN');


-- Q5. WAQTD details of employees except PRESIDENTS,
-- ANALYSTS and SALESMEN.
SELECT *
FROM EMP
WHERE JOB NOT IN ('PRESIDENT', 'ANALYST', 'SALESMAN');


-- Q6. WAQTD name and salary of employees earning
-- salary between 1000 and 3000.
SELECT ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 3000;


-- Q7. WAQTD all details of employees earning salary
-- between 1250 and 3000.
SELECT *
FROM EMP
WHERE SAL BETWEEN 1250 AND 3000;


-- Q8. WAQTD details of employees hired between 1980 and 1985.
SELECT *
FROM EMP
WHERE HIREDATE >= DATE '1980-01-01'
AND HIREDATE < DATE '1986-01-01';


-- Q9. WAQTD details of employees hired from 1982 through 1987.
SELECT *
FROM EMP
WHERE HIREDATE >= DATE '1982-01-01'
AND HIREDATE < DATE '1988-01-01';


-- Q10. WAQTD details of employees hired in March 1983,
-- working as SALESMAN in department 20 or 30.
SELECT *
FROM EMP
WHERE HIREDATE >= DATE '1983-03-01'
AND HIREDATE < DATE '1983-04-01'
AND JOB = 'SALESMAN'
AND DEPTNO IN (20, 30);


-- Q11. WAQTD details of employees EXCEPT those hired
-- between 1981 and 1987 (inclusive).
SELECT *
FROM EMP
WHERE HIREDATE < DATE '1981-01-01'
OR HIREDATE >= DATE '1988-01-01';


-- Q12. WAQTD details of employees EXCEPT those earning
-- salary between 500 and 3000.
SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 500 AND 3000;


-- Q13. WAQTD details of employees EXCEPT those hired in 1981.
SELECT *
FROM EMP
WHERE HIREDATE < DATE '1981-01-01'
OR HIREDATE >= DATE '1982-01-01';


-- Q14. WAQTD details of employees who do not earn commission.
SELECT *
FROM EMP
WHERE COMM IS NULL;


-- Q15. WAQTD details of employees who do not have a manager.
SELECT *
FROM EMP
WHERE MGR IS NULL;


-- Q16. WAQTD details of employees who earn commission.
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;


-- Q17. WAQTD details of employees who have a reporting manager.
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;


-- Q18. WAQTD details of employees whose names start with A.
SELECT *
FROM EMP
WHERE ENAME LIKE 'A%';


-- Q19. WAQTD details of employees whose names end with R.
SELECT *
FROM EMP
WHERE ENAME LIKE '%R';


-- Q20. WAQTD details of employees whose names do not start with A.
SELECT *
FROM EMP
WHERE ENAME NOT LIKE 'A%';


-- Q21. WAQTD details of employees whose names do not
-- contain exactly 6 characters.
SELECT *
FROM EMP
WHERE ENAME NOT LIKE '______';


-- ==========================================
-- OVERALL EXPLANATION
-- ==========================================

-- IN                : Matches any value in a list.
-- NOT IN            : Excludes values in a list.
-- BETWEEN           : Checks a range, including endpoints.
-- NOT BETWEEN       : Excludes values within a range.
-- IS NULL           : Checks for missing values.
-- IS NOT NULL       : Checks for existing values.
-- LIKE 'A%'         : Name starts with A.
-- LIKE '%R'         : Name ends with R.
-- NOT LIKE 'A%'     : Name does not start with A.
-- LIKE '______'     : Exactly 6 characters (6 underscores).
-- NOT LIKE '______' : Not exactly 6 characters.
-- AND               : Both conditions must be true.
-- OR                : At least one condition must be true.
-- HIREDATE          : Employee's hire date.
-- SAL               : Monthly salary.
-- COMM              : Commission.
-- MGR               : Employee number of reporting manager.
-- ENAME             : Employee name.
-- DEPTNO            : Department number.

-- NOTE:
-- This file uses Oracle SQL and the standard EMP table.
-- BETWEEN includes both endpoints.
-- For commission, NULL means no commission value is recorded.
