-- =========================================================
-- FILE 3: ADVANCED SQL QUERIES PRACTICE
-- =========================================================


-- =========================================================
-- PART 1: SUBQUERIES AND CORRELATED SUBQUERIES
-- =========================================================

-- Q1. Display employees earning more than the average salary.
SELECT ENAME, SAL
FROM SCOTT.EMP
WHERE SAL > (SELECT AVG(SAL) FROM SCOTT.EMP);


-- Q2. Display employees earning more than their department's
-- average salary. (Correlated subquery)
SELECT E.ENAME, E.DEPTNO, E.SAL
FROM SCOTT.EMP E
WHERE E.SAL > (
    SELECT AVG(E2.SAL)
    FROM SCOTT.EMP E2
    WHERE E2.DEPTNO = E.DEPTNO
);


-- Q3. Display employees earning the highest salary in their department.
SELECT E.ENAME, E.DEPTNO, E.SAL
FROM SCOTT.EMP E
WHERE E.SAL = (
    SELECT MAX(E2.SAL)
    FROM SCOTT.EMP E2
    WHERE E2.DEPTNO = E.DEPTNO
);


-- Q4. Display employees earning more than their manager.
SELECT E.ENAME AS EMPLOYEE_NAME, E.SAL AS EMPLOYEE_SALARY,
       M.ENAME AS MANAGER_NAME, M.SAL AS MANAGER_SALARY
FROM SCOTT.EMP E
JOIN SCOTT.EMP M ON E.MGR = M.EMPNO
WHERE E.SAL > M.SAL;


-- =========================================================
-- PART 2: EXISTS AND NOT EXISTS
-- =========================================================

-- Q5. Display departments that have at least one employee.
SELECT D.DEPTNO, D.DNAME
FROM SCOTT.DEPT D
WHERE EXISTS (
    SELECT 1
    FROM SCOTT.EMP E
    WHERE E.DEPTNO = D.DEPTNO
);


-- Q6. Display departments that have no employees.
SELECT D.DEPTNO, D.DNAME
FROM SCOTT.DEPT D
WHERE NOT EXISTS (
    SELECT 1
    FROM SCOTT.EMP E
    WHERE E.DEPTNO = D.DEPTNO
);


-- Q7. Display employees who have at least one other employee
-- in the same department earning a higher salary.
SELECT E.ENAME, E.DEPTNO, E.SAL
FROM SCOTT.EMP E
WHERE EXISTS (
    SELECT 1
    FROM SCOTT.EMP E2
    WHERE E2.DEPTNO = E.DEPTNO
      AND E2.SAL > E.SAL
);


-- =========================================================
-- PART 3: CASE EXPRESSIONS
-- =========================================================

-- Q8. Categorize employees based on salary.
SELECT ENAME, SAL,
       CASE
           WHEN SAL >= 3000 THEN 'HIGH SALARY'
           WHEN SAL >= 1500 THEN 'MEDIUM SALARY'
           ELSE 'LOW SALARY'
       END AS SALARY_CATEGORY
FROM SCOTT.EMP;


-- Q9. Display employee name and commission status.
SELECT ENAME, COMM,
       CASE
           WHEN COMM IS NULL THEN 'NO COMMISSION'
           WHEN COMM = 0 THEN 'ZERO COMMISSION'
           ELSE 'HAS COMMISSION'
       END AS COMMISSION_STATUS
FROM SCOTT.EMP;


-- Q10. Display department names using department numbers.
SELECT ENAME, DEPTNO,
       CASE DEPTNO
           WHEN 10 THEN 'ACCOUNTING'
           WHEN 20 THEN 'RESEARCH'
           WHEN 30 THEN 'SALES'
           WHEN 40 THEN 'OPERATIONS'
           ELSE 'OTHER'
       END AS DEPARTMENT_NAME
FROM SCOTT.EMP;


-- Q11. Calculate a salary bonus based on salary.
-- Bonus: 20% for salary >= 3000, otherwise 10%.
SELECT ENAME, SAL,
       CASE
           WHEN SAL >= 3000 THEN SAL * 0.20
           ELSE SAL * 0.10
       END AS BONUS
FROM SCOTT.EMP;


-- =========================================================
-- PART 4: COMMON TABLE EXPRESSIONS (CTE / WITH)
-- =========================================================

-- Q12. Display employees earning more than the average salary
-- using a CTE.
WITH AVG_SALARY AS (
    SELECT AVG(SAL) AS AVG_SAL
    FROM SCOTT.EMP
)
SELECT E.ENAME, E.SAL
FROM SCOTT.EMP E
CROSS JOIN AVG_SALARY A
WHERE E.SAL > A.AVG_SAL;


-- Q13. Calculate total salary for each department using a CTE.
WITH DEPT_SALARY AS (
    SELECT DEPTNO, SUM(SAL) AS TOTAL_SALARY
    FROM SCOTT.EMP
    GROUP BY DEPTNO
)
SELECT D.DNAME, DS.TOTAL_SALARY
FROM DEPT_SALARY DS
JOIN SCOTT.DEPT D ON DS.DEPTNO = D.DEPTNO;


-- Q14. Display the top 3 highest-paid employees using a CTE.
WITH EMP_RANK AS (
    SELECT ENAME, SAL,
           ROW_NUMBER() OVER (ORDER BY SAL DESC, EMPNO) AS RN
    FROM SCOTT.EMP
)
SELECT ENAME, SAL
FROM EMP_RANK
WHERE RN <= 3;


-- =========================================================
-- PART 5: WINDOW FUNCTIONS
-- =========================================================

-- Q15. Assign a unique row number by salary, highest first.
SELECT ENAME, SAL,
       ROW_NUMBER() OVER (ORDER BY SAL DESC, EMPNO) AS ROW_NUM
FROM SCOTT.EMP;


-- Q16. Rank employees by salary. Equal salaries receive the same rank.
SELECT ENAME, SAL,
       RANK() OVER (ORDER BY SAL DESC) AS SALARY_RANK
FROM SCOTT.EMP;


-- Q17. Rank employees by salary without gaps between ranks.
SELECT ENAME, SAL,
       DENSE_RANK() OVER (ORDER BY SAL DESC) AS DENSE_SALARY_RANK
FROM SCOTT.EMP;


-- Q18. Rank employees separately within each department.
SELECT ENAME, DEPTNO, SAL,
       RANK() OVER (
           PARTITION BY DEPTNO
           ORDER BY SAL DESC
       ) AS DEPT_SALARY_RANK
FROM SCOTT.EMP;


-- Q19. Display the second-highest distinct salary.
WITH SALARY_RANK AS (
    SELECT SAL,
           DENSE_RANK() OVER (ORDER BY SAL DESC) AS RNK
    FROM SCOTT.EMP
)
SELECT DISTINCT SAL
FROM SALARY_RANK
WHERE RNK = 2;


-- Q20. Display the highest-paid employee in each department.
WITH DEPT_RANK AS (
    SELECT ENAME, DEPTNO, SAL,
           ROW_NUMBER() OVER (
               PARTITION BY DEPTNO
               ORDER BY SAL DESC, EMPNO
           ) AS RN
    FROM SCOTT.EMP
)
SELECT ENAME, DEPTNO, SAL
FROM DEPT_RANK
WHERE RN = 1;

