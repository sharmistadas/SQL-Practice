
/* =====================================================
   PART 1: SUBQUERY PRACTICE
   ===================================================== */

-- Q1. Salary greater than SCOTT
SELECT SAL FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='SCOTT');

-- Q2. Name and hire date before ALLEN
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME='ALLEN');

-- Q3. Clerks in the same department as TURNER
SELECT * FROM EMP
WHERE JOB='CLERK'
AND DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='TURNER');

-- Q4. Details and annual salary greater than WARD's
SELECT EMP.*, SAL*12 AS ANNUAL_SALARY FROM EMP
WHERE SAL*12 > (SELECT SAL*12 FROM EMP WHERE ENAME='WARD');

-- Q5. Salary greater than MILLER but less than ALLEN
SELECT ENAME, SAL FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='MILLER')
AND SAL<(SELECT SAL FROM EMP WHERE ENAME='ALLEN');

-- Q6. Details of employees earning less than employee 7839
SELECT * FROM EMP
WHERE SAL<(SELECT SAL FROM EMP WHERE EMPNO=7839);

-- Q7. Hired after 1980 and before KING
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE>=DATE '1981-01-01'
AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='KING');

-- Q8. Names starting with A in BLAKE's department
SELECT ENAME FROM EMP
WHERE ENAME LIKE 'A%'
AND DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE');

-- Q9. Annual salary greater than SMITH's and less than KING's
SELECT ENAME, SAL, JOB FROM EMP
WHERE SAL*12>(SELECT SAL*12 FROM EMP WHERE ENAME='SMITH')
AND SAL*12<(SELECT SAL*12 FROM EMP WHERE ENAME='KING');

-- Q10. Name and department of employees in JONES's department
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='JONES');

-- Q11. Employees hired after the president
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE JOB='PRESIDENT');

-- Q12. Name and salary greater than SMITH
SELECT ENAME, SAL FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='SMITH');

-- Q13. Employees hired after JONES
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='JONES');

-- Q14. Details of employees in SMITH's department
SELECT * FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH');

-- Q15. Name and salary less than KING
SELECT ENAME, SAL FROM EMP
WHERE SAL<(SELECT SAL FROM EMP WHERE ENAME='KING');

-- Q16. Name and job of employees in MARTIN's department
SELECT ENAME, JOB FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='MARTIN');

-- Q17. Employees hired before BLAKE
SELECT * FROM EMP
WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='BLAKE');

-- Q18. Name, salary and department earning more than TURNER
SELECT ENAME, SAL, DEPTNO FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='TURNER');

-- Q19. Employees hired after CLARK
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='CLARK');

-- Q20. Details of employees in ALLEN's department
SELECT * FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='ALLEN');

-- Q21. Name and salary less than WARD
SELECT ENAME, SAL FROM EMP
WHERE SAL<(SELECT SAL FROM EMP WHERE ENAME='WARD');

-- Q22. Name and job of employees in KING's department
SELECT ENAME, JOB FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='KING');

-- Q23. Employees hired before MILLER
SELECT * FROM EMP
WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');

-- Q24. Name and salary greater than JONES
SELECT ENAME, SAL FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='JONES');

-- Q25. Employees hired after SMITH
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='SMITH');

-- Q26. Name, job and salary less than CLARK
SELECT ENAME, JOB, SAL FROM EMP
WHERE SAL<(SELECT SAL FROM EMP WHERE ENAME='CLARK');

-- Q27. Details of employees in TURNER's department
SELECT * FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='TURNER');

-- Q28. Salary greater than WARD but less than ALLEN
SELECT ENAME, SAL FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='WARD')
AND SAL<(SELECT SAL FROM EMP WHERE ENAME='ALLEN');

-- Q29. Employees hired before KING
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='KING');

-- Q30. Employees earning more than employee 7698
SELECT * FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE EMPNO=7698);

-- Q31. Name, salary and job earning less than employee 7788
SELECT ENAME, SAL, JOB FROM EMP
WHERE SAL<(SELECT SAL FROM EMP WHERE EMPNO=7788);

-- Q32. Name and department of employees in BLAKE's department
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE');

-- Q33. Employees hired after ALLEN
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='ALLEN');

-- Q34. Details of employees earning more than MILLER
SELECT * FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='MILLER');

-- Q35. Name, job and salary less than TURNER
SELECT ENAME, JOB, SAL FROM EMP
WHERE SAL<(SELECT SAL FROM EMP WHERE ENAME='TURNER');

-- Q36. Name and department of employees in CLARK's department
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='CLARK');

-- Q37. Details of employees hired after WARD
SELECT * FROM EMP
WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='WARD');

-- Q38. Salary greater than SMITH but less than JONES
SELECT ENAME, SAL FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='SMITH')
AND SAL<(SELECT SAL FROM EMP WHERE ENAME='JONES');

-- Q39. Employees hired before ALLEN (repeated question)
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='ALLEN');

-- Q40. Details of employees in MILLER's department
SELECT * FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='MILLER');

-- Q41. Salary greater than CLARK but less than KING
SELECT ENAME, JOB, SAL FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='CLARK')
AND SAL<(SELECT SAL FROM EMP WHERE ENAME='KING');






/* =====================================================
   PART 2: AGGREGATE FUNCTIONS
   ===================================================== */

-- Q42. Maximum salary
SELECT MAX(SAL) FROM EMP;

-- Q43. Maximum commission
SELECT MAX(COMM) FROM EMP;

-- Q44. Maximum salary, minimum commission and minimum salary
SELECT MAX(SAL), MIN(COMM), MIN(SAL) FROM EMP;

-- Q45. Maximum salary of salesmen
SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN';

-- Q46. Minimum salary in department 30
SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30;

-- Q47. Total salary of clerks in department 20
SELECT SUM(SAL) FROM EMP
WHERE JOB='CLERK' AND DEPTNO=20;

-- Q48. Number of employees hired in December
SELECT COUNT(*) FROM EMP
WHERE TO_CHAR(HIREDATE,'MM')='12';

-- Q49. Number of departments in EMP
SELECT COUNT(DISTINCT DEPTNO) FROM EMP;

-- Q50. Employees earning below 2000 in department 10
SELECT COUNT(*) FROM EMP
WHERE SAL<2000 AND DEPTNO=10;

-- Q51. Employee count and total salary of presidents
SELECT COUNT(*), SUM(SAL) FROM EMP
WHERE JOB='PRESIDENT';






/* =====================================================
   PART 3: GROUP BY AND HAVING
   ===================================================== */

-- Q52. Number of employees in each department
SELECT DEPTNO, COUNT(*) FROM EMP
GROUP BY DEPTNO;

-- Q53. Minimum salary in each department
SELECT DEPTNO, MIN(SAL) FROM EMP
GROUP BY DEPTNO;

-- Q54. Number of employees earning below 3000 in each job
SELECT JOB, COUNT(*) FROM EMP
WHERE SAL<3000
GROUP BY JOB;

-- Q55. Employee count and maximum salary for selected jobs
SELECT JOB, COUNT(*), MAX(SAL) FROM EMP
WHERE JOB IN ('CLERK','ANALYST','PRESIDENT')
GROUP BY JOB;

-- Q56. Employees in each department except salesmen
SELECT DEPTNO, COUNT(*) FROM EMP
WHERE JOB<>'SALESMAN'
GROUP BY DEPTNO;

-- Q57. Average salary above 2500 in each department
SELECT DEPTNO, AVG(SAL) FROM EMP
WHERE SAL>2500
GROUP BY DEPTNO;

-- Q58. Number of clerks in each department
SELECT DEPTNO, COUNT(*) FROM EMP
WHERE JOB='CLERK'
GROUP BY DEPTNO;

-- Q59. Employees having E in their names in each job
SELECT JOB, COUNT(*) FROM EMP
WHERE ENAME LIKE '%E%'
GROUP BY JOB;

-- Q60. Number of analysts in each department
SELECT DEPTNO, COUNT(*) FROM EMP
WHERE JOB='ANALYST'
GROUP BY DEPTNO;

-- Q61. Presidents, clerks or salesmen earning above 1800
-- counted in each department
SELECT DEPTNO, COUNT(*) FROM EMP
WHERE JOB IN ('PRESIDENT','CLERK','SALESMAN')
AND SAL>1800
GROUP BY DEPTNO;

-- Q62. Employees in departments 20 and 30,
-- only departments having at least 2 employees
SELECT DEPTNO, COUNT(*) FROM EMP
WHERE DEPTNO IN (20,30)
GROUP BY DEPTNO
HAVING COUNT(*)>=2;

-- Q63. Employees in departments 10 and 30,
-- only departments having at least 3 employees
SELECT DEPTNO, COUNT(*) FROM EMP
WHERE DEPTNO IN (10,30)
GROUP BY DEPTNO
HAVING COUNT(*)>=3;

-- Q64. Names of employees in department 20
-- if department 20 has at least 2 employees
SELECT ENAME FROM EMP
WHERE DEPTNO=20
AND (SELECT COUNT(*) FROM EMP WHERE DEPTNO=20)>=2;

-- Q65. Number of employees in each job except salesmen and presidents
SELECT JOB, COUNT(*) FROM EMP
WHERE JOB NOT IN ('SALESMAN','PRESIDENT')
GROUP BY JOB;

-- Q66. Number of employees in each job except analysts,
-- where minimum salary is greater than 1000
SELECT JOB, COUNT(*) FROM EMP
WHERE JOB<>'ANALYST'
GROUP BY JOB
HAVING MIN(SAL)>1000;

-- Q67. Department and total salary where exactly 3 employees work
SELECT DEPTNO, SUM(SAL) FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)=3;

-- Q68. Repeated salaries in each department
SELECT DEPTNO, SAL, COUNT(*) FROM EMP
GROUP BY DEPTNO, SAL
HAVING COUNT(*)>1;

-- Q69. Maximum and minimum salary for each job,
-- minimum > 500 and maximum < 4500
SELECT JOB, MAX(SAL), MIN(SAL) FROM EMP
GROUP BY JOB
HAVING MIN(SAL)>500 AND MAX(SAL)<4500;

-- Q70. Hire dates that are repeated
SELECT HIREDATE, COUNT(*) FROM EMP
GROUP BY HIREDATE
HAVING COUNT(*)>1;

-- Q71. Names in departments with at least 3 employees
-- whose names contain M or S
SELECT ENAME FROM EMP
WHERE DEPTNO IN (
    SELECT DEPTNO FROM EMP
    WHERE ENAME LIKE '%M%' OR ENAME LIKE '%S%'
    GROUP BY DEPTNO
    HAVING COUNT(*)>=3
);






/* =====================================================
   PART 4: ORDER BY
   ===================================================== */

-- Q72. Employee names in ascending order
SELECT ENAME FROM EMP
ORDER BY ENAME ASC;

-- Q73. Jobs in descending order
SELECT JOB FROM EMP
ORDER BY JOB DESC;

-- Q74. Employee details in ascending name order
-- when salary is greater than 2000
SELECT * FROM EMP
WHERE SAL>2000
ORDER BY ENAME ASC;

-- Q75. Name, salary and department 10 or 20; salary ascending
SELECT ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO IN (10,20)
ORDER BY SAL ASC;

-- Q76. Salaries in descending order without column name
SELECT SAL FROM EMP
ORDER BY 1 DESC;

-- Q77. Employee number and department number descending
SELECT EMPNO, DEPTNO FROM EMP
ORDER BY EMPNO DESC, DEPTNO DESC;

-- Q78. Employee details: salary descending, name ascending
SELECT * FROM EMP
ORDER BY SAL DESC, ENAME ASC;

-- Q79. Salaries above 1500 in descending order
SELECT SAL FROM EMP
WHERE SAL>1500
ORDER BY SAL DESC;

-- Q80. Department name and number, department name descending
SELECT DNAME, DEPTNO FROM DEPT
ORDER BY DNAME DESC;






/* =====================================================
   PART 5: SALARY HIKE
   ===================================================== */

-- Q81. Name and salary after monthly hike of 500
SELECT ENAME, SAL, SAL+500 AS NEW_MONTHLY_SALARY
FROM EMP;

-- Q82. All details with annual salary and 25% annual hike
SELECT EMP.*,
       SAL*12 AS ANNUAL_SALARY,
       SAL*12*0.25 AS ANNUAL_HIKE,
       SAL*12*1.25 AS ANNUAL_SALARY_AFTER_HIKE
FROM EMP;








/* =====================================================
   OVERALL EXPLANATION
   =====================================================

SUBQUERY
A query inside another query.
Example:
SAL > (SELECT SAL FROM EMP WHERE ENAME='SCOTT')

AGGREGATE FUNCTIONS
COUNT(*)  : Counts rows.
SUM(SAL)  : Adds salaries.
AVG(SAL)  : Calculates average salary.
MAX(SAL)  : Finds highest salary.
MIN(SAL)  : Finds lowest salary.

GROUP BY
Groups rows with the same department or job.
Example: GROUP BY DEPTNO

HAVING
Filters groups after GROUP BY.
Example: HAVING COUNT(*) >= 3

WHERE
Filters individual rows before grouping.
Example: WHERE SAL > 2500

LIKE
'A%'   : Starts with A.
'%E%'  : Contains E.
'%M%'  : Contains M.
'%S%'  : Contains S.

ORDER BY
ASC  : Ascending order.
DESC : Descending order.
ORDER BY 1 DESC sorts by the first selected column.

SALARY CALCULATIONS
SAL*12       : Annual salary.
SAL+500      : Monthly salary after a 500 hike.
SAL*12*0.25  : Amount of a 25% annual hike.
SAL*12*1.25  : Annual salary after a 25% hike.

DATE FILTER
TO_CHAR(HIREDATE,'MM')='12' finds December hires.

NULL VALUES
COMM IS NULL     : No commission recorded.
COMM IS NOT NULL : Commission recorded.
MAX, MIN, SUM and AVG ignore NULL values.

IMPORTANT:
Q64 assumes you want employee names from department 20
when that department has at least two employees.

Q67 interprets "there are 3 employees" as exactly 3.
Use HAVING COUNT(*)>=3 if you mean at least 3.

Q57 calculates average salary among employees whose
individual salary is greater than 2500.

Q81 displays the calculated salary after adding 500;
it does not update the EMP table.

Q82 displays the annual hike amount and the annual salary
after the 25% increase; it does not update the EMP table.
===================================================== */
