use hr;

 # 1. Write a query to get all employee details from the employee table order by first name, descending.
 select *
 from employees
 order by first_name desc;
 
 # 2. Write a query to get the number of jobs available in the employees table.
 select count(distinct job_id) from employees;

# 3. Write a query to get monthly salary (round 2 decimal places) of each and every employee ( join first and last name)
select concat(first_name,' ',last_name) as Name, round(salary,2) as SALARY from employees;

# 4. Write a query to find the name (first_name, last name), department ID and department name of all the employees.
select e.first_name, e.last_name, d.department_id, d.department_name
from employees as e join departments as d on e.manager_id=d.manager_id;

# 5. (join and subquery) Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
select * from job_history where employee_id in (select employee_id from employees where salary >10000);
# or
select j.*, e.salary from job_history j join employees e on j.employee_id=e.employee_id where e.salary > 10000;

# 6. Write a query to get the highest, lowest, sum, and average salary of all employees.
select max(salary), min(salary), sum(salary), round(avg(salary),2) from employees;

#7.  Write a query to get the number of employees with the same job. (show the number in desc).
select job_id, count(*) from employees group by job_id;

# 8. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
select job_id, max(salary), min(salary), sum(salary), round(avg(salary),2) from employees where department_id= 90 group by job_id ;

# 9. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
select first_name, last_name, department_id from employees where department_id = 30 or department_id =100 order by department_id;

# 10. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
select first_name, last_name from employees where department_id in (select department_id from departments where department_name= "IT" );
