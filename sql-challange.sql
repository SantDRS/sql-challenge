-- Jose Santos
-- SQL-CHALLENGE


-- Create tables for each of the 6 csv files. 
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR (50),
	birth_date DATE,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	sex VARCHAR (50),
	hire_date DATE);
	
CREATE TABLE departments (
	dept_no	VARCHAR(30),
	dept_name VARCHAR(50));

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(30));
	
CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	emp_no INT);
	
CREATE TABLE salaries (
	emp_no INT,
	salary INT);
	
CREATE TABLE titles (
	title_id VARCHAR(30), 
	title VARCHAR(50));
	

-- Visualize tables to confirm uploads.
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date < '1987-01-01';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments
ON dept_manager.dept_no = dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT departments.dept_no, employees.emp_no, departments.dept_name, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no =  dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name Like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Frequency Count of Name"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count of Name" desc;