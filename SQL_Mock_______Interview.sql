/*

SQL MOCK INTERVIEW 


HOW TO PRACTICE:
1. Read the question.
2. Try answering without seeing the answer.
3. Write the SQL query yourself.
4. Run the query and explain the result.

============================================================
PART 1: SQL THEORY INTERVIEW QUESTIONS
============================================================

Q1. What is SQL?
Ans: SQL stands for Structured Query Language. It is used
to create, retrieve, update and delete database data.

Q2. What is DBMS?
Ans: Database Management System. It manages stored data.

Q3. What is RDBMS?
Ans: Relational Database Management System. It stores data
in related tables made of rows and columns.

Q4. What is a table, row and column?
Ans: Table stores related data; row is one record;
column represents an attribute.

Q5. What is NULL?
Ans: A missing, unknown or unavailable value.
NULL is not the same as zero.

Q6. What is a primary key?
Ans: Uniquely identifies every row; cannot be NULL or duplicate.

Q7. What is a foreign key?
Ans: Connects tables and maintains referential integrity.

Q8. What is a composite key?
Ans: A key made from two or more columns.

Q9. What is a UNIQUE constraint?
Ans: Prevents duplicate key values.

Q10. What is NOT NULL?
Ans: Prevents a column from storing NULL.

Q11. What is a CHECK constraint?
Ans: Enforces a condition, e.g. SALARY >= 0.

Q12. What is normalization?
Ans: Organizes tables to reduce duplication and anomalies.
1NF: Atomic values, no repeating groups.
2NF: No partial dependency on part of a candidate key.
3NF: No inappropriate transitive dependency of non-key attributes.

Q13. What is a view?
Ans: A named query that can be used like a virtual table.

Q14. What is a sequence?
Ans: Generates numeric values, often used for IDs.

Q15. What is an index?
Ans: Can speed up data retrieval, but uses storage and
can add overhead to INSERT, UPDATE and DELETE.

Q16. What is a transaction?
Ans: A logical unit of database work.

Q17. What is a subquery?
Ans: A query written inside another query.

Q18. What is a correlated subquery?
Ans: A subquery that refers to a row from the outer query.

Q19. What is a join?
Ans: Combines related rows from tables.

Q20. What is a CTE?
Ans: A named query defined using WITH for use in a statement.

Q21. What is a window function?
Ans: Calculates values across related rows without
necessarily collapsing rows into one per group.

Q22. What is ACID?
Ans:
Atomicity - transaction completes as a whole or is undone.
Consistency - constraints and rules remain satisfied.
Isolation - concurrent transactions are controlled.
Durability - committed changes persist.

============================================================
PART 2: SQL COMMAND CATEGORIES
============================================================

DDL: CREATE, ALTER, DROP, TRUNCATE
DML: INSERT, UPDATE, DELETE, MERGE
DQL: SELECT
DCL: GRANT, REVOKE
TCL: COMMIT, ROLLBACK, SAVEPOINT

Q23. DELETE vs TRUNCATE?
Ans: DELETE removes selected rows and supports WHERE.
TRUNCATE removes all rows; it is DDL in Oracle.

Q24. DROP vs TRUNCATE?
Ans: DROP removes the object. TRUNCATE retains the table
structure but removes its rows.

Q25. WHERE vs HAVING?
Ans: WHERE filters rows before grouping.
HAVING filters groups after GROUP BY.

Q26. COMMIT vs ROLLBACK?
Ans: COMMIT saves transaction changes permanently.
ROLLBACK undoes applicable uncommitted changes.

============================================================
PART 3: BASIC QUERY WRITING
============================================================

Q27. Display all employees.
SELECT * FROM EMP;

Q28. Display employee names and salaries.
SELECT ENAME, SAL FROM EMP;

Q29. Find employees earning more than 3000.
SELECT ENAME, SAL FROM EMP WHERE SAL > 3000;

Q30. Find employees in department 10.
SELECT ENAME FROM EMP WHERE DEPTNO = 10;

Q31. Find salaries between 1000 and 3000.
SELECT ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 3000;

Q32. Find names starting with S.
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S%';

Q33. Find employees with NULL commission.
SELECT ENAME FROM EMP WHERE COMM IS NULL;

Q34. Find employees in departments 10 and 20.
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (10, 20);

Q35. Sort salaries highest to lowest.
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC;

Q36. Display annual salary.
SELECT ENAME, SAL, SAL * 12 AS ANNUAL_SALARY
FROM EMP;

============================================================
PART 4: AGGREGATE FUNCTIONS
============================================================

Q37. Count employees.
SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM EMP;

Q38. Find maximum salary.
SELECT MAX(SAL) FROM EMP;

Q39. Find minimum salary.
SELECT MIN(SAL) FROM EMP;

Q40. Find average salary.
SELECT AVG(SAL) FROM EMP;

Q41. Find total salary.
SELECT SUM(SAL) FROM EMP;

Q42. Count employees per department.
SELECT DEPTNO, COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DEPTNO;

Q43. Find departments with more than 3 employees.
SELECT DEPTNO, COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3;

Q44. Find average salary per department.
SELECT DEPTNO, AVG(SAL) AS AVG_SALARY
FROM EMP
GROUP BY DEPTNO;

============================================================
PART 5: JOINS
============================================================

Q45. Display employee names with department names.
SELECT E.ENAME, D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

Q46. Find employees working in NEW YORK.
SELECT E.ENAME, D.LOC
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE UPPER(D.LOC) = 'NEW YORK';

Q47. Display employees and their managers.
SELECT E.ENAME AS EMPLOYEE, M.ENAME AS MANAGER
FROM EMP E
LEFT JOIN EMP M ON E.MGR = M.EMPNO;

Q48. Display all departments, including empty departments.
SELECT D.DNAME, E.ENAME
FROM DEPT D
LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO;

Q49. Find departments with no employees.
SELECT D.DEPTNO, D.DNAME
FROM DEPT D
WHERE NOT EXISTS (
    SELECT 1
    FROM EMP E
    WHERE E.DEPTNO = D.DEPTNO
);

Q50. Find employees earning more than their managers.
SELECT E.ENAME, E.SAL, M.ENAME AS MANAGER, M.SAL
FROM EMP E
JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.SAL > M.SAL;

============================================================
PART 6: SUBQUERIES
============================================================

Q51. Employees earning above average salary.
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

Q52. Find the highest-paid employee(s).
SELECT ENAME, SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);

Q53. Find the second-highest distinct salary.
SELECT MAX(SAL) AS SECOND_HIGHEST
FROM EMP
WHERE SAL < (SELECT MAX(SAL) FROM EMP);

Q54. Find the third-highest distinct salary.
SELECT MAX(SAL) AS THIRD_HIGHEST
FROM EMP
WHERE SAL < (
    SELECT MAX(SAL)
    FROM EMP
    WHERE SAL < (SELECT MAX(SAL) FROM EMP)
);

Q55. Earn more than the average salary in department 10.
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (
    SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10
);

Q56. Earn more than their own department's average.
SELECT E.ENAME, E.DEPTNO, E.SAL
FROM EMP E
WHERE E.SAL > (
    SELECT AVG(E2.SAL)
    FROM EMP E2
    WHERE E2.DEPTNO = E.DEPTNO
);

Q57. Find employees earning more than every employee in
department 30.
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL (
    SELECT SAL FROM EMP WHERE DEPTNO = 30
);

============================================================
PART 7: SQL FUNCTIONS
============================================================

CHARACTER FUNCTIONS

Q58. Uppercase names.
SELECT UPPER(ENAME) FROM EMP;

Q59. Lowercase names.
SELECT LOWER(ENAME) FROM EMP;

Q60. Find name length.
SELECT ENAME, LENGTH(ENAME) FROM EMP;

Q61. Display first three characters.
SELECT ENAME, SUBSTR(ENAME, 1, 3) FROM EMP;

Q62. Remove extra spaces from text.
SELECT TRIM('  ORACLE SQL  ') FROM DUAL;

NUMBER FUNCTIONS

Q63. Round salary to nearest hundred.
SELECT ENAME, ROUND(SAL, -2) FROM EMP;

Q64. Remove decimal places without rounding.
SELECT ENAME, TRUNC(SAL) FROM EMP;

Q65. Find remainder after division by 1000.
SELECT ENAME, MOD(SAL, 1000) FROM EMP;

Q66. Find absolute value.
SELECT ABS(-125) FROM DUAL;

DATE FUNCTIONS

Q67. Display current date.
SELECT SYSDATE FROM DUAL;

Q68. Find months since hire date.
SELECT ENAME, MONTHS_BETWEEN(SYSDATE, HIREDATE)
FROM EMP;

Q69. Add six months to hire date.
SELECT ENAME, ADD_MONTHS(HIREDATE, 6)
FROM EMP;

CONVERSION FUNCTIONS

Q70. Format hire date.
SELECT ENAME, TO_CHAR(HIREDATE, 'DD-MON-YYYY')
FROM EMP;

Q71. Convert text into a date.
SELECT TO_DATE('20-10-2026', 'DD-MM-YYYY')
FROM DUAL;

Q72. Convert text into a number.
SELECT TO_NUMBER('1250') FROM DUAL;

NULL FUNCTIONS

Q73. Display NULL commission as zero.
SELECT ENAME, NVL(COMM, 0) FROM EMP;

Q74. Count employees with a non-NULL commission.
SELECT COUNT(COMM) FROM EMP;

Q75. Return the first non-NULL value.
SELECT COALESCE(NULL, NULL, 'AVAILABLE') FROM DUAL;

============================================================
PART 8: CASE, CTE AND WINDOW FUNCTIONS
============================================================

Q76. Categorize salaries.
SELECT ENAME, SAL,
       CASE
           WHEN SAL >= 3000 THEN 'HIGH'
           WHEN SAL >= 1500 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS SALARY_CATEGORY
FROM EMP;

Q77. Use a CTE to find above-average employees.
WITH AVG_SAL AS (
    SELECT AVG(SAL) AS AVG_VALUE FROM EMP
)
SELECT E.ENAME, E.SAL
FROM EMP E
CROSS JOIN AVG_SAL A
WHERE E.SAL > A.AVG_VALUE;

Q78. Assign row numbers by salary.
SELECT ENAME, SAL,
       ROW_NUMBER() OVER (ORDER BY SAL DESC, EMPNO) AS RN
FROM EMP;

Q79. Rank employees by salary.
SELECT ENAME, SAL,
       RANK() OVER (ORDER BY SAL DESC) AS SAL_RANK
FROM EMP;

Q80. Rank without gaps.
SELECT ENAME, SAL,
       DENSE_RANK() OVER (ORDER BY SAL DESC) AS SAL_RANK
FROM EMP;

Q81. Rank within each department.
SELECT ENAME, DEPTNO, SAL,
       RANK() OVER (
           PARTITION BY DEPTNO ORDER BY SAL DESC
       ) AS DEPT_RANK
FROM EMP;

Q82. Find top 3 distinct salary ranks.
SELECT ENAME, SAL, RN
FROM (
    SELECT ENAME, SAL,
           DENSE_RANK() OVER (ORDER BY SAL DESC) RN
    FROM EMP
)
WHERE RN <= 3;

============================================================
PART 9: DML, DDL, VIEWS AND SEQUENCES
============================================================

-- Use your own practice objects for these questions.

Q83. Create a practice table.
CREATE TABLE SQL_DEMO (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(50),
    SALARY NUMBER(10,2)
);

Q84. Insert a record.
INSERT INTO SQL_DEMO VALUES (1, 'ANITA', 25000);

Q85. Update salary.
UPDATE SQL_DEMO SET SALARY = 28000 WHERE ID = 1;

Q86. Delete a record.
DELETE FROM SQL_DEMO WHERE ID = 1;

Q87. Add a column.
ALTER TABLE SQL_DEMO ADD EMAIL VARCHAR2(100);

Q88. Create a view.
CREATE OR REPLACE VIEW SQL_DEMO_VIEW AS
SELECT ID, NAME, SALARY FROM SQL_DEMO;

Q89. Query the view.
SELECT * FROM SQL_DEMO_VIEW;

Q90. Create a sequence.
CREATE SEQUENCE SQL_DEMO_SEQ START WITH 1 INCREMENT BY 1;

Q91. Get next sequence value.
SELECT SQL_DEMO_SEQ.NEXTVAL FROM DUAL;

Q92. Give SELECT permission to another user.
-- Replace OTHER_USERNAME with an actual database username.
-- GRANT SELECT ON SQL_DEMO TO OTHER_USERNAME;

Q93. Remove the permission.
-- REVOKE SELECT ON SQL_DEMO FROM OTHER_USERNAME;

============================================================
PART 10: TRANSACTIONS
============================================================

Q94. Save changes.
COMMIT;

Q95. Undo uncommitted changes.
ROLLBACK;

Q96. Create a savepoint.
SAVEPOINT SP1;

Q97. Roll back to the savepoint.
ROLLBACK TO SP1;

NOTE:
COMMIT makes changes permanent.
ROLLBACK undoes applicable uncommitted changes.
Oracle DDL generally causes implicit commits.

============================================================
PART 11: DATABASE DESIGN
============================================================

Q98. What is a one-to-one relationship?
Ans: One record relates to one record.

Q99. What is a one-to-many relationship?
Ans: One department can have many employees.

Q100. What is a many-to-many relationship?
Ans: Many students can enroll in many courses.
A junction table connects the two tables.

Q101. What is a data type?
Ans: It defines the type of value a column stores.
Oracle examples: NUMBER, VARCHAR2, DATE, CHAR.

Q102. What is referential integrity?
Ans: It ensures foreign-key references remain valid.

Q103. What is a surrogate key?
Ans: An artificial identifier, such as a generated numeric ID.

Q104. What is a natural key?
Ans: A meaningful business value used as an identifier.

============================================================
PART 12: TRICKY INTERVIEW QUESTIONS
============================================================

Q105. Why does COMM = NULL not work?
Ans: Use IS NULL because NULL is not compared using =.

Q106. Can AVG(SAL) be used directly in WHERE?
Ans: Not at the same query level. Use HAVING or a subquery.

Q107. COUNT(*) vs COUNT(COMM)?
Ans: COUNT(*) counts rows. COUNT(COMM) counts non-NULL
commission values.

Q108. IN vs EXISTS?
Ans: IN tests membership in a set. EXISTS tests whether
a subquery returns rows.

Q109. RANK vs DENSE_RANK?
Ans: RANK leaves gaps after ties. DENSE_RANK does not.

Q110. ROW_NUMBER vs RANK?
Ans: ROW_NUMBER assigns unique sequential numbers.
RANK gives equal values the same rank and may leave gaps.

Q111. What is the logical SELECT execution order?
Ans: FROM/JOIN, WHERE, GROUP BY, HAVING, SELECT,
ORDER BY, then row limiting.

Q112. Why use an index?
Ans: It can speed up retrieval but adds storage and
maintenance overhead.

Q113. What is the difference between a view and a table?
Ans: A table stores data. A view stores a query definition
and presents results from underlying data.

Q114. What is the difference between a sequence and a
primary key?
Ans: A sequence generates numbers. A primary key enforces
uniqueness and non-NULL values for its key columns.

============================================================
FINAL REVISION CHECKLIST
============================================================

[ ] SELECT, WHERE, ORDER BY, DISTINCT
[ ] INSERT, UPDATE, DELETE, MERGE
[ ] DDL, DML, DQL, DCL, TCL
[ ] Primary, foreign, unique and composite keys
[ ] Constraints and Oracle data types
[ ] Character, number, date and conversion functions
[ ] NULL functions and aggregate functions
[ ] GROUP BY and HAVING
[ ] INNER, LEFT, RIGHT, FULL, SELF and CROSS JOIN
[ ] Subqueries and correlated subqueries
[ ] EXISTS, NOT EXISTS, ANY, ALL
[ ] Views, sequences and indexes
[ ] COMMIT, ROLLBACK and SAVEPOINT
[ ] CASE, CTE, RANK, DENSE_RANK, ROW_NUMBER
[ ] Normalization and relationships
[ ] Practise writing queries without copying answers

============================================================
END OF SQL MOCK INTERVIEW
============================================================
*/