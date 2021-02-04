/* Listing hourly working employees rates and names after 10% rate increase */

use MovinOn;

select concat_ws(' ', Emp_first_name, Emp_last_name) as `Full Name`,
	Emp_hourly_rate as `Current rate`, round(Emp_hourly_rate*1.1, 2) as `Raised rate`
from vw_current_hourlypaid_emps
where Wrh_ID = 'OR-1' /* like 'OR%' */
order by `Full Name`;
