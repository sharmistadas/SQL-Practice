-- =========================================================
-- FILE 2: SQL FUNCTIONS PRACTICE
-- =========================================================


-- =========================================================
-- PART 1: CHARACTER FUNCTIONS
-- =========================================================

-- Q1. Display employee names in uppercase.
SELECT UPPER(FIRST_NAME) AS UPPER_NAME
FROM HR.EMPLOYEES;


-- Q2. Display employee last names in lowercase.
SELECT LOWER(LAST_NAME) AS LOWER_NAME
FROM HR.EMPLOYEES;


-- Q3. Display the first name and its length.
SELECT FIRST_NAME, LENGTH(FIRST_NAME) AS NAME_LENGTH
FROM HR.EMPLOYEES;


-- Q4. Display the first three characters of each first name.
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 3) AS FIRST_THREE
FROM HR.EMPLOYEES;


-- Q5. Join first name and last name into one full name.
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
FROM HR.EMPLOYEES;


-- Q6. Remove extra spaces from a string.
SELECT TRIM('   ORACLE SQL   ') AS TRIMMED_TEXT
FROM DUAL;


-- =========================================================
-- PART 2: NUMBER FUNCTIONS
-- =========================================================

-- Q7. Round employee salaries to the nearest hundred.
SELECT FIRST_NAME, SALARY, ROUND(SALARY, -2) AS ROUNDED_SALARY
FROM HR.EMPLOYEES;


-- Q8. Display the absolute value of -125.
SELECT ABS(-125) AS ABSOLUTE_VALUE
FROM DUAL;


-- Q9. Display the remainder when salary is divided by 1000.
SELECT FIRST_NAME, SALARY, MOD(SALARY, 1000) AS REMAINDER
FROM HR.EMPLOYEES;


-- Q10. Remove decimal places from salary without rounding.
SELECT FIRST_NAME, SALARY, TRUNC(SALARY) AS TRUNCATED_SALARY
FROM HR.EMPLOYEES;


-- Q11. Increase salary by 10% and round to two decimal places.
SELECT FIRST_NAME, SALARY,
       ROUND(SALARY * 1.10, 2) AS INCREASED_SALARY
FROM HR.EMPLOYEES;


-- =========================================================
-- PART 3: DATE FUNCTIONS
-- =========================================================

-- Q12. Display the current system date.
SELECT SYSDATE AS CURRENT_DATE
FROM DUAL;


-- Q13. Display each employee's hire date and the following day.
SELECT FIRST_NAME, HIRE_DATE, HIRE_DATE + 1 AS NEXT_DAY_DATE
FROM HR.EMPLOYEES;


-- Q14. Calculate the number of months since each employee was hired.
SELECT FIRST_NAME, HIRE_DATE,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 2) AS MONTHS_WORKED
FROM HR.EMPLOYEES;


-- Q15. Find the next Friday from the current date.
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') AS NEXT_FRIDAY
FROM DUAL;


-- Q16. Display hire dates in DD-MON-YYYY format.
SELECT FIRST_NAME,
       TO_CHAR(HIRE_DATE, 'DD-MON-YYYY') AS FORMATTED_HIRE_DATE
FROM HR.EMPLOYEES;


-- =========================================================
-- PART 4: CONVERSION FUNCTIONS
-- =========================================================

-- Q17. Convert a number into formatted text.
SELECT TO_CHAR(1250, '9,999') AS FORMATTED_NUMBER
FROM DUAL;


-- Q18. Convert text into a DATE value.
SELECT TO_DATE('20-10-2026', 'DD-MM-YYYY') AS CONVERTED_DATE
FROM DUAL;


-- Q19. Convert salary into text with two decimal places.
SELECT FIRST_NAME,
       TO_CHAR(SALARY, '999999.00') AS SALARY_AS_TEXT
FROM HR.EMPLOYEES;


-- =========================================================
-- PART 5: NULL-HANDLING FUNCTIONS
-- =========================================================

-- Q20. Display commission as 0 when commission is NULL.
SELECT FIRST_NAME, COMMISSION_PCT,
       NVL(COMMISSION_PCT, 0) AS COMMISSION_VALUE
FROM HR.EMPLOYEES;


-- Q21. Display phone number; if NULL, display email;
-- if both are NULL, display NO CONTACT.
SELECT FIRST_NAME,
       COALESCE(PHONE_NUMBER, EMAIL, 'NO CONTACT') AS CONTACT_DETAILS
FROM HR.EMPLOYEES;


-- Q22. Check whether an employee has a commission.
SELECT FIRST_NAME, COMMISSION_PCT,
       NVL2(COMMISSION_PCT, 'HAS COMMISSION', 'NO COMMISSION')
       AS COMMISSION_STATUS
FROM HR.EMPLOYEES;


-- =========================================================
-- PART 6: GROUP / AGGREGATE FUNCTIONS
-- =========================================================

-- Q23. Count all employees.
SELECT COUNT(*) AS TOTAL_EMPLOYEES
FROM HR.EMPLOYEES;


-- Q24. Display the highest, lowest, average, and total salary.
SELECT MAX(SALARY) AS HIGHEST_SALARY,
       MIN(SALARY) AS LOWEST_SALARY,
       ROUND(AVG(SALARY), 2) AS AVERAGE_SALARY,
       SUM(SALARY) AS TOTAL_SALARY
FROM HR.EMPLOYEES;


-- Q25. Display departments having at least 3 employees.
SELECT DEPARTMENT_ID, COUNT(*) AS TOTAL_EMPLOYEES
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 3
ORDER BY DEPARTMENT_ID;



