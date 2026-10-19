
-- Q1. Names of employees earning more than ADAMS
SELECT ENAME FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ADAMS');

-- Q2. Name and salary of employees earning less than KING
SELECT ENAME, SAL FROM EMP
WHERE SAL < (SELECT SAL FROM EMP WHERE ENAME = 'KING');

-- Q3. Name and department number of employees in the same department as JONES
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JONES');

-- Q4. Name and job of employees with the same designation as JAMES
SELECT ENAME, JOB FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JAMES');

-- Q5. Employee number, name and annual salary greater than WARD's annual salary
SELECT EMPNO, ENAME, SAL*12 AS ANNUAL_SALARY FROM EMP
WHERE SAL*12 > (SELECT SAL*12 FROM EMP WHERE ENAME = 'WARD');

-- Q6. Name and hire date of employees hired before SCOTT
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');

-- Q7. Name and hire date of employees hired after the PRESIDENT
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE JOB = 'PRESIDENT');

-- Q8. Name and salary of employees earning less than employee 7839
SELECT ENAME, SAL FROM EMP
WHERE SAL < (SELECT SAL FROM EMP WHERE EMPNO = 7839);

-- Q9. Details of employees hired before MILLER
SELECT * FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');

-- Q10. Name and employee number of employees earning more than ALLEN
SELECT ENAME, EMPNO FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');

-- Q11. Name and salary of employees earning more than MILLER but less than ALLEN
SELECT ENAME, SAL FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'MILLER')
AND SAL < (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');

-- Q12. Details of employees in department 20 with the same job as SMITH
SELECT * FROM EMP
WHERE DEPTNO = 20
AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SMITH');

-- Q13. Details of managers in the same department as TURNER
SELECT * FROM EMP
WHERE JOB = 'MANAGER'
AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'TURNER');

-- Q14. Name and hire date of employees hired after 1980 but before KING
SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE >= DATE '1981-01-01'
AND HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'KING');

-- Q15. Name, salary and annual salary of employees earning less than BLAKE but more than 3500
SELECT ENAME, SAL, SAL*12 AS ANNUAL_SALARY FROM EMP
WHERE SAL < (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE')
AND SAL > 3500;

-- Q16. Details of employees earning more than SCOTT but less than KING
SELECT * FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT')
AND SAL < (SELECT SAL FROM EMP WHERE ENAME = 'KING');

-- Q17. Names starting with A and working in the same department as BLAKE
SELECT ENAME FROM EMP
WHERE ENAME LIKE 'A%'
AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');

-- Q18. Name and commission of employees who earn commission and have the same job as SMITH
SELECT ENAME, COMM FROM EMP
WHERE COMM IS NOT NULL
AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SMITH');

-- Q19. Details of clerks in the same department as TURNER
SELECT * FROM EMP
WHERE JOB = 'CLERK'
AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'TURNER');

-- Q20. Name, salary and job of employees whose annual salary is more than SMITH's and less than KING's
SELECT ENAME, SAL, JOB FROM EMP
WHERE SAL*12 > (SELECT SAL*12 FROM EMP WHERE ENAME = 'SMITH')
AND SAL*12 < (SELECT SAL*12 FROM EMP WHERE ENAME = 'KING');




/* ==========================================
   OVERALL EXPLANATION
   ==========================================

1. SUBQUERY
   A query written inside another query.
   Example:
   WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='ADAMS')

2. SINGLE-ROW SUBQUERY
   Returns one value, such as one employee's salary,
   department, job or hire date.

3. COMPARISON OPERATORS
   >  Greater than
   <  Less than
   =  Equal to
   >= Greater than or equal to
   <= Less than or equal to

4. SAME DEPARTMENT
   Compare DEPTNO with the department returned
   by the inner query.

5. SAME DESIGNATION
   Compare JOB with the job returned by the inner query.

6. HIRED BEFORE / AFTER
   Compare HIREDATE with the employee's hire date.

7. ANNUAL SALARY
   SAL * 12 calculates annual salary.

8. LIKE 'A%'
   Finds employee names starting with A.

9. COMM IS NOT NULL
   Finds employees whose commission is recorded.

10. AND
    Both conditions must be true.

IMPORTANT:
In the standard Oracle EMP table, employee names such as
ADAMS, KING, JONES, JAMES, WARD, SCOTT, MILLER, ALLEN,
BLAKE, SMITH and TURNER are expected to identify one row.

If a name or job subquery returns multiple rows, Oracle
may report ORA-01427. Use IN, ANY or ALL when multiple
matching values are possible.
========================================== */