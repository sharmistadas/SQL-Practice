WHENEVER SQLERROR EXIT SQL.SQLCODE

CREATE TABLE REGIONS (
  region_id NUMBER(10) CONSTRAINT pk_regions PRIMARY KEY,
  region_name VARCHAR2(25)
);

CREATE TABLE COUNTRIES (
  country_id CHAR(2) CONSTRAINT pk_countries PRIMARY KEY,
  country_name VARCHAR2(40),
  region_id NUMBER(10),
  CONSTRAINT fk_countries_regions
    FOREIGN KEY (region_id) REFERENCES REGIONS (region_id)
);

CREATE TABLE LOCATIONS (
  location_id NUMBER(10) CONSTRAINT pk_locations PRIMARY KEY,
  street_address VARCHAR2(40),
  postal_code VARCHAR2(12),
  city VARCHAR2(30),
  state_province VARCHAR2(25),
  country_id CHAR(2),
  CONSTRAINT fk_locations_countries
    FOREIGN KEY (country_id) REFERENCES COUNTRIES (country_id)
);

CREATE TABLE JOBS (
  job_id VARCHAR2(10) CONSTRAINT pk_jobs PRIMARY KEY,
  job_title VARCHAR2(35),
  min_salary NUMBER(10),
  max_salary NUMBER(10)
);

CREATE TABLE DEPARTMENTS (
  department_id NUMBER(10) CONSTRAINT pk_departments PRIMARY KEY,
  department_name VARCHAR2(30),
  manager_id NUMBER(10),
  location_id NUMBER(10),
  CONSTRAINT fk_departments_locations
    FOREIGN KEY (location_id) REFERENCES LOCATIONS (location_id)
);

CREATE TABLE EMPLOYEES (
  employee_id NUMBER(10) CONSTRAINT pk_employees PRIMARY KEY,
  first_name VARCHAR2(20),
  last_name VARCHAR2(25),
  email VARCHAR2(25),
  phone_number VARCHAR2(20),
  hire_date DATE,
  job_id VARCHAR2(10),
  salary NUMBER(8,2),
  commission_pct NUMBER(2,2),
  manager_id NUMBER(10),
  department_id NUMBER(10),
  CONSTRAINT fk_employees_jobs
    FOREIGN KEY (job_id) REFERENCES JOBS (job_id),
  CONSTRAINT fk_employees_departments
    FOREIGN KEY (department_id) REFERENCES DEPARTMENTS (department_id),
  CONSTRAINT fk_employees_manager
    FOREIGN KEY (manager_id) REFERENCES EMPLOYEES (employee_id)
);

CREATE TABLE JOB_HISTORY (
  employee_id NUMBER(10),
  start_date DATE,
  end_date DATE,
  job_id VARCHAR2(10),
  department_id NUMBER(10),
  CONSTRAINT pk_job_history PRIMARY KEY (employee_id, start_date),
  CONSTRAINT fk_job_history_employees
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEES (employee_id),
  CONSTRAINT fk_job_history_jobs
    FOREIGN KEY (job_id) REFERENCES JOBS (job_id),
  CONSTRAINT fk_job_history_departments
    FOREIGN KEY (department_id) REFERENCES DEPARTMENTS (department_id)
);

ALTER TABLE DEPARTMENTS
  ADD CONSTRAINT fk_departments_manager
  FOREIGN KEY (manager_id) REFERENCES EMPLOYEES (employee_id);
