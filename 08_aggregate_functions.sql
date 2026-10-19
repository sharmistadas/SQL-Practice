
-- Q1. Maximum salary of employees
SELECT MAX(SAL) FROM EMP;

-- Q2. Minimum salary of managers
SELECT MIN(SAL) FROM EMP WHERE JOB = 'MANAGER';

-- Q3. Total salary paid to clerks
SELECT SUM(SAL) FROM EMP WHERE JOB = 'CLERK';

-- Q4. Average salary of managers
SELECT AVG(SAL) FROM EMP WHERE JOB = 'MANAGER';

-- Q5. Number of employees working as salesman
SELECT COUNT(*) FROM EMP WHERE JOB = 'SALESMAN';

-- Q6. Number of managers working in each department
SELECT DEPTNO, COUNT(*) FROM EMP
WHERE JOB = 'MANAGER'
GROUP BY DEPTNO;


-- Q7. Number of employees earning salary < 2000 in dept 10
SELECT COUNT(*) FROM EMP
WHERE SAL < 2000 AND DEPTNO = 10;

-- Q8. Total salary paid to clerks
SELECT SUM(SAL) FROM EMP WHERE JOB = 'CLERK';

-- Q9. Average salary of all employees
SELECT AVG(SAL) FROM EMP;

-- Q10. Number of employees whose name starts with A
SELECT COUNT(*) FROM EMP WHERE ENAME LIKE 'A%';

-- Q11. Number of employees working as clerk or manager
SELECT COUNT(*) FROM EMP
WHERE JOB IN ('CLERK', 'MANAGER');

-- Q12. Total salary of employees hired in February
SELECT SUM(SAL) FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM') = '02';

-- Q13. Number of employees reporting to manager 7839
SELECT COUNT(*) FROM EMP WHERE MGR = 7839;

-- Q14. Number of employees earning commission in dept 30
SELECT COUNT(*) FROM EMP
WHERE COMM IS NOT NULL AND DEPTNO = 30;

-- Q15. Average salary, total salary, employee count,
-- and maximum salary of presidents
SELECT AVG(SAL), SUM(SAL), COUNT(*), MAX(SAL)
FROM EMP WHERE JOB = 'PRESIDENT';

-- Q16. Number of employees having A in their names
SELECT COUNT(*) FROM EMP WHERE ENAME LIKE '%A%';

-- Q17. Number of employees and total salary for names
-- containing consecutive LL
SELECT COUNT(*), SUM(SAL) FROM EMP
WHERE ENAME LIKE '%LL%';

-- Q18. Number of distinct departments in EMP
SELECT COUNT(DISTINCT DEPTNO) FROM EMP;

-- Q19. Number of employees having Z in their names
SELECT COUNT(*) FROM EMP WHERE ENAME LIKE '%Z%';

-- Q20. Number of employees having S in their names
SELECT COUNT(*) FROM EMP WHERE ENAME LIKE '%S%';

-- Q21. Total salary paid to clerks in dept 30
SELECT SUM(SAL) FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 30;

-- Q22. Maximum salary of analysts
SELECT MAX(SAL) FROM EMP WHERE JOB = 'ANALYST';

-- Q23. Number of distinct salaries in EMP
SELECT COUNT(DISTINCT SAL) FROM EMP;

-- Q24. Number of distinct jobs in EMP
SELECT COUNT(DISTINCT JOB) FROM EMP;

-- Q25. Average salary of clerks
SELECT AVG(SAL) FROM EMP WHERE JOB = 'CLERK';

-- Q26. Minimum salary of managers or clerks in dept 10
SELECT MIN(SAL) FROM EMP
WHERE DEPTNO = 10 AND JOB IN ('MANAGER', 'CLERK');




/* =========================================
   OVERALL EXPLANATION
   =========================================

MAX(SAL)          : Finds the highest salary.
MIN(SAL)          : Finds the lowest salary.
SUM(SAL)          : Adds salary values.
AVG(SAL)          : Calculates average salary.
COUNT(*)          : Counts matching rows.
COUNT(DISTINCT X) : Counts unique, non-NULL values.
WHERE             : Filters rows before aggregation.
GROUP BY DEPTNO   : Creates one group per department.
LIKE 'A%'         : Name starts with A.
LIKE '%A%'        : Name contains A anywhere.
LIKE '%LL%'       : Name contains consecutive LL.
IS NOT NULL       : Checks that commission is recorded.
TO_CHAR(date,'MM'): Extracts the month number.
IN (...)          : Matches any value in the list.
AND               : Both conditions must be true.
OR                : At least one condition must be true.

IMPORTANT:
COUNT(*) counts rows even when some columns are NULL.
COUNT(COMM) counts only non-NULL commission values.
SUM, AVG, MIN and MAX ignore NULL values.
COUNT(DISTINCT DEPTNO) excludes NULL department values.
GROUP BY displays each department with its manager count.
========================================= */