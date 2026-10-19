
-- ============================================================
-- LIBRARY MANAGEMENT SYSTEM - DDL 
-- ============================================================


-- Q1. Create a BRANCH table.

CREATE TABLE BRANCH (
    BRANCH_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    ADDRESS VARCHAR2(200),
    ESTABLISHED_DATE DATE,
    MANAGER_NAME VARCHAR2(100)
);


-- Q2. Create a BOOK table.

CREATE TABLE BOOK (
    TITLE VARCHAR2(200),
    BOOK_ID NUMBER PRIMARY KEY,
    AUTHOR VARCHAR2(100),
    GENRE VARCHAR2(50),
    EDITION VARCHAR2(30),
    PRICE NUMBER(10,2),
    BRANCH_ID NUMBER
);


-- Q3. Create a BORROW_RECORD table.

CREATE TABLE BORROW_RECORD (
    RECORD_ID NUMBER PRIMARY KEY,
    MEMBER_ID NUMBER,
    BOOK_ID NUMBER,
    BORROW_DATE DATE,
    DUE_DATE DATE,
    RETURN_DATE DATE
);


-- Q4. Create a MEMBER table.

CREATE TABLE MEMBER (
    MEMBER_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    JOIN_DATE DATE,
    MEMBERSHIP_TYPE VARCHAR2(20),
    EMAIL VARCHAR2(100)
);


-- Q5. Make BRANCH_ID the primary key of BRANCH.
-- Already done in Q1.
-- If the table was created without a primary key, use:
--
-- ALTER TABLE BRANCH
-- ADD CONSTRAINT PK_BRANCH PRIMARY KEY (BRANCH_ID);


-- Q6. Add a foreign key linking each BOOK to its BRANCH.

ALTER TABLE BOOK
ADD CONSTRAINT FK_BOOK_BRANCH
FOREIGN KEY (BRANCH_ID)
REFERENCES BRANCH (BRANCH_ID);


-- Q7. Allow only REGULAR, PREMIUM, or STUDENT
-- as MEMBERSHIP_TYPE values.

ALTER TABLE MEMBER
ADD CONSTRAINT CHK_MEMBERSHIP_TYPE
CHECK (MEMBERSHIP_TYPE IN ('REGULAR', 'PREMIUM', 'STUDENT'));


-- Q8. Add foreign keys in BORROW_RECORD referencing
-- MEMBER and BOOK.
-- MEMBER and BOOK are the parent tables here.

ALTER TABLE BORROW_RECORD
ADD CONSTRAINT FK_BORROW_MEMBER
FOREIGN KEY (MEMBER_ID)
REFERENCES MEMBER (MEMBER_ID);

ALTER TABLE BORROW_RECORD
ADD CONSTRAINT FK_BORROW_BOOK
FOREIGN KEY (BOOK_ID)
REFERENCES BOOK (BOOK_ID);


-- Q9. Ensure DUE_DATE is later than BORROW_DATE.

ALTER TABLE BORROW_RECORD
ADD CONSTRAINT CHK_DUE_DATE
CHECK (DUE_DATE > BORROW_DATE);


-- Q10. Add LAST_DATE to BOOK with a default of NULL.

ALTER TABLE BOOK
ADD LAST_DATE DATE DEFAULT NULL;


-- Q11. Rename MEMBERSHIP_TYPE to MEMBER_TIER.

ALTER TABLE MEMBER
RENAME COLUMN MEMBERSHIP_TYPE TO MEMBER_TIER;


-- Q12. Drop PRICE from BOOK.

ALTER TABLE BOOK
DROP COLUMN PRICE;





-- ============================================================
-- OVERALL EXPLANATION / IMPORTANT NOTES
-- ============================================================

-- CREATE TABLE:
-- Creates a new table.

-- PRIMARY KEY:
-- Uniquely identifies each row and does not allow NULL.
-- Example: BRANCH_ID in BRANCH.

-- FOREIGN KEY:
-- Connects a child table to a parent table.
-- BOOK.BRANCH_ID references BRANCH.BRANCH_ID.
-- BORROW_RECORD.MEMBER_ID references MEMBER.MEMBER_ID.
-- BORROW_RECORD.BOOK_ID references BOOK.BOOK_ID.

-- CHECK CONSTRAINT:
-- Restricts the values allowed in a column.
-- Example: MEMBERSHIP_TYPE accepts only REGULAR,
-- PREMIUM, or STUDENT.

-- DEFAULT NULL:
-- Uses NULL when a value is not provided for LAST_DATE.
-- In Oracle, NULL is also the default when no default
-- is specified, so DEFAULT NULL is optional.

-- RENAME COLUMN:
-- Changes a column's name without removing its data.

-- DROP COLUMN:
-- Permanently removes a column and its stored values.

-- EXECUTION ORDER:
-- Create BRANCH, BOOK, MEMBER, and BORROW_RECORD first.
-- Then run the ALTER TABLE statements in Q6-Q12.
-- Run Q5's alternative statement only if the primary key
-- was not already created in Q1.

-- IMPORTANT:
-- Q11 changes MEMBERSHIP_TYPE to MEMBER_TIER.
-- Run Q11 after Q7, as shown above.
-- After Q11, the constraint still applies to the renamed
-- column because it belongs to the same column.

-- ============================================================
