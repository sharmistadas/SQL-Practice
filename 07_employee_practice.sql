
-- Q1. Name and annual salary
SELECT ENAME, SAL*12 AS ANNUAL_SALARY FROM EMP;

-- Q2. Salary greater than 2000 and less than 3500
SELECT * FROM EMP WHERE SAL > 2000 AND SAL < 3500;

-- Q3. Name and salary that are not repeated
SELECT ENAME, SAL FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP GROUP BY SAL HAVING COUNT(*)=1);

-- Q4. Details with 43% hike and hike salary > 7000
SELECT EMP.*, SAL*1.43 AS HIKE_SALARY FROM EMP
WHERE SAL*1.43 > 7000;

-- Q5. Annual salary with 2-month bonus and given ranges
SELECT EMP.*, SAL*14 AS ANNUAL_BONUS_SAL FROM EMP
WHERE SAL*14 BETWEEN 5000 AND 10000
AND SAL BETWEEN 2000 AND 3000;

-- Q6. Non-duplicate employee records
SELECT DISTINCT * FROM EMP;

-- Q7. Analyst in dept 10 OR manager in dept 20; name ends with N
SELECT ENAME FROM EMP
WHERE ((JOB='ANALYST' AND DEPTNO=10)
OR (JOB='MANAGER' AND DEPTNO=20))
AND ENAME LIKE '%N';

-- Q8. Names not starting with vowels
SELECT ENAME FROM EMP
WHERE ENAME NOT LIKE 'A%' AND ENAME NOT LIKE 'E%'
AND ENAME NOT LIKE 'I%' AND ENAME NOT LIKE 'O%'
AND ENAME NOT LIKE 'U%';

-- Q9. Name and salary with more than 3 salary digits
SELECT ENAME, SAL FROM EMP
WHERE LENGTH(TO_CHAR(TRUNC(SAL))) > 3;

-- Q10. Hired in January and name does not contain K
SELECT ENAME, HIREDATE FROM EMP
WHERE TO_CHAR(HIREDATE,'MM')='01'
AND ENAME NOT LIKE '%K%';

-- Q11. Employees receiving salary but no commission
SELECT * FROM EMP
WHERE SAL IS NOT NULL AND COMM IS NULL;

-- Q12. Names starting with consonants
SELECT ENAME FROM EMP
WHERE SUBSTR(ENAME,1,1) NOT IN ('A','E','I','O','U');

-- Q13. Names containing consecutive LL
SELECT ENAME FROM EMP WHERE ENAME LIKE '%LL%';

-- Q14. Employees without commission in dept 20
SELECT * FROM EMP
WHERE COMM IS NULL AND DEPTNO=20;

-- Q15. Employees without a reporting manager
SELECT * FROM EMP WHERE MGR IS NULL;

-- Q16. Commission NULL and job is clerk or manager
SELECT * FROM EMP
WHERE COMM IS NULL AND (JOB='CLERK' OR JOB='MANAGER');

-- Q17. Names starting with M, J or A
SELECT ENAME FROM EMP
WHERE ENAME LIKE 'M%' OR ENAME LIKE 'J%' OR ENAME LIKE 'A%';

-- Q18. Employees earning commission
SELECT ENAME, SAL FROM EMP WHERE COMM IS NOT NULL;

-- Q19. Not hired in 1987; working as salesman or manager
SELECT EMPNO, ENAME, SAL FROM EMP
WHERE (HIREDATE < DATE '1987-01-01'
OR HIREDATE >= DATE '1988-01-01')
AND JOB IN ('SALESMAN','MANAGER');

-- Q20. Combined conditions
SELECT EMP.*, SAL*12 AS ANNUAL_SALARY FROM EMP
WHERE SAL IS NOT NULL AND COMM IS NULL
AND HIREDATE >= DATE '1999-01-01'
AND HIREDATE < DATE '2006-01-01'
AND NOT (HIREDATE >= DATE '2004-01-01'
AND HIREDATE < DATE '2005-01-01')
AND SAL BETWEEN 999 AND 2999
AND SAL*12 BETWEEN 8000 AND 15000
AND ((JOB='CLERK' AND DEPTNO=20)
OR (JOB='MANAGER' AND DEPTNO IN (20,30)))
AND SUBSTR(ENAME,-2,1) NOT IN ('A','E','I','O','U');















/* ==========================================
   OVERALL EXPLANATION
   ==========================================

1. SELECT
   Displays the columns we want.

2. *
   Displays all columns.

3. WHERE
   Filters rows based on a condition.

4. AND
   All connected conditions must be true.

5. OR
   At least one condition must be true.

6. IN
   Matches any value in a list.
   Example: JOB IN ('CLERK','MANAGER')

7. NOT IN
   Excludes values in a list.

8. BETWEEN
   Includes both boundary values.
   Example: SAL BETWEEN 1000 AND 3000

9. LIKE 'A%'
   Name starts with A.

10. LIKE '%N'
    Name ends with N.

11. LIKE '%K%'
    Name contains K.

12. LIKE '%LL%'
    Name contains consecutive LL.

13. IS NULL
    Checks for a missing value.

14. IS NOT NULL
    Checks for a value that is not NULL.

15. DISTINCT
    Removes duplicate result rows.

16. GROUP BY + HAVING COUNT(*)=1
    Finds salary values appearing only once.

17. SAL*12
    Calculates annual salary.

18. SAL*14
    Calculates annual salary plus two months' salary.

19. SAL*1.43
    Calculates salary after a 43% hike.

20. TO_CHAR(HIREDATE,'MM')
    Extracts the month number from a date.

21. SUBSTR(ENAME,1,1)
    Extracts the first character of a name.

22. SUBSTR(ENAME,-2,1)
    Extracts the second-last character.

23. LENGTH()
    Counts characters in a value.

24. TRUNC(SAL)
    Removes the decimal part of salary.

25. DATE 'YYYY-MM-DD'
    Oracle date literal used for date comparisons.



==========================================
IMPORTANT NOTES
==========================================

Q5: The conditions conflict. SAL between 2000 and 3000
means SAL*14 is between 28000 and 42000, so it cannot
also be between 5000 and 10000. The query returns no rows.

Q6: DISTINCT removes duplicate complete rows from the
result. If EMPNO is unique, the normal EMP table records
will already be distinct.

Q8 and Q12: These examples treat A, E, I, O, U as vowels.
They assume employee names are stored in uppercase.

Q19: Parentheses are important so the job condition applies
to both date conditions.

Q20: The job condition means clerks in department 20 OR
managers in departments 20 and 30. All other conditions
must also be satisfied. */
