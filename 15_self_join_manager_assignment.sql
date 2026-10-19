
-- ============================================
-- ASSIGNMENT: SELF JOIN / EMPLOYEE-MANAGER
-- ============================================

-- Q1. WAQTD SMITH'S REPORTING MANAGER'S NAME
SELECT M.ENAME
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.ENAME = 'SMITH';


-- Q2. WAQTD ADAMS' MANAGER'S MANAGER NAME
SELECT M2.ENAME
FROM EMP E
JOIN EMP M1 ON E.MGR = M1.EMPNO
JOIN EMP M2 ON M1.MGR = M2.EMPNO
WHERE E.ENAME = 'ADAMS';


-- Q3. WAQTD DNAME OF JONES' MANAGER
SELECT D.DNAME
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
JOIN DEPT D ON M.DEPTNO = D.DEPTNO
WHERE E.ENAME = 'JONES';


-- Q4. WAQTD MILLER'S MANAGER'S SALARY
SELECT M.SAL
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.ENAME = 'MILLER';


-- Q5. WAQTD LOC OF SMITH'S MANAGER'S MANAGER
SELECT D.LOC
FROM EMP E
JOIN EMP M1 ON E.MGR = M1.EMPNO
JOIN EMP M2 ON M1.MGR = M2.EMPNO
JOIN DEPT D ON M2.DEPTNO = D.DEPTNO
WHERE E.ENAME = 'SMITH';


-- Q6. WAQTD NAME OF EMPLOYEES REPORTING TO BLAKE
SELECT E.ENAME
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.ENAME = 'BLAKE';


-- Q7. WAQTD NUMBER OF EMPLOYEES REPORTING TO KING
SELECT COUNT(*) AS EMPLOYEE_COUNT
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.ENAME = 'KING';


-- Q8. WAQTD DETAILS OF EMPLOYEES REPORTING TO JONES
SELECT E.*
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.ENAME = 'JONES';


-- Q9. WAQTD ENAMES OF EMPLOYEES REPORTING TO BLAKE'S MANAGER
SELECT E.ENAME
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.EMPNO = (
    SELECT MGR
    FROM EMP
    WHERE ENAME = 'BLAKE'
);


-- Q10. WAQTD NUMBER OF EMPLOYEES REPORTING TO FORD'S MANAGER
SELECT COUNT(*) AS EMPLOYEE_COUNT
FROM EMP E
WHERE E.MGR = (
    SELECT MGR
    FROM EMP
    WHERE ENAME = 'FORD'
);








-- ============================================
-- OVERALL SHORT EXPLANATION
-- ============================================

-- SELF JOIN:
-- A self join joins the EMP table with itself.
-- It helps connect an employee with their manager.
--
-- E = employee
-- M = manager
--
-- E.MGR = M.EMPNO
-- The employee's MGR contains the manager's EMPNO.
--
-- MANAGER'S MANAGER:
-- Join EMP three times:
-- E  = employee
-- M1 = employee's manager
-- M2 = manager's manager
--
-- E.MGR = M1.EMPNO
-- M1.MGR = M2.EMPNO
--
-- DEPARTMENT NAME / LOCATION:
-- Join DEPT using the department number of the required manager.
-- M.DEPTNO = D.DEPTNO
--
-- COUNT(*):
-- Counts employees reporting to the specified manager.
--
-- REPORTING TO:
-- Employees whose MGR equals the manager's EMPNO.
--
-- SUBQUERY:
-- Used in Q9 and Q10 to find the manager's EMPNO first,
-- then find employees who report to that manager.
--
-- IMPORTANT:
-- The CEO/president may have MGR as NULL.
-- If a manager has no direct reports, COUNT(*) returns 0.
-- ============================================
