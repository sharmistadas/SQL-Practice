-- =========================================================
-- FILE 5: DATABASE FUNDAMENTALS AND TABLE DESIGN
-- =========================================================


-- =========================================================
-- PART 1: DATABASE FUNDAMENTALS
-- =========================================================

-- Q1. What is a database?
-- Answer:
-- A database is an organized collection of data.
-- Example: A college database stores student and course details.


-- Q2. What is DBMS?
-- Answer:
-- DBMS stands for Database Management System.
-- It helps users create, store, retrieve, update and delete data.
-- Examples: Oracle Database, MySQL, Microsoft SQL Server.


-- Q3. What is RDBMS?
-- Answer:
-- RDBMS stands for Relational Database Management System.
-- It stores related data in tables made of rows and columns.
-- Examples: Oracle Database, MySQL, PostgreSQL.


-- Q4. What is the difference between DBMS and RDBMS?
-- Answer:
-- DBMS is the general term for database management software.
-- RDBMS organizes data into related tables and supports relationships.
-- RDBMS is a type of DBMS.


-- Q5. What is a table, row and column?
-- Answer:
-- Table: A collection of related records.
-- Row: One complete record.
-- Column: One attribute of a record.


-- =========================================================
-- PART 2: DATA TYPES
-- =========================================================

-- Q6. What are data types?
-- Answer:
-- Data types specify what kind of values a column can store.
-- Examples: NUMBER, VARCHAR2, DATE.


-- Q7. Create a table using different Oracle data types.
CREATE TABLE FUND_STUDENT (
    STUDENT_ID NUMBER(5),
    STUDENT_NAME VARCHAR2(50),
    EMAIL VARCHAR2(100),
    DATE_OF_BIRTH DATE,
    FEES NUMBER(8,2),
    IS_ACTIVE CHAR(1)
);


-- Q8. Insert sample records into the student table.
INSERT INTO FUND_STUDENT
    (STUDENT_ID, STUDENT_NAME, EMAIL, DATE_OF_BIRTH, FEES, IS_ACTIVE)
VALUES
    (101, 'Anita', 'anita@example.com',
     DATE '2002-05-10', 25000.00, 'Y');

INSERT INTO FUND_STUDENT
    (STUDENT_ID, STUDENT_NAME, EMAIL, DATE_OF_BIRTH, FEES, IS_ACTIVE)
VALUES
    (102, 'Rahul', 'rahul@example.com',
     DATE '2001-08-15', 30000.00, 'Y');

INSERT INTO FUND_STUDENT
    (STUDENT_ID, STUDENT_NAME, EMAIL, DATE_OF_BIRTH, FEES, IS_ACTIVE)
VALUES
    (103, 'Priya', NULL,
     DATE '2003-01-20', 22000.00, 'N');

COMMIT;


-- Q9. Display all student records.
SELECT *
FROM FUND_STUDENT;


-- Q10. Display students whose fees are greater than 24000.
SELECT STUDENT_NAME, FEES
FROM FUND_STUDENT
WHERE FEES > 24000;


-- =========================================================
-- PART 3: KEYS AND CONSTRAINTS
-- =========================================================

-- Q11. What is a primary key?
-- Answer:
-- A primary key uniquely identifies each row.
-- It cannot contain duplicate values or NULL values.


-- Q12. What is a foreign key?
-- Answer:
-- A foreign key connects related tables.
-- It references a primary key or eligible unique key
-- in another table.


-- Q13. What are constraints?
-- Answer:
-- Constraints enforce rules on table data.
-- Common constraints: PRIMARY KEY, FOREIGN KEY, UNIQUE,
-- NOT NULL and CHECK.


-- Q14. Create a department table with a primary key.
CREATE TABLE FUND_DEPARTMENT (
    DEPT_ID NUMBER(3),
    DEPT_NAME VARCHAR2(50) NOT NULL,
    LOCATION VARCHAR2(50),
    CONSTRAINT PK_FUND_DEPT PRIMARY KEY (DEPT_ID),
    CONSTRAINT UQ_FUND_DEPT_NAME UNIQUE (DEPT_NAME)
);


-- Q15. Create an employee table with primary and foreign keys.
CREATE TABLE FUND_EMPLOYEE (
    EMP_ID NUMBER(5),
    EMP_NAME VARCHAR2(50) NOT NULL,
    SALARY NUMBER(9,2) CHECK (SALARY >= 0),
    EMAIL VARCHAR2(100) UNIQUE,
    DEPT_ID NUMBER(3),
    CONSTRAINT PK_FUND_EMP PRIMARY KEY (EMP_ID),
    CONSTRAINT FK_FUND_EMP_DEPT
        FOREIGN KEY (DEPT_ID)
        REFERENCES FUND_DEPARTMENT(DEPT_ID)
);


-- Q16. Insert departments first.
INSERT INTO FUND_DEPARTMENT (DEPT_ID, DEPT_NAME, LOCATION)
VALUES (10, 'IT', 'Hyderabad');

INSERT INTO FUND_DEPARTMENT (DEPT_ID, DEPT_NAME, LOCATION)
VALUES (20, 'HR', 'Bhubaneswar');

COMMIT;


-- Q17. Insert employees linked to departments.
INSERT INTO FUND_EMPLOYEE (EMP_ID, EMP_NAME, SALARY, EMAIL, DEPT_ID)
VALUES (1, 'Anita', 35000, 'anita@company.com', 10);

INSERT INTO FUND_EMPLOYEE (EMP_ID, EMP_NAME, SALARY, EMAIL, DEPT_ID)
VALUES (2, 'Rahul', 28000, 'rahul@company.com', 20);

INSERT INTO FUND_EMPLOYEE (EMP_ID, EMP_NAME, SALARY, EMAIL, DEPT_ID)
VALUES (3, 'Priya', 40000, 'priya@company.com', 10);

COMMIT;


-- Q18. Display employee names with their department names.
SELECT E.EMP_NAME, E.SALARY, D.DEPT_NAME, D.LOCATION
FROM FUND_EMPLOYEE E
JOIN FUND_DEPARTMENT D
ON E.DEPT_ID = D.DEPT_ID;


-- =========================================================
-- PART 4: RELATIONSHIPS
-- =========================================================

-- Q19. What is a one-to-one relationship?
-- Answer:
-- One record in Table A relates to one record in Table B.
-- Example: One person and one unique passport record.


-- Q20. What is a one-to-many relationship?
-- Answer:
-- One record in Table A can relate to many records in Table B.
-- Example: One department has many employees.
-- FUND_DEPARTMENT and FUND_EMPLOYEE demonstrate this relationship.


-- Q21. What is a many-to-many relationship?
-- Answer:
-- Many records in Table A can relate to many records in Table B.
-- A junction table is used to represent this relationship.


-- Q22. Create course and enrollment tables to represent
-- a many-to-many relationship between students and courses.
CREATE TABLE FUND_COURSE (
    COURSE_ID NUMBER(5) PRIMARY KEY,
    COURSE_NAME VARCHAR2(50) NOT NULL
);

CREATE TABLE FUND_ENROLLMENT (
    STUDENT_ID NUMBER(5),
    COURSE_ID NUMBER(5),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT PK_FUND_ENROLLMENT
        PRIMARY KEY (STUDENT_ID, COURSE_ID),
    CONSTRAINT FK_FUND_ENROLL_STUDENT
        FOREIGN KEY (STUDENT_ID)
        REFERENCES FUND_STUDENT(STUDENT_ID),
    CONSTRAINT FK_FUND_ENROLL_COURSE
        FOREIGN KEY (COURSE_ID)
        REFERENCES FUND_COURSE(COURSE_ID)
);


-- Q23. Insert courses and student enrollments.
INSERT INTO FUND_COURSE (COURSE_ID, COURSE_NAME)
VALUES (501, 'Python');

INSERT INTO FUND_COURSE (COURSE_ID, COURSE_NAME)
VALUES (502, 'SQL');

INSERT INTO FUND_ENROLLMENT (STUDENT_ID, COURSE_ID)
VALUES (101, 501);

INSERT INTO FUND_ENROLLMENT (STUDENT_ID, COURSE_ID)
VALUES (101, 502);

INSERT INTO FUND_ENROLLMENT (STUDENT_ID, COURSE_ID)
VALUES (102, 501);

COMMIT;


-- Q24. Display students with their enrolled courses.
SELECT S.STUDENT_NAME, C.COURSE_NAME, E.ENROLL_DATE
FROM FUND_ENROLLMENT E
JOIN FUND_STUDENT S
ON E.STUDENT_ID = S.STUDENT_ID
JOIN FUND_COURSE C
ON E.COURSE_ID = C.COURSE_ID
ORDER BY S.STUDENT_NAME, C.COURSE_NAME;


-- =========================================================
-- PART 5: NORMALIZATION AND TABLE DESIGN
-- =========================================================

-- Q25. What is normalization?
-- Answer:
-- Normalization organizes data into related tables to reduce
-- unnecessary duplication and prevent data anomalies.
--
-- 1NF: Each column contains atomic values; no repeating groups.
-- 2NF: In 1NF, and every non-key attribute depends on the
--      whole candidate key, not just part of it.
-- 3NF: In 2NF, and non-key attributes do not depend
--      transitively on candidate keys.
--
-- Example:
-- Instead of repeating department details for every employee,
-- store department details in FUND_DEPARTMENT and link employees
-- through DEPT_ID.


-- =========================================================
-- EXTRA PRACTICE: VERIFY TABLE DATA
-- =========================================================

SELECT * FROM FUND_STUDENT;
SELECT * FROM FUND_DEPARTMENT;
SELECT * FROM FUND_EMPLOYEE;
SELECT * FROM FUND_COURSE;
SELECT * FROM FUND_ENROLLMENT;

