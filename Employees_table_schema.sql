-- Create table for the CSV files
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(225) NOT NULL,
	last_name VARCHAR(225) NOT NULL,
	sex	VARCHAR(5) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT * FROM employees;

CREATE TABLE departments(
	dept_no VARCHAR(10),
	dept_name VARCHAR(225) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no VARCHAR (10) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

CREATE TABLE titles(
	title_id VARCHAR (10) NOT NULL,
	title VARCHAR (25) NOT NULL
);

SELECT * FROM titles;
