/*
============================================================
SQL MOCK PRACTICE: 40 QUESTIONS WITH ANSWERS & EXPLANATIONS
Tables: EMP and DEPT | Oracle SQL
EMP: EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
DEPT: DEPTNO, DNAME, LOC
============================================================

Q1. Employee, manager and department; hired 1981-1982,
salary > 1800, manager contains A, department not S%.
*/
SELECT e.ename, m.ename AS manager, d.dname
FROM emp e JOIN emp m ON e.mgr=m.empno
JOIN dept d ON e.deptno=d.deptno
WHERE e.hiredate >= DATE '1981-01-01'
AND e.hiredate < DATE '1983-01-01'
AND e.sal>1800 AND UPPER(m.ename) LIKE '%A%'
AND UPPER(d.dname) NOT LIKE 'S%';
-- Explanation: Self join finds manager; joins find department.

/* Q2. All departments, including empty departments. */
SELECT d.dname, NVL(e.ename,'No Employees') AS employee
FROM dept d LEFT JOIN emp e ON d.deptno=e.deptno;
-- LEFT JOIN preserves departments with no matching employees.

/* Q3. Employees earning above their department average. */
SELECT e.ename,e.sal,d.dname
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE e.sal>(SELECT AVG(sal) FROM emp x
             WHERE x.deptno=e.deptno);
-- Correlated subquery calculates the average for each department.

/* Q4. Same as Q3. */
SELECT e.ename,e.sal,d.dname
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE e.sal>(SELECT AVG(sal) FROM emp x
             WHERE x.deptno=e.deptno);

/* Q5. Same job as SMITH, department as JONES, salary > SCOTT. */
SELECT * FROM emp
WHERE job=(SELECT job FROM emp WHERE ename='SMITH')
AND deptno=(SELECT deptno FROM emp WHERE ename='JONES')
AND sal>(SELECT sal FROM emp WHERE ename='SCOTT');
-- Scalar subqueries fetch comparison values.

/* Q6. 5th, 7th, 9th minimum distinct salaries. */
SELECT sal,salary_rank FROM
(SELECT DISTINCT sal,DENSE_RANK() OVER(ORDER BY sal) salary_rank
 FROM emp)
WHERE salary_rank IN(5,7,9);
-- DENSE_RANK ranks distinct salary values.

/* Q7. Department, hire date, even salary, commission status. */
SELECT d.dname,e.hiredate,
CASE WHEN e.comm IS NOT NULL THEN 'Old Employee'
ELSE 'New Employee' END AS status
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE MOD(e.sal,2)=0;
-- MOD(sal,2)=0 means even salary; non-NULL commission means old.

/* Q8. String functions and floor values. */
SELECT UPPER('nikhiLESH'),LOWER('PAYAL'),
INITCAP('AARADHYA'),FLOOR(44.9),FLOOR(98.5),
FLOOR(43.3),FLOOR(56.7),FLOOR(34.2) FROM dual;
-- UPPER/LOWER change case; INITCAP capitalizes words; FLOOR rounds down.
-- Reverse a string in Oracle using the method shown in Q30.

/* Q9. Employee, manager and both departments; employee dept has vowel.
Sort by manager's manager department. */
SELECT e.ename,de.dname,m.ename,dm.dname,dgm.dname
FROM emp e JOIN dept de ON e.deptno=de.deptno
JOIN emp m ON e.mgr=m.empno
JOIN dept dm ON m.deptno=dm.deptno
LEFT JOIN emp gm ON m.mgr=gm.empno
LEFT JOIN dept dgm ON gm.deptno=dgm.deptno
WHERE REGEXP_LIKE(UPPER(de.dname),'[AEIOU]')
ORDER BY dgm.dname;
-- REGEXP_LIKE checks for at least one vowel.

/* Q10. Employees reporting to BLAKE's manager; exactly one A. */
SELECT * FROM emp
WHERE mgr=(SELECT mgr FROM emp WHERE ename='BLAKE')
AND LENGTH(UPPER(ename))-LENGTH(REPLACE(UPPER(ename),'A',''))=1;
-- Removing A and comparing lengths counts A characters.

/* Q11. Employees in Chicago; manager has at least 3 reports. */
SELECT e.ename,d.dname,d.loc,m.hiredate AS manager_hiredate
FROM emp e JOIN dept d ON e.deptno=d.deptno
JOIN emp m ON e.mgr=m.empno
WHERE UPPER(d.loc)='CHICAGO'
AND e.mgr IN(SELECT mgr FROM emp WHERE mgr IS NOT NULL
GROUP BY mgr HAVING COUNT(*)>=3);
-- GROUP BY/HAVING identifies managers with at least 3 reports.

/* Q12. Count M in job; initial-cap name and lowercase job. */
SELECT ename,INITCAP(ename),LOWER(job),
LENGTH(UPPER(job))-LENGTH(REPLACE(UPPER(job),'M','')) AS m_count
FROM emp;
-- Difference in lengths counts M.

/* Q13. Remove L from names of odd-salary employees; total salary. */
SELECT REPLACE(ename,'L','') AS changed_name,sal
FROM emp WHERE MOD(sal,2)=1;
SELECT SUM(sal) AS total_salary FROM emp WHERE MOD(sal,2)=1;
-- MOD(...,2)=1 finds odd salaries.

/* Q14. Department average salary > 4000. */
SELECT deptno,AVG(sal) FROM emp
GROUP BY deptno HAVING AVG(sal)>4000;
-- HAVING filters groups after aggregation.

/* Q15. Annual salary 30000; exclude clerks. */
SELECT e.ename,e.job,e.sal*12 AS annual_sal,e.deptno,d.dname
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE e.sal*12=30000 AND UPPER(e.job)<>'CLERK';
-- Monthly salary multiplied by 12 gives annual salary.

/* Q16. Department of minimum-paid employee with no manager. */
SELECT d.dname FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE e.sal=(SELECT MIN(sal) FROM emp) AND e.mgr IS NULL;
-- Finds global minimum salary, then checks manager is NULL.

/* Q17. Same as Q1 but without manager-name/department filters. */
SELECT e.ename,m.ename AS manager,d.dname
FROM emp e JOIN emp m ON e.mgr=m.empno
JOIN dept d ON e.deptno=d.deptno
WHERE e.hiredate>=DATE '1981-01-01'
AND e.hiredate<DATE '1983-01-01' AND e.sal>1800;

/* Q18. Department total salary > 3000; department contains L. */
SELECT d.dname,SUM(e.sal) AS total_salary
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE UPPER(d.dname) LIKE '%L%'
GROUP BY d.dname HAVING SUM(e.sal)>3000;
-- WHERE filters rows; HAVING filters the grouped total.

/* Q19. Same as Q5. */
SELECT * FROM emp
WHERE job=(SELECT job FROM emp WHERE ename='SMITH')
AND deptno=(SELECT deptno FROM emp WHERE ename='JONES')
AND sal>(SELECT sal FROM emp WHERE ename='SCOTT');

/* Q20. Highest and second-highest distinct salary in each department. */
SELECT deptno,ename,sal,salary_rank FROM
(SELECT deptno,ename,sal,DENSE_RANK() OVER
(PARTITION BY deptno ORDER BY sal DESC) salary_rank FROM emp)
WHERE salary_rank IN(1,2) ORDER BY deptno,salary_rank;
-- PARTITION BY restarts salary ranking for each department.

/* Q21. Maximum and minimum salary in one row. */
SELECT MAX(sal) AS maximum_salary,MIN(sal) AS minimum_salary
FROM emp;
-- Aggregate functions return both values in one row.

/* Q22. Employee and manager departments; employee department has vowel. */
SELECT e.ename,de.dname,m.ename,dm.dname
FROM emp e JOIN dept de ON e.deptno=de.deptno
JOIN emp m ON e.mgr=m.empno
JOIN dept dm ON m.deptno=dm.deptno
WHERE REGEXP_LIKE(UPPER(de.dname),'[AEIOU]')
ORDER BY e.ename;

/* Q23. Same as Q15. */
SELECT e.ename,e.job,e.sal*12 AS annual_sal,e.deptno,d.dname
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE e.sal*12=30000 AND UPPER(e.job)<>'CLERK';

/* Q24. Employee and manager departments; sort by employee department. */
SELECT e.ename,de.dname,m.ename,dm.dname
FROM emp e JOIN dept de ON e.deptno=de.deptno
JOIN emp m ON e.mgr=m.empno
JOIN dept dm ON m.deptno=dm.deptno
WHERE REGEXP_LIKE(UPPER(de.dname),'[AEIOU]')
ORDER BY de.dname;

/* Q25. Odd salaries; remove A from employee names. */
SELECT REPLACE(UPPER(ename),'A','') AS changed_name,sal
FROM emp WHERE MOD(sal,2)=1;

/* Q26. Max salary < 4500 and min salary > 5000. */
SELECT job,MAX(sal),MIN(sal) FROM emp
GROUP BY job HAVING MIN(sal)>5000 AND MAX(sal)<4500;
-- Impossible conditions: minimum cannot be greater than maximum.

/* Q27. Clerks hired before at least one salesman. */
SELECT * FROM emp e
WHERE UPPER(e.job)='CLERK'
AND EXISTS(SELECT 1 FROM emp s
WHERE UPPER(s.job)='SALESMAN' AND e.hiredate<s.hiredate);
-- EXISTS tests whether at least one matching row exists.

/* Q28. Departments for SMITH, KING, MILLER; count name characters. */
SELECT e.ename,d.dname,LENGTH(e.ename) AS name_length
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE UPPER(e.ename) IN('SMITH','KING','MILLER');

/* Q29. No commission, department 20 or 30. */
SELECT e.ename,e.job,d.dname
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE e.deptno IN(20,30) AND e.comm IS NULL;

/* Q30. String conversions and reverse THEHASEEN. */
SELECT UPPER('satyaSAI'),LOWER('PAYAL'),INITCAP('AARADHYA')
FROM dual;
SELECT LISTAGG(SUBSTR('THEHASEEN',LEVEL,1),'')
WITHIN GROUP(ORDER BY LEVEL DESC) AS reversed_string
FROM dual CONNECT BY LEVEL<=LENGTH('THEHASEEN');
-- CONNECT BY generates one row per character; LISTAGG joins them backward.

/* Q31. 1980-1985, salary > 1500, manager starts N,
department does not start A. */
SELECT e.ename,m.ename AS manager,d.dname
FROM emp e JOIN emp m ON e.mgr=m.empno
JOIN dept d ON e.deptno=d.deptno
WHERE e.hiredate>=DATE '1980-01-01'
AND e.hiredate<DATE '1986-01-01' AND e.sal>1500
AND UPPER(m.ename) LIKE 'N%'
AND UPPER(d.dname) NOT LIKE 'A%';

/* Q32. Same as Q7. */
SELECT d.dname,e.hiredate,
CASE WHEN e.comm IS NOT NULL THEN 'Old Employee'
ELSE 'New Employee' END AS status
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE MOD(e.sal,2)=0;

/* Q33. 1st, 6th, 9th minimum distinct salaries. */
SELECT sal,salary_rank FROM
(SELECT DISTINCT sal,DENSE_RANK() OVER(ORDER BY sal) salary_rank
FROM emp)
WHERE salary_rank IN(1,6,9);

/* Q34. Name starts and ends with same character; hired today. */
SELECT DISTINCT d.dname
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE UPPER(SUBSTR(e.ename,1,1))=UPPER(SUBSTR(e.ename,-1,1))
AND TRUNC(e.hiredate)=TRUNC(SYSDATE);
-- SYSDATE is current date; TRUNC removes time.

/* Q35. FLOOR values, uppercase, reverse KAJAL, weekday. */
SELECT FLOOR(34.8),FLOOR(67.4),FLOOR(45.4),
FLOOR(55.5),FLOOR(24.2),UPPER('nikhiLESH') FROM dual;
SELECT LISTAGG(SUBSTR('KAJAL',LEVEL,1),'')
WITHIN GROUP(ORDER BY LEVEL DESC)
FROM dual CONNECT BY LEVEL<=LENGTH('KAJAL');
SELECT TO_CHAR(DATE '2003-08-02','FMDay',
'NLS_DATE_LANGUAGE=English') AS weekday FROM dual;

/* Q36. Manager, manager's manager hire date and employee department;
employee has exactly one A; grand-manager job starts MAN;
manager's department location contains LL. */
SELECT m.ename,gm.hiredate AS grand_manager_hiredate,de.dname
FROM emp e JOIN emp m ON e.mgr=m.empno
JOIN dept de ON e.deptno=de.deptno
JOIN emp gm ON m.mgr=gm.empno
JOIN dept dm ON m.deptno=dm.deptno
WHERE LENGTH(UPPER(e.ename))-LENGTH(REPLACE(UPPER(e.ename),'A',''))=1
AND UPPER(gm.job) LIKE 'MAN%' AND UPPER(dm.loc) LIKE '%LL%';
-- Interprets "manager's manager" as the employee's grand-manager.

/* Q37. Count salesmen if total salesman salaries exceed clerk salaries. */
SELECT COUNT(*) AS salesman_count FROM emp
WHERE UPPER(job)='SALESMAN'
AND (SELECT SUM(sal) FROM emp WHERE UPPER(job)='SALESMAN')
>(SELECT SUM(sal) FROM emp WHERE UPPER(job)='CLERK');

/* Q38. Departments with no employees. */
SELECT d.dname FROM dept d
WHERE NOT EXISTS(SELECT 1 FROM emp e WHERE e.deptno=d.deptno);
-- NOT EXISTS finds departments with no matching employee.

/* Q39. MARTIN's manager's manager; show 20% increased salary if name has L. */
SELECT gm.ename,gm.sal AS current_salary,
gm.sal*1.20 AS salary_after_hike
FROM emp martin JOIN emp m ON martin.mgr=m.empno
JOIN emp gm ON m.mgr=gm.empno
WHERE UPPER(martin.ename)='MARTIN'
AND UPPER(gm.ename) LIKE '%L%';
-- Calculates a hike without updating the database.

/* Q40. Department average, maximum, and minimum salary;
average > 400 and minimum > 3000. */
SELECT deptno,AVG(sal) AS average_salary,
MAX(sal) AS maximum_salary,MIN(sal) AS minimum_salary
FROM emp GROUP BY deptno
HAVING AVG(sal)>400 AND MIN(sal)>3000;

/*
FINAL REVISION
JOIN = combine tables
SELF JOIN = employee and manager
LEFT JOIN = preserve unmatched left-side rows
WHERE = filter rows
GROUP BY = create groups
HAVING = filter groups
IN = match a list
EXISTS = check if matching rows exist
IS NULL = test missing value
CASE = conditional output
MOD(sal,2)=0 = even salary
MOD(sal,2)=1 = odd salary
DENSE_RANK = rank without gaps for ties
NVL(value,replacement) = replace NULL
UPPER / LOWER / INITCAP = change letter case
LENGTH = count characters
REPLACE = replace/remove characters
FLOOR = round down
============================================================
*/