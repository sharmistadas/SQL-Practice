
-- =====================================================
-- SQL ASSIGNMENT: HR DATABASE
-- TOPICS: JOINS, GROUP BY, HAVING, SUBQUERIES
-- =====================================================

-- Q1. Display first name, last name and department name
-- of all employees.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- Q2. Display department name and city for all employees.
SELECT D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;


-- Q3. Display first name, last name and job title
-- of all employees.
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE
FROM EMPLOYEES E
JOIN JOBS J
ON E.JOB_ID = J.JOB_ID;


-- Q4. Display first name, job title and salary
-- for employees earning more than 12000.
SELECT E.FIRST_NAME, J.JOB_TITLE, E.SALARY
FROM EMPLOYEES E
JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
WHERE E.SALARY > 12000;


-- Q5. Display department ID, department name and
-- total number of employees in each department.
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME,
       COUNT(E.EMPLOYEE_ID) AS TOTAL_EMPLOYEES
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME;


-- Q6. Display job title and average salary
-- of employees for each job title.
SELECT J.JOB_TITLE, AVG(E.SALARY) AS AVERAGE_SALARY
FROM JOBS J
JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
GROUP BY J.JOB_TITLE;


-- Q7. Display first name, last name and department name
-- for employees whose last name starts with H.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.LAST_NAME LIKE 'H%';


-- Q8. Display country name and region name
-- for countries in the EUROPE region.
SELECT C.COUNTRY_NAME, R.REGION_NAME
FROM COUNTRIES C
JOIN REGIONS R
ON C.REGION_ID = R.REGION_ID
WHERE R.REGION_NAME = 'Europe';


-- Q9. Display all cities and their country names.
SELECT L.CITY, C.COUNTRY_NAME
FROM LOCATIONS L
JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;


-- Q10. Display city and number of departments
-- located there, only if departments have a manager.
SELECT L.CITY,
       COUNT(D.DEPARTMENT_ID) AS TOTAL_DEPARTMENTS
FROM LOCATIONS L
JOIN DEPARTMENTS D
ON L.LOCATION_ID = D.LOCATION_ID
WHERE D.MANAGER_ID IS NOT NULL
GROUP BY L.CITY;


-- Q11. Display department name, manager ID and
-- total money spent on salaries in each department.
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID,
       SUM(E.SALARY) AS TOTAL_SALARY
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, D.MANAGER_ID;


-- Q12. Display department name and number of employees
-- who used to work there (historical employees).
SELECT D.DEPARTMENT_NAME,
       COUNT(DISTINCT JH.EMPLOYEE_ID) AS FORMER_EMPLOYEES
FROM DEPARTMENTS D
JOIN JOB_HISTORY JH
ON D.DEPARTMENT_ID = JH.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;


-- Q13. Display all region names and number of countries
-- in each region.
SELECT R.REGION_NAME,
       COUNT(C.COUNTRY_ID) AS TOTAL_COUNTRIES
FROM REGIONS R
LEFT JOIN COUNTRIES C
ON R.REGION_ID = C.REGION_ID
GROUP BY R.REGION_NAME;


-- Q14. Display country names and number of cities
-- only if a country has more than 3 cities.
SELECT C.COUNTRY_NAME,
       COUNT(DISTINCT L.CITY) AS TOTAL_CITIES
FROM COUNTRIES C
JOIN LOCATIONS L
ON C.COUNTRY_ID = L.COUNTRY_ID
GROUP BY C.COUNTRY_NAME
HAVING COUNT(DISTINCT L.CITY) > 3;


-- Q15. Display job titles where average salary
-- is greater than the overall average salary.
SELECT J.JOB_TITLE, AVG(E.SALARY) AS AVERAGE_SALARY
FROM JOBS J
JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
GROUP BY J.JOB_TITLE
HAVING AVG(E.SALARY) > (
    SELECT AVG(SALARY)
    FROM EMPLOYEES
);



-- =====================================================
-- OVERALL EXPLANATION / IMPORTANT NOTES
-- =====================================================

-- 1. JOIN:
-- Combines related tables using matching columns.
-- Example: E.DEPARTMENT_ID = D.DEPARTMENT_ID
--
-- 2. LEFT JOIN:
-- Returns all rows from the left table, even if
-- there is no matching row in the right table.
-- Useful in Q1 and Q5.
--
-- 3. GROUP BY:
-- Groups rows that share the same value.
-- Used with COUNT(), SUM(), AVG(), MIN() and MAX().
--
-- 4. COUNT():
-- Counts rows or non-NULL values.
-- COUNT(E.EMPLOYEE_ID) counts employees.
--
-- 5. SUM():
-- Calculates the total.
-- SUM(E.SALARY) gives total salary expense.
--
-- 6. AVG():
-- Calculates the average.
-- AVG(E.SALARY) gives average salary.
--
-- 7. WHERE:
-- Filters individual rows before grouping.
-- Example: WHERE E.SALARY > 12000
--
-- 8. HAVING:
-- Filters groups after GROUP BY.
-- Example: HAVING COUNT(*) > 3
--
-- 9. LIKE 'H%':
-- Finds last names starting with H.
-- % represents zero or more characters.
--
-- 10. SUBQUERY:
-- A query inside another query.
-- Q15 compares each job's average salary with
-- the average salary of all employees.
--
-- 11. DISTINCT:
-- Removes duplicate values.
-- Q12 counts each former employee only once per
-- department; Q14 counts distinct city names.
--
-- 12. IMPORTANT:
-- Q12 interprets "used to work there" as employees
-- recorded in JOB_HISTORY.
-- Q10 counts only departments that have a manager.
-- Q5 includes departments with zero employees.
-- =====================================================
