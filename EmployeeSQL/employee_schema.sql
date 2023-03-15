CREATE TABLE Titles (
    title_id varchar(5)   NOT NULL,
    title varchar(50),
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id));

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(5),
    birth_date date,
    first_name varchar(30),
    last_name varchar(30),
    sex varchar(1),
    hire_date date,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no));

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int);

CREATE TABLE Departments (
    dept_no varchar(5)   NOT NULL,
    dept_name varchar(50),
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no));

CREATE TABLE Department_Manager (
    dept_no varchar(5)   NOT NULL,
	emp_no int   NOT NULL,
    CONSTRAINT pk_Department_Manager PRIMARY KEY (
        emp_no,dept_no));

CREATE TABLE Department_Employee (
    emp_no int   NOT NULL,
    dept_no varchar(5)   NOT NULL,
    CONSTRAINT pk_Department_Employee PRIMARY KEY (
        emp_no,dept_no));

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);