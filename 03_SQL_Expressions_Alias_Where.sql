
-- ============================================================
-- TOPIC: SQL EXPRESSIONS + ALIAS + WHERE CONDITION
-- ============================================================


-- Q1. WAQTD all the details of the employees along with their annual salary.
-- Give alias name "ANNUAL SALARY" to the annual salary expression.

SELECT EMP.*, SAL * 12 AS "ANNUAL SALARY"
FROM EMP;


-- Q2. WAQTD ENAME, HIREDATE, JOB of the employees along with 25% hike
-- in their salary. Give alias name "HIKE SALARY" to the expression.

SELECT ENAME, HIREDATE, JOB,
       SAL + (SAL * 0.25) AS "HIKE SALARY"
FROM EMP;


-- Q3. WAQTD all the details of the employees along with their annual salary
-- if the employees are working as MANAGER.

SELECT EMP.*, SAL * 12 AS "ANNUAL SALARY"
FROM EMP
WHERE JOB = 'MANAGER';


-- Q4. WAQTD ENAME, HIREDATE, JOB and DEPTNO
-- of the employees working in DEPTNO 30.

SELECT ENAME, HIREDATE, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 30;


-- Q5. WAQTD ENAME and half-term salary along with 25% hike
-- in their half-term salary if the employees are hired after 1981.

SELECT ENAME,
       (SAL * 6) + ((SAL * 6) * 0.25) AS "HIKE HALF TERM SALARY"
FROM EMP
WHERE HIREDATE > '31-DEC-1981';


-- Q6. WAQTD all the details of the employees along with 2000 bonus
-- added to their salary if the employees are earning less than 2000.

SELECT EMP.*, SAL + 2000 AS "TOTAL SALARY"
FROM EMP
WHERE SAL < 2000;


-- Q7. WAQTD ENAME, EMPNO and HIREDATE
-- of the employees who were hired before 1984.

SELECT ENAME, EMPNO, HIREDATE
FROM EMP
WHERE HIREDATE < '01-JAN-1984';


-- Q8. WAQTD ENAME of the employees along with their annual salary.

SELECT ENAME, SAL * 12 AS "ANNUAL SALARY"
FROM EMP;


-- Q9. WAQTD ENAME and JOB along with their half-term salary.

SELECT ENAME, JOB, SAL * 6 AS "HALF TERM SALARY"
FROM EMP;


-- Q10. WAQTD all the details of the employees along with an annual bonus of 2000.

SELECT EMP.*, (SAL * 12) + 2000 AS "ANNUAL SALARY WITH BONUS"
FROM EMP;


-- Q11. WAQTD name, salary and salary with a hike of 10%.

SELECT ENAME, SAL, SAL + (SAL * 0.10) AS HIKE_SAL
FROM EMP;


-- Q12. WAQTD name and salary with deduction of 25%.

SELECT ENAME, SAL - (SAL * 0.25) AS DEDUCTED_SAL
FROM EMP;


-- Q13. WAQTD name and salary with monthly hike of 50.

SELECT ENAME, SAL + 50 AS HIKE_SAL
FROM EMP;


-- Q14. WAQTD name and annual salary with deduction of 10%.

SELECT ENAME,
       (SAL * 12) - ((SAL * 12) * 0.10) AS DEDUCTED_ANNUAL_SAL
FROM EMP;


-- Q15. WAQTD name and designation along with 100 penalty in salary.

SELECT ENAME, JOB, SAL - 100 AS PENALTY_SAL
FROM EMP;


-- ============================================================
-- ALIAS
-- ============================================================

-- Alias is used to give a temporary name to a column
-- or an expression in the output.

-- AS is used to assign an alias.

SELECT SAL * 12 AS ANNUAL_SALARY
FROM EMP;


-- If alias contains spaces, use double quotes.

SELECT SAL * 12 AS "ANNUAL SALARY"
FROM EMP;


-- ============================================================
-- WHERE CONDITION
-- ============================================================

-- WHERE is used to filter records.


-- Employees working as MANAGER

SELECT *
FROM EMP
WHERE JOB = 'MANAGER';


-- Employees working in department 30

SELECT *
FROM EMP
WHERE DEPTNO = 30;


-- Employees earning less than 2000

SELECT *
FROM EMP
WHERE SAL < 2000;


-- Employees hired before 1984

SELECT *
FROM EMP
WHERE HIREDATE < '01-JAN-1984';


-- ============================================================
-- IMPORTANT ARITHMETIC OPERATORS
-- ============================================================

-- Addition          +
-- Subtraction       -
-- Multiplication    *
-- Division          /
-- Modulus           %        -- depends on SQL database


-- ============================================================
-- IMPORTANT EXPRESSIONS
-- ============================================================


-- Annual salary

SAL * 12;


-- Half-term salary

SAL * 6;


-- 25% of salary

SAL * 0.25;


-- Salary + 25% hike

SAL + (SAL * 0.25);


-- Salary + 2000 bonus

SAL + 2000;


-- Salary - 25% deduction

SAL - (SAL * 0.25);


-- Salary + 50 hike

SAL + 50;


-- Annual salary with 10% deduction

(SAL * 12) - ((SAL * 12) * 0.10);


-- Salary - 100 penalty

SAL - 100;
```