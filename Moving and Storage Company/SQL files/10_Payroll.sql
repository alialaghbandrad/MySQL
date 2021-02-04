/* Payroll list */

use MovinOn;

select Emp_ID, concat_ws(' ', Emp_first_name, Emp_last_name) as `Employee Name`, Emp_SSN as 'SSN',
	round(if(Emp_salary is not null, Emp_salary/12, Emp_hourly_rate*8*12), 2) as `Monthly salary`
	from vw_current_employees
    order by `Employee Name` asc;
