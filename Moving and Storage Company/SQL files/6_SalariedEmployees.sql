/* The employee with the highest salary */

use MovinOn;

select Emp_salary as `Salary`, Emp_first_name `First Name`, Emp_last_name as `Last Name`
	from vw_current_employees
    order by salary desc
    limit 1;


    