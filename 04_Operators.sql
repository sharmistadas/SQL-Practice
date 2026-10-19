
-- ==========================================
-- SQL OPERATORS AND CONDITIONS
-- TABLE: EMP
-- ==========================================

-- Q1. WAQTD details of employees working as SALESMAN or MANAGER.
SELECT *
FROM EMP
WHERE JOB IN ('SALESMAN', 'MANAGER');


-- Q2. WAQTD details of SALESMAN earning salary greater than 1500.
SELECT *
FROM EMP
WHERE JOB = 'SALESMAN'
AND SAL > 1500;


-- Q3. WAQTD details of SMITH and ALLEN.
SELECT *
FROM EMP
WHERE ENAME IN ('SMITH', 'ALLEN');


-- Q4. WAQTD employees working as SALESMAN, CLERK or PRESIDENT.
SELECT *
FROM EMP
WHERE JOB IN ('SALESMAN', 'CLERK', 'PRESIDENT');


-- Q5. WAQTD details of employees except MANAGERS.
SELECT *
FROM EMP
WHERE JOB <> 'MANAGER';


-- Q6. WAQTD details of CLERKS or ANALYSTS in department 10 or 20.
SELECT *
FROM EMP
WHERE JOB IN ('CLERK', 'ANALYST')
AND DEPTNO IN (10, 20);


-- Q7. WAQTD name, job and department of ANALYSTS in department 20 or 30.
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'ANALYST'
AND DEPTNO IN (20, 30);


-- Q8. WAQTD number of employees earning less than 2000 in department 10.
SELECT COUNT(*)
FROM EMP
WHERE SAL < 2000
AND DEPTNO = 10;


-- Q9. WAQTD total salary paid to CLERKS.
SELECT SUM(SAL)
FROM EMP
WHERE JOB = 'CLERK';


-- Q10. WAQTD details of CLERKS earning less than 1500.
SELECT *
FROM EMP
WHERE JOB = 'CLERK'
AND SAL < 1500;


-- Q11. WAQTD name and hire date of MANAGERS in department 30.
SELECT ENAME, HIREDATE
FROM EMP
WHERE JOB = 'MANAGER'
AND DEPTNO = 30;


-- Q12. WAQTD all details along with annual salary of SALESMAN
-- in department 30 whose annual salary is greater than 14000.
SELECT EMP.*, SAL * 12 AS ANNUAL_SALARY
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN'
AND SAL * 12 > 14000;


-- Q13. WAQTD all details of employees in department 50 or working as ANALYST.
SELECT *
FROM EMP
WHERE DEPTNO = 50
OR JOB = 'ANALYST';


-- Q14. WAQTD names of CLERKS earning less than 1100.
SELECT ENAME
FROM EMP
WHERE SAL < 1100
AND JOB = 'CLERK';


-- Q15. WAQTD name, salary, annual salary and department number
-- of employees in department 20 earning more than 1100
-- and having annual salary greater than 12000.
SELECT ENAME, SAL, SAL * 12 AS ANNUAL_SALARY, DEPTNO
FROM EMP
WHERE DEPTNO = 20
AND SAL > 1100
AND SAL * 12 > 12000;


-- Q16. WAQTD employee number and name of MANAGERS in department 20.
SELECT EMPNO, ENAME
FROM EMP
WHERE JOB = 'MANAGER'
AND DEPTNO = 20;


-- Q17. WAQTD all details of employees in department 20 or 30.
SELECT *
FROM EMP
WHERE DEPTNO IN (20, 30);


-- Q18. WAQTD all details of ANALYSTS in department 10.
SELECT *
FROM EMP
WHERE JOB = 'ANALYST'
AND DEPTNO = 10;


-- Q19. WAQTD details of the PRESIDENT earning salary 4000.
SELECT *
FROM EMP
WHERE JOB = 'PRESIDENT'
AND SAL = 4000;


-- Q20. WAQTD name, department number and job of CLERKS
-- in department 10 or 20.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE JOB = 'CLERK'
AND DEPTNO IN (10, 20);


-- Q21. WAQTD details of CLERKS or MANAGERS in department 10.
SELECT *
FROM EMP
WHERE JOB IN ('CLERK', 'MANAGER')
AND DEPTNO = 10;


-- Q22. WAQTD names of employees in departments 10, 20, 30 or 40.
SELECT ENAME
FROM EMP
WHERE DEPTNO IN (10, 20, 30, 40);


-- Q23. WAQTD details of employees with employee numbers 7902 and 7839.
SELECT *
FROM EMP
WHERE EMPNO IN (7902, 7839);


-- Q24. WAQTD details of employees working as MANAGER, SALESMAN or CLERK.
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');


-- Q25. WAQTD names of employees hired after 1981 and before 1987.
SELECT ENAME
FROM EMP
WHERE HIREDATE >= DATE '1982-01-01'
AND HIREDATE < DATE '1987-01-01';


-- Q26. WAQTD details of employees earning more than 1250
-- but less than 3000.
SELECT *
FROM EMP
WHERE SAL > 1250
AND SAL < 3000;


-- Q27. WAQTD names of employees hired after 1981
-- and working in department 10 or 30.
SELECT ENAME
FROM EMP
WHERE HIREDATE >= DATE '1982-01-01'
AND DEPTNO IN (10, 30);


-- Q28. WAQTD names and annual salaries of employees working
-- as MANAGER or CLERK in department 10 or 30.
SELECT ENAME, SAL * 12 AS ANNUAL_SALARY
FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK')
AND DEPTNO IN (10, 30);


-- Q29. WAQTD all details and annual salary if monthly salary
-- is between 1000 and 4000 and annual salary exceeds 15000.

SELECT EMP.*, SAL * 12 AS ANNUAL_SALARY
FROM EMP
WHERE SAL BETWEEN 1000 AND 4000
AND SAL * 12 > 15000 ;


-- ==========================================
-- OVERALL EXPLANATION
-- ==========================================

-- SELECT *          : Displays all columns.
-- SELECT ENAME, SAL  : Displays selected columns.
-- WHERE             : Filters records.
-- AND               : Both conditions must be true.
-- OR                : At least one condition must be true.
-- IN                : Matches any value in a list.
-- <>                : Not equal to.
-- >                 : Greater than.
-- <                 : Less than.
-- BETWEEN           : Checks an inclusive range.
-- LIKE 'A%'         : Finds names starting with A.
-- COUNT(*)          : Counts rows.
-- SUM(SAL)          : Calculates total salary.
-- SAL * 12          : Calculates annual salary.
-- AS ANNUAL_SALARY  : Gives a column an alias.
-- HIREDATE           : Employee's hire date.
-- EMPNO              : Employee number.
-- ENAME              : Employee name.
-- JOB                : Employee designation.
-- DEPTNO             : Department number.
-- SAL                : Monthly salary.
-- COMM               : Commission.
