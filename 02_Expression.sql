-- Q1. WAQTD ANNUAL SAL OF THE EMPS
SELECT SAL * 12
FROM EMP;
-- SAL * 12 = Annual Salary


-- Q2. WAQTD ALL THE DETAILS OF THE EMPS ALONG WITH THEIR ANNUAL SAL
SELECT EMP.*, SAL * 12
FROM EMP;
-- EMP.* = All columns
-- SAL * 12 = Annual Salary


-- Q3. WAQTD NAME OF THE EMPS ALONG WITH 10% HIKE IN THEIR SALARY
SELECT ENAME, SAL + SAL * 0.10
FROM EMP;
-- SAL * 0.10 = 10% of salary
-- SAL + 10% = Salary after 10% hike


-- Q4. WAQTD ALL THE DETAILS OF THE EMPS ALONG WITH 25% DEDUCTION IN THEIR SAL
SELECT EMP.*, SAL * 0.75
FROM EMP;
-- 25% deduction means remaining 75%
-- SAL * 0.75 = Salary after 25% deduction


-- Q5. WAQTD NAME OF THE EMPS ALONG WITH 15% HIKE IN THEIR ANNUAL SAL
SELECT ENAME, SAL * 12 + (SAL * 12 * 0.15)
FROM EMP;
-- SAL * 12 = Annual Salary
-- Annual Salary + 15% = Annual Salary after hike


-- Q6. WAQTD ALL THE DETAILS OF THE EMPS ALONG WITH 25% HIKE IN THEIR SAL
SELECT EMP.*, SAL + SAL * 0.25
FROM EMP;
-- SAL * 0.25 = 25% of salary
-- SAL + 25% = Salary after hike


-- Q7. WAQTD NAME, HIREDATE, DESIGNATION OF THE EMPS
-- ALONG WITH 20% DEDUCTION IN THEIR ANNUAL SAL
SELECT ENAME, HIREDATE, JOB,
       (SAL * 12) - (SAL * 12 * 0.20)
FROM EMP;
-- SAL * 12 = Annual Salary
-- 20% deduction = Annual Salary * 0.20
-- Annual Salary - 20% = Salary after deduction
-- NOTE: Your original query used * 20 instead of * 0.20


-- Q8. WAQTD NAME OF THE EMPS ALONG WITH THEIR HALF YEAR SAL
SELECT ENAME, SAL * 6
FROM EMP;
-- SAL * 6 = 6 months salary


-- Q9. WAQTD NAME, ID AND ANNUAL SAL OF THE EMPS
-- ALONG WITH 2000/- BONUS IN THE ANNUAL SAL
SELECT ENAME, EMPNO, SAL * 12 + 2000
FROM EMP;
-- SAL * 12 = Annual Salary
-- + 2000 = Annual Salary + Bonus


-- Q10. WAQTD ALL THE DETAILS OF THE EMPS
-- ALONG WITH 45% DEDUCTION IN THEIR HALF YEAR SAL
SELECT EMP.*, (SAL * 6) - ((SAL * 6) * 0.45)
FROM EMP;



-- Explanation:
-- * SAL * 6 = Half-year salary
-- * 45% deduction = Half-year salary * 0.45
-- * Half-year salary - 45% = Salary after deduction
-- * Hike       → Salary + Salary * percentage
-- * Deduction  → Salary - Salary * percentage