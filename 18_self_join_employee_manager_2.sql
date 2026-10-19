
-- =====================================================
-- SELF JOIN ASSIGNMENT: EMPLOYEE AND MANAGER
-- TABLE: EMP
-- =====================================================

-- Q3. Fetch employee name and salary along with
-- manager name and salary.
SELECT E.ENAME AS EMPLOYEE_NAME,
       E.SAL AS EMPLOYEE_SALARY,
       M.ENAME AS MANAGER_NAME,
       M.SAL AS MANAGER_SALARY
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO;


-- Q4. Fetch employee name, manager name and their
-- department numbers if employee works as CLERK.
SELECT E.ENAME AS EMPLOYEE_NAME,
       M.ENAME AS MANAGER_NAME,
       E.DEPTNO AS EMP_DEPTNO,
       M.DEPTNO AS MANAGER_DEPTNO
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.JOB = 'CLERK';


-- Q5. Fetch employee name and manager name along
-- with their jobs if both have the same designation.
SELECT E.ENAME AS EMPLOYEE_NAME,
       E.JOB AS EMPLOYEE_JOB,
       M.ENAME AS MANAGER_NAME,
       M.JOB AS MANAGER_JOB
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.JOB = M.JOB;


-- Q6. Fetch employee name, salary, manager name and
-- manager salary if manager earns more than employee.
SELECT E.ENAME AS EMPLOYEE_NAME,
       E.SAL AS EMPLOYEE_SALARY,
       M.ENAME AS MANAGER_NAME,
       M.SAL AS MANAGER_SALARY
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.SAL > E.SAL;


-- Q7. Fetch employee name, manager name and
-- manager commission if manager earns commission.
SELECT E.ENAME AS EMPLOYEE_NAME,
       M.ENAME AS MANAGER_NAME,
       M.COMM AS MANAGER_COMMISSION
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.COMM IS NOT NULL;


-- Q8. Fetch employee name and manager designation
-- if manager works in department 10 or 20.
SELECT E.ENAME AS EMPLOYEE_NAME,
       M.JOB AS MANAGER_JOB
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.DEPTNO IN (10, 20);


-- Q9. Fetch manager names and number of employees
-- working directly under each manager.
SELECT M.ENAME AS MANAGER_NAME,
       COUNT(E.EMPNO) AS EMPLOYEE_COUNT
FROM EMP M
JOIN EMP E ON E.MGR = M.EMPNO
GROUP BY M.EMPNO, M.ENAME;


-- Q10. Fetch employee name and hiredate along with
-- manager hiredate if employee was hired before 1982.
SELECT E.ENAME AS EMPLOYEE_NAME,
       E.HIREDATE AS EMPLOYEE_HIREDATE,
       M.HIREDATE AS MANAGER_HIREDATE
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.HIREDATE < DATE '1982-01-01';


-- Q11. Fetch employee name and manager commission
-- if employee is SALESMAN and manager works in dept 30.
SELECT E.ENAME AS EMPLOYEE_NAME,
       M.COMM AS MANAGER_COMMISSION
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.JOB = 'SALESMAN'
AND M.DEPTNO = 30;


-- Q12. Fetch employee name, manager name and their
-- salaries if employee earns more than manager.
SELECT E.ENAME AS EMPLOYEE_NAME,
       E.SAL AS EMPLOYEE_SALARY,
       M.ENAME AS MANAGER_NAME,
       M.SAL AS MANAGER_SALARY
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.SAL > M.SAL;


-- Q13. Fetch employee name and hiredate, manager name
-- and hiredate if manager was hired before employee.
SELECT E.ENAME AS EMPLOYEE_NAME,
       E.HIREDATE AS EMPLOYEE_HIREDATE,
       M.ENAME AS MANAGER_NAME,
       M.HIREDATE AS MANAGER_HIREDATE
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.HIREDATE < E.HIREDATE;


-- Q14. Fetch employee name and manager name
-- if manager is working as an actual MANAGER.
SELECT E.ENAME AS EMPLOYEE_NAME,
       M.ENAME AS MANAGER_NAME
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.JOB = 'MANAGER';


-- Q15. Fetch employee and manager names along with
-- their annual salaries if employee is in dept 10 or 20
-- and manager earns more than employee.
SELECT E.ENAME AS EMPLOYEE_NAME,
       E.SAL * 12 AS EMP_ANNUAL_SALARY,
       M.ENAME AS MANAGER_NAME,
       M.SAL * 12 AS MANAGER_ANNUAL_SALARY
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.DEPTNO IN (10, 20)
AND M.SAL > E.SAL;


-- Q16. Fetch employee name and manager designation
-- for all employees, including employees without managers.
SELECT E.ENAME AS EMPLOYEE_NAME,
       M.JOB AS MANAGER_JOB
FROM EMP E
LEFT JOIN EMP M ON E.MGR = M.EMPNO;


-- Q17. Fetch employee name and manager salary
-- if manager's salary ends with 50.
SELECT E.ENAME AS EMPLOYEE_NAME,
       M.SAL AS MANAGER_SALARY
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE MOD(M.SAL, 100) = 50;


-- Q18. Fetch employee name, manager name and
-- manager's manager name.
SELECT E.ENAME AS EMPLOYEE_NAME,
       M.ENAME AS MANAGER_NAME,
       MM.ENAME AS MANAGERS_MANAGER_NAME
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
LEFT JOIN EMP MM ON M.MGR = MM.EMPNO;





-- =====================================================
-- OVERALL EXPLANATION / IMPORTANT NOTES
-- =====================================================

-- 1. SELF JOIN:
-- Joining the EMP table with itself is called a SELF JOIN.
-- E represents the employee.
-- M represents the employee's manager.
--
-- 2. IMPORTANT JOIN CONDITION:
-- E.MGR = M.EMPNO
-- MGR stores the manager's employee number.
-- EMPNO identifies each employee.
--
-- 3. SAME JOB:
-- E.JOB = M.JOB
-- Finds employees and managers with the same designation.
--
-- 4. SALARY COMPARISON:
-- M.SAL > E.SAL means manager earns more.
-- E.SAL > M.SAL means employee earns more.
--
-- 5. COMMISSION:
-- M.COMM IS NOT NULL finds managers with a recorded
-- commission value.
--
-- 6. DEPARTMENT CONDITION:
-- M.DEPTNO IN (10, 20) means manager works in department
-- 10 or department 20.
--
-- 7. COUNT:
-- COUNT(E.EMPNO) counts employees reporting directly
-- to each manager.
--
-- 8. DATE:
-- DATE '1982-01-01' represents 1 January 1982.
-- E.HIREDATE < DATE '1982-01-01' means hired before 1982.
--
-- 9. ANNUAL SALARY:
-- SAL * 12 calculates annual salary assuming SAL is monthly.
--
-- 10. SALARY ENDS WITH 50:
-- MOD(SAL, 100) = 50 checks whether the last two digits
-- of a numeric salary are 50.
--
-- 11. MANAGER'S MANAGER:
-- E = employee
-- M = employee's manager
-- MM = manager's manager
--
-- 12. INNER JOIN vs LEFT JOIN:
-- JOIN excludes employees who have no manager.
-- LEFT JOIN includes them, with NULL manager information.
-- =====================================================