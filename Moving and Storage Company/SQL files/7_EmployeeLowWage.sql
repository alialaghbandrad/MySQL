/* The employee with the lowest hourly rate */

use MovinOn;

select Emp_hourly_rate as `Hourly rate`, Emp_first_name `First Name`, Emp_last_name as `Last Name`
	from vw_current_hourlypaid_emps
    order by Emp_hourly_rate
    limit 1;
