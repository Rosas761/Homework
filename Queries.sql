--1. List the following details of each employee: employee number, last name, first name, gender, and salary

select ei.emp_id, ei.last_name, ei.first_name, ei.gender, est.salary
from Employee_Info ei
join Emp_Salaries_Tenure est
on est.emp_id = ei.emp_id


--2. List employees who were hired in 1986.

select emp_id, first_name, last_name, hire_date
from(
select emp_id, first_name, last_name, hire_date
from Employee_info 
)t1
where hire_date between '1986/01/01' and '1987/01/01'
order by hire_date

--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

--Start with employees 

select dn.dept_id, dn.dept_name, dmt.manager_id, ei.first_name, ei.last_name, dmt.start_date, dmt.end_date
from employee_info ei
inner join dept_manager_tenure dmt
on dmt.manager_id = ei.emp_id
inner join dept_names dn
on dn.dept_id = dmt.dept_id

------------------------------------------------------

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select  dn.dept_name, ei.emp_id, ei.first_name, ei.last_name
from employee_info ei
join dept_manager_tenure dmt
on dmt.manager_id = ei.emp_id
join dept_names dn
on dn.dept_id = dmt.dept_id

--5. List all employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name
from employee_info 
where first_name like 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select dn.dept_name, ei.emp_id, ei.first_name, ei.last_name
from dept_names dn
join dept_emp_tenure det
on det.dept_id = dn.dept_id
join employee_info ei
on det.emp_id = ei.emp_id
where dn.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select dn.dept_name, ei.emp_id, ei.first_name, ei.last_name
from dept_names dn
join dept_emp_tenure det
on det.dept_id = dn.dept_id
join employee_info ei
on det.emp_id = ei.emp_id
where dn.dept_name = 'Sales' or dn.dept_name = 'Development' 


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as the_count
from employee_info
group by last_name
order by the_count desc



