/* The states or provinces that the employees reside */

use MovinOn;

select Emp_State as `State`, count(Emp_ID) as `Number of employees`
	from vw_current_employees
    group by Emp_State;

