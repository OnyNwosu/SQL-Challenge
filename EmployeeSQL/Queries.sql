SELECT * FROM "Titles";

SELECT * FROM "Employees";

SELECT * FROM "Department_Employee";

SELECT * FROM "Department_Manager";

SELECT * FROM "Departments";

SELECT * FROM "Salaries";

-- * All tables exist and are pullin through. 

-- DATA ANALYSIS
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Salaries" AS s
INNER JOIN "Employees" AS e ON
e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM "Employees"
WHERE extract(year from hire_date) = 1986;  

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM "Departments" AS d
INNER JOIN "Department_Manager" AS m 
ON m.dept_no = d.dept_no
JOIN "Employees" AS e ON
e.emp_no = m.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM "Employees" AS e
INNER JOIN "Department_Employee" AS d ON
e.emp_no = d.emp_no
INNER JOIN "Departments" AS dp ON
dp.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM "Employees" AS e
INNER JOIN "Department_Employee" AS d ON
e.emp_no = d.emp_no
INNER JOIN "Departments" AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM "Employees" AS e
INNER JOIN "Department_Employee" AS d ON
e.emp_no = d.emp_no
INNER JOIN "Departments" AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Sales'
OR dp.dept_name LIKE 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS frequency
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC;

-- Epilogue
SELECT *
FROM "Employees"
WHERE emp_no = 499942; 