
-- ============================================
-- SQL ASSIGNMENT: ALL, ANY, JOIN AND SUBQUERIES
-- ============================================

-- Q1. WAQTD names of employees earning salary
-- more than the SALESMAN
SELECT ENAME
FROM EMP
WHERE SAL > ALL (
    SELECT SAL
    FROM EMP
    WHERE JOB = 'SALESMAN'
);


-- Q2. WAQTD details of employees hired after
-- ALL the CLERKS
SELECT *
FROM EMP
WHERE HIREDATE > ALL (
    SELECT HIREDATE
    FROM EMP
    WHERE JOB = 'CLERK'
);


-- Q3. WAQTD name and salary of employees earning
-- less than AT LEAST A MANAGER
SELECT ENAME, SAL
FROM EMP
WHERE SAL < ANY (
    SELECT SAL
    FROM EMP
    WHERE JOB = 'MANAGER'
);


-- Q4. WAQTD name and hiredate of employees hired
-- before ALL the MANAGERS
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE < ALL (
    SELECT HIREDATE
    FROM EMP
    WHERE JOB = 'MANAGER'
);


-- Q5. WAQTD names of employees hired after ALL
-- the MANAGERS and earning more than ALL the CLERKS
SELECT ENAME
FROM EMP
WHERE HIREDATE > ALL (
    SELECT HIREDATE
    FROM EMP
    WHERE JOB = 'MANAGER'
)
AND SAL > ALL (
    SELECT SAL
    FROM EMP
    WHERE JOB = 'CLERK'
);


-- Q6. WAQTD details of employees working as CLERK
-- and hired before AT LEAST A SALESMAN
SELECT *
FROM EMP
WHERE JOB = 'CLERK'
AND HIREDATE < ANY (
    SELECT HIREDATE
    FROM EMP
    WHERE JOB = 'SALESMAN'
);


-- Q7. WAQTD details of employees working in
-- ACCOUNTING or SALES department
SELECT E.*
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.DNAME IN ('ACCOUNTING', 'SALES');


-- Q8. WAQTD department names of employees
-- named SMITH, KING and MILLER
SELECT DISTINCT D.DNAME
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME IN ('SMITH', 'KING', 'MILLER');


-- Q9. WAQTD details of employees working
-- in NEW YORK or CHICAGO
SELECT E.*
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.LOC IN ('NEW YORK', 'CHICAGO');


-- Q10. WAQTD employee names if employees are
-- hired after ALL employees of department 10
SELECT ENAME
FROM EMP
WHERE HIREDATE > ALL (
    SELECT HIREDATE
    FROM EMP
    WHERE DEPTNO = 10
);








-- =====================================================
-- OVERALL EXPLANATION AND IMPORTANT NOTES
-- =====================================================


-- 12. IMPORTANT EXAM NOTES
-- Q1: SAL > ALL salesmen's salaries.
-- Q2: HIREDATE > ALL clerks' hire dates.
-- Q3: SAL < ANY manager's salary.
-- Q4: HIREDATE < ALL managers' hire dates.
-- Q5: HIREDATE > ALL managers' dates AND
--     SAL > ALL clerks' salaries.
-- Q6: JOB = 'CLERK' AND HIREDATE < ANY salesman's date.
-- Q7: IN ('ACCOUNTING', 'SALES').
-- Q8: IN ('SMITH', 'KING', 'MILLER').
-- Q9: LOC IN ('NEW YORK', 'CHICAGO').
-- Q10: HIREDATE > ALL department 10 employees' dates.


-- =====================================================
-- QUICK REVISION
-- =====================================================
-- ALL       = Every value
-- ANY       = At least one value
-- IN        = Matches any value in a list
-- JOIN      = Combines related tables
-- WHERE     = Filters rows
-- DISTINCT  = Removes duplicate results
-- AND       = Both conditions must be true
-- OR        = At least one condition must be true
-- SUBQUERY  = Query inside another query
-- =====================================================