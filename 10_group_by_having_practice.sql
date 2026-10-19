
-- Q1. Department number and number of employees in each department
-- if there are at least 2 clerks in each department
SELECT DEPTNO, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMP
GROUP BY DEPTNO
HAVING SUM(CASE WHEN JOB = 'CLERK' THEN 1 ELSE 0 END) >= 2;


-- Q2. Department number and total salary in each department
-- if there are at least 4 employees in each department
SELECT DEPTNO, SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) >= 4;


-- Q3. Number of employees earning salary > 1200 in each job
-- where total salary for that job exceeds 3800
SELECT JOB, COUNT(*) AS TOTAL_EMPLOYEES,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
WHERE SAL > 1200
GROUP BY JOB
HAVING SUM(SAL) > 3800;


-- Q4. Department number and number of employees
-- if there are exactly 2 managers in each department
SELECT DEPTNO, COUNT(*) AS TOTAL_MANAGERS
FROM EMP
WHERE JOB = 'MANAGER'
GROUP BY DEPTNO
HAVING COUNT(*) = 2;


-- Q5. Job and maximum salary in each job
-- if maximum salary exceeds 2600
SELECT JOB, MAX(SAL) AS MAX_SALARY
FROM EMP
GROUP BY JOB
HAVING MAX(SAL) > 2600;


-- Q6. Salaries repeated in the EMP table
SELECT SAL, COUNT(*) AS TIMES_REPEATED
FROM EMP
GROUP BY SAL
HAVING COUNT(*) > 1;


-- Q7. Hire dates duplicated in the EMP table
SELECT HIREDATE, COUNT(*) AS TIMES_REPEATED
FROM EMP
GROUP BY HIREDATE
HAVING COUNT(*) > 1;


-- Q8. Average salary of each department
-- if average salary is less than 3000
SELECT DEPTNO, AVG(SAL) AS AVERAGE_SALARY
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) < 3000;


-- Q9. Department numbers with at least 3 employees
-- whose names contain A or S
SELECT DEPTNO, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMP
WHERE ENAME LIKE '%A%'
   OR ENAME LIKE '%S%'
GROUP BY DEPTNO
HAVING COUNT(*) >= 3;


-- Q10. Minimum and maximum salaries of each job
-- if minimum salary > 1000 and maximum salary < 5000
SELECT JOB, MIN(SAL) AS MIN_SALARY,
       MAX(SAL) AS MAX_SALARY
FROM EMP
GROUP BY JOB
HAVING MIN(SAL) > 1000
   AND MAX(SAL) < 5000;















/* ==========================================
   OVERALL EXPLANATION
   ==========================================

GROUP BY
Groups rows with the same department, job, salary or date.

COUNT(*)
Counts the rows in each group.

SUM(SAL)
Calculates the total salary.

AVG(SAL)
Calculates the average salary.

MIN(SAL)
Finds the lowest salary in each group.

MAX(SAL)
Finds the highest salary in each group.

HAVING
Filters groups after GROUP BY.

WHERE
Filters individual rows before GROUP BY.

HAVING COUNT(*) >= 4
Keeps groups with at least 4 rows.

HAVING COUNT(*) = 2
Keeps groups with exactly 2 rows.

HAVING COUNT(*) > 1
Finds values appearing more than once.

CASE WHEN
Counts only rows matching a condition.
In Q1, it counts clerks within each department.

LIKE '%A%' OR LIKE '%S%'
Finds names containing A or S anywhere.

IMPORTANT:
Q3 counts employees with SAL > 1200 within each job,
then checks whether the sum of those qualifying salaries
exceeds 3800. If the intended total is for ALL employees
in each job, the query needs a separate condition.
========================================== */
