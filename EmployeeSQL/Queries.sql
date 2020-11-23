-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex,  sal.salaries
	FROM public.employees as emp, salaries as sal
	where emp.emp_no = sal.emp_no
-- 2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
	FROM employees as emp
	where emp.hire_date >= '1/1/1986' and emp.hire_date <= '12/31/1986'
--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, dept.dept_name, mgr.emp_no, mgr.first_name, mgr.last_name 
	from dept_manager as dm, public."Departments" as dept, employees as mgr
	where dm.dept_no = dept.dept_no and dm.emp_no = mgr.emp_no
-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept.dept_name, emp.emp_no, emp.first_name, emp.last_name 
	from dept_emp as dm, public."Departments" as dept, employees as emp
	where dm.dept_no = dept.dept_no and dm.emp_no = emp.emp_no 
	order by dept_name
-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."	
select first_name, last_name, sex
	from employees
	where first_name = 'Hercules' and last_name like 'B%'
-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.	
select dept.dept_name, emp.emp_no, emp.first_name, emp.last_name 
	from dept_emp as dm, public."Departments" as dept, employees as emp
	where dm.dept_no = dept.dept_no and dm.emp_no = emp.emp_no and dept_name = 'Sales'
	order by dept_name
--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept.dept_name, emp.emp_no, emp.first_name, emp.last_name 
	from dept_emp as dm, public."Departments" as dept, employees as emp
	where dm.dept_no = dept.dept_no and dm.emp_no = emp.emp_no and dept_name in('Sales','Development')
	order by dept_name
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)  "Frequency" 
	from employees
	group by last_name
	order by "Frequency" desc