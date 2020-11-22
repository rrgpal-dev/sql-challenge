SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex,  sal.salaries
	FROM public.employees as emp, salaries as sal
	where emp.emp_no = sal.emp_no
	
SELECT emp.first_name, emp.last_name, emp.hire_date
	FROM employees as emp
	where emp.hire_date >= '1/1/1986' and emp.hire_date <= '12/31/1986'

select dm.dept_no, dept.dept_name, mgr.emp_no, mgr.first_name, mgr.last_name 
	from dept_manager as dm, public."Departments" as dept, employees as mgr
	where dm.dept_no = dept.dept_no and dm.emp_no = mgr.emp_no
	
select dept.dept_name, emp.emp_no, emp.first_name, emp.last_name 
	from dept_emp as dm, public."Departments" as dept, employees as emp
	where dm.dept_no = dept.dept_no and dm.emp_no = emp.emp_no 
	order by dept_name
	
select first_name, last_name, sex
	from employees
	where first_name = 'Hercules' and last_name like 'B%'
	
select dept.dept_name, emp.emp_no, emp.first_name, emp.last_name 
	from dept_emp as dm, public."Departments" as dept, employees as emp
	where dm.dept_no = dept.dept_no and dm.emp_no = emp.emp_no and dept_name = 'Sales'
	order by dept_name
	
select dept.dept_name, emp.emp_no, emp.first_name, emp.last_name 
	from dept_emp as dm, public."Departments" as dept, employees as emp
	where dm.dept_no = dept.dept_no and dm.emp_no = emp.emp_no and dept_name in('Sales','Development')
	order by dept_name

select last_name, count(*)  "Frequency" from employees
group by last_name
order by "Frequency" desc