-----QUEREIES-------
--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name,employees.gender, salaries.salary
     FROM employees
LEFT JOIN salaries on employees.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.
UPDATE employees
SET employees.hire_date =  CONVERT(varchar,hire_date);
select emp_no from employees where hire_date like '1986%';
SELECT * 
FROM employees 
WHERE  CONVERT(VARCHAR(30), hire_date) LIKE '1986%';
select * 
from employees
where employees.hire_date like 1986%;
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, employees.hire_date 
FROM dept_manager
inner join departments on departments.dept_no = dept_manager.dept_no
inner JOIN employees on employees.emp_no = dept_manager.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from dept_emp
left join employees on employees.emp_no = dept_emp.emp_no
left join departments on departments.dept_no = dept_emp.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select * 
from employees
where first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from dept_emp
left join employees on employees.emp_no = dept_emp.emp_no
left join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from dept_emp
left join employees on employees.emp_no = dept_emp.emp_no
left join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales' or dept_name = 'Marketing';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(employees.last_name) as "last_name_counts"
from employees
group by last_name
order by last_name_counts desc;