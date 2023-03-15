-- List the employee number, last name, first name, sex, and salary of each employee
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s
on e.emp_no = s.emp_no
order by emp_no asc;

-- List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date 
from employees
where hire_date between '1986-1-1' and '1986-12-31'
order by hire_date asc;

-- List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name
select d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name 
from department_manager d_m
join employees e
on d_m.emp_no = e.emp_no
left join departments d
on d_m.dept_no = d.dept_no
order by d.dept_no asc;

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name
select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join department_employee d_e 
on e.emp_no = d_e.emp_no
left join departments d
on d.dept_no = d_e.dept_no
order by d.dept_no asc;

-- List first name, last name, and sex of each employee whose name is Hercules
-- and whose last name begins with the letter B
select first_name, last_name, sex
from employees 
where first_name = 'Hercules' and last_name like 'B%'
order by last_name asc;

-- List each employee in the Sales department, including their employee number, last name, and first name
select e.emp_no, e.last_name, e.first_name
from employees e
join department_employee d_e 
on e.emp_no = d_e.emp_no
left join departments d
on d.dept_no = d_e.dept_no
where d.dept_name = 'Sales'
order by last_name asc;

-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join department_employee d_e 
on e.emp_no = d_e.emp_no
left join departments d
on d.dept_no = d_e.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by d.dept_name asc;

-- List the frequency counts, in descending order, of all the employee last names
select last_name, count(emp_no) as num_employees_with_same_last_name
from employees
group by last_name
order by num_employees_with_same_last_name desc;