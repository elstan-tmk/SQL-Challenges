-- List the following details of each employee: employee number, last name, first name, sex, and salary.
-- use left join, so it will return all records matched from the employees table. 

-- shorten employees to e

SELECT e.emp_no,
e.last_name,
e.first_name,
e.sex,
salaries.salary
FROM employees AS e
LEFT JOIN salaries
ON e.emp_no = salaries.emp_no
ORDER BY first_name;

---------------------------------------------------------------------------
-- List first name, last name, and hire date for employees who were 
-- hired in 1986.
-- use date_part to separate year from the whole hire_date

-- e = employee

SELECT e.emp_no,
e.first_name,
e.last_name,
e.hire_date
FROM employees AS e
WHERE DATE_PART('year', e.hire_date) = 1986
ORDER BY e.first_name;

---------------------------------------------------------------------------
-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.

-- dm = dept_manager
-- e = employee
-- d = departments

SELECT dm.dept_no,
e.emp_no,
d.dept_name,
e.last_name,
e.first_name
FROM dept_manager AS dm
LEFT JOIN departments AS d ON
dm.dept_no = d.dept_no
LEFT JOIN employees AS e ON
e.emp_no = dm.emp_no
ORDER BY dept_no;

---------------------------------------------------------------------------
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

-- e = employees, d = departments

SELECT e.emp_no,
d.dept_name,
e.last_name,
e.first_name,
dept_emp.dept_no
FROM employees AS e 
INNER JOIN dept_emp ON 
e.emp_no = dept_emp.emp_no
INNER JOIN departments AS d ON 
d.dept_no= dept_emp.dept_no
ORDER BY emp_no;


-- List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

SELECT e.emp_no,
e.first_name,
e.last_name,
e.sex
FROM employees AS e
WHERE
e.first_name = 'Hercules'
AND
e.last_name like 'B%';

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees AS e
LEFT JOIN dept_emp ON 
e.emp_no = dept_emp.emp_no
INNER JOIN departments AS d ON
d.dept_no = dept_emp.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT * FROM departments;
SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees AS e
LEFT JOIN dept_emp ON 
e.emp_no = dept_emp.emp_no
INNER JOIN departments AS d ON
d.dept_no = dept_emp.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;


