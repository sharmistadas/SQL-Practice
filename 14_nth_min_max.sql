
-- ============================================
-- ASSIGNMENT: NTH MINIMUM AND MAXIMUM
-- ============================================

-- Q1. WAQTD 2nd minimum salary
SELECT MIN(SAL)
FROM EMP
WHERE SAL > (
    SELECT MIN(SAL)
    FROM EMP
);


-- Q2. WAQTD 5th maximum salary
SELECT DISTINCT SAL
FROM EMP E1
WHERE 4 = (
    SELECT COUNT(DISTINCT SAL)
    FROM EMP E2
    WHERE E2.SAL > E1.SAL
);


-- Q3. WAQTD name of the employee earning 3rd maximum salary
SELECT ENAME
FROM EMP
WHERE SAL = (
    SELECT DISTINCT SAL
    FROM EMP E1
    WHERE 2 = (
        SELECT COUNT(DISTINCT SAL)
        FROM EMP E2
        WHERE E2.SAL > E1.SAL
    )
);


-- Q4. WAQTD EMPNO of the employee earning 2nd maximum salary
SELECT EMPNO
FROM EMP
WHERE SAL = (
    SELECT MAX(SAL)
    FROM EMP
    WHERE SAL < (
        SELECT MAX(SAL)
        FROM EMP
    )
);


-- Q5. WAQTD department name of an employee getting 4th maximum salary
SELECT D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.SAL = (
    SELECT DISTINCT SAL
    FROM EMP E1
    WHERE 3 = (
        SELECT COUNT(DISTINCT SAL)
        FROM EMP E2
        WHERE E2.SAL > E1.SAL
    )
);


-- Q6. WAQTD details of the employee who was hired 2nd
SELECT *
FROM EMP
WHERE HIREDATE = (
    SELECT MIN(HIREDATE)
    FROM EMP
    WHERE HIREDATE > (
        SELECT MIN(HIREDATE)
        FROM EMP
    )
);


-- Q7. WAQTD name of the employee hired before the last employee
SELECT ENAME
FROM EMP
WHERE HIREDATE = (
    SELECT MAX(HIREDATE)
    FROM EMP
    WHERE HIREDATE < (
        SELECT MAX(HIREDATE)
        FROM EMP
    )
);


-- Q8. WAQTD location of the employee who was hired first
SELECT D.LOC
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.HIREDATE = (
    SELECT MIN(HIREDATE)
    FROM EMP
);


-- Q9. WAQTD details of the employee earning 7th minimum salary
SELECT *
FROM EMP E1
WHERE 6 = (
    SELECT COUNT(DISTINCT E2.SAL)
    FROM EMP E2
    WHERE E2.SAL < E1.SAL
);


-- Q10. WAQTD DNAME of employee getting 2nd maximum salary
SELECT D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.SAL = (
    SELECT MAX(SAL)
    FROM EMP
    WHERE SAL < (
        SELECT MAX(SAL)
        FROM EMP
    )
);






-- ============================================
-- OVERALL SHORT EXPLANATION
-- ============================================

-- MIN(SAL) gives the minimum salary.
-- MAX(SAL) gives the maximum salary.
--
-- 2nd MINIMUM:
-- Find the smallest salary greater than the minimum salary.
--
-- Nth MAXIMUM:
-- Count the number of DISTINCT salaries greater than each salary.
-- For 5th maximum, 4 distinct salaries must be greater.
-- For 4th maximum, 3 distinct salaries must be greater.
-- For 3rd maximum, 2 distinct salaries must be greater.
-- For 2nd maximum, 1 distinct salary must be greater.
--
-- Nth MINIMUM:
-- Count the number of DISTINCT salaries smaller than each salary.
-- For 7th minimum, 6 distinct salaries must be smaller.
--
-- HIREDATE:
-- MIN(HIREDATE) gives the earliest hire date.
-- MAX(HIREDATE) gives the latest hire date.
-- The second hire date is the smallest date after the earliest.
-- The date before the last is the greatest date before the latest.
--
-- JOIN:
-- EMP and DEPT are connected using DEPTNO.
-- Use JOIN when department name (DNAME) or location (LOC) is required.
--
-- DISTINCT SAL:
-- Counts different salary amounts, not employees.
-- Employees sharing the same salary have the same salary rank.
--
-- IMPORTANT:
-- These queries rank DISTINCT salary values.
-- If salaries are tied, more than one employee may be returned.
-- If hire dates are tied, more than one employee may be returned.
-- NULL salaries and hire dates are not ranked by these comparisons.
-- ============================================
