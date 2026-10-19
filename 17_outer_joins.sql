
-- =====================================================
-- ASSIGNMENT: OUTER JOINS
-- DATABASE: ORACLE HR SCHEMA
-- =====================================================

-- Q1. Display first name, last name and department name
-- for all employees, including employees without departments.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- Q2. Display employee ID, first name, last name, job ID
-- and start date from JOB_HISTORY, including employees
-- who have never changed jobs.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME,
       JH.JOB_ID, JH.START_DATE
FROM EMPLOYEES E
LEFT JOIN JOB_HISTORY JH
ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID;


-- Q3. Display first name, last name and department name,
-- including unassigned employees.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- Q4. Display department name and employee first name,
-- including departments without employees.
SELECT D.DEPARTMENT_NAME, E.FIRST_NAME
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;


-- Q5. Display city and department name,
-- including cities without departments.
SELECT L.CITY, D.DEPARTMENT_NAME
FROM LOCATIONS L
LEFT JOIN DEPARTMENTS D
ON L.LOCATION_ID = D.LOCATION_ID;


-- Q6. Display country name and location ID,
-- including countries without registered locations.
SELECT C.COUNTRY_NAME, L.LOCATION_ID
FROM COUNTRIES C
LEFT JOIN LOCATIONS L
ON C.COUNTRY_ID = L.COUNTRY_ID;


-- Q7. Display region name and country name,
-- including regions without countries.
SELECT R.REGION_NAME, C.COUNTRY_NAME
FROM REGIONS R
LEFT JOIN COUNTRIES C
ON R.REGION_ID = C.REGION_ID;


-- Q8. Display department ID and department name
-- for departments with zero current employees.
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID) = 0;


-- Q9. Display first name, last name and department name,
-- including employees without departments and departments
-- without employees.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- Q10. Display department name and average employee salary,
-- including departments without employees.
SELECT D.DEPARTMENT_NAME, AVG(E.SALARY) AS AVERAGE_SALARY
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME;


-- Q11. Display employee first name, last name and number
-- of times the employee has changed jobs, including those
-- who have never changed jobs.
SELECT E.FIRST_NAME, E.LAST_NAME,
       COUNT(JH.EMPLOYEE_ID) AS TIMES_CHANGED_JOBS
FROM EMPLOYEES E
LEFT JOIN JOB_HISTORY JH
ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
GROUP BY E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME;


-- =====================================================
-- OVERALL EXPLANATION / IMPORTANT NOTES
-- =====================================================

-- 1. LEFT JOIN:
-- Returns every row from the LEFT table, plus matching
-- rows from the RIGHT table.
-- If there is no match, right-table columns show NULL.
--
-- Example:
-- EMPLOYEES LEFT JOIN DEPARTMENTS
-- Includes employees without assigned departments.
--
-- 2. RIGHT JOIN:
-- Returns every row from the RIGHT table, plus matching
-- rows from the LEFT table.
-- It can often be rewritten as a LEFT JOIN by reversing
-- the order of the tables.
--
-- 3. FULL OUTER JOIN:
-- Returns all matching and non-matching rows from BOTH
-- tables.
-- Used in Q9 to include employees without departments
-- and departments without employees.
--
-- 4. COUNT():
-- COUNT(column) ignores NULL values.
-- COUNT(E.EMPLOYEE_ID) counts actual employees.
-- COUNT(JH.EMPLOYEE_ID) counts job-history records.
--
-- 5. GROUP BY:
-- Groups rows so aggregate functions can calculate
-- a result for each department or employee.
--
-- 6. HAVING:
-- Filters groups after GROUP BY.
-- HAVING COUNT(E.EMPLOYEE_ID) = 0 finds departments
-- with no current employees.
--
-- 7. AVG():
-- Calculates the average of non-NULL salary values.
-- A department with no employees has AVG(SALARY) = NULL.
--
-- 8. JOB_HISTORY:
-- Stores historical job records for employees.
-- No matching history record means the employee has
-- no recorded job-history entry.
--
-- 9. IMPORTANT DIFFERENCE:
-- LEFT JOIN  = keep all rows from the left table.
-- RIGHT JOIN = keep all rows from the right table.
-- FULL JOIN  = keep all rows from both tables.
--
-- 10. Q11:
-- Counts job-history records as a measure of recorded
-- job changes. This assumes each record represents one
-- previous job assignment.
-- =====================================================