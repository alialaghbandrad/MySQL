/* Listing employees longetivity by warehouse */

use MovinOn;

-- Method 1
select E.Wrh_ID as `Warehouse ID`, P.Title,
	concat_ws(' ', Emp_first_name, Emp_last_name) as `Employee Name`,
	year(curdate())-year(E.Emp_start_date) as `Years in service`
from vw_current_employees as `E`
inner join tblposition as `P` on P.PositionID = E.PositionID
order by E.Wrh_ID, `Years in service` desc;

-- Method 2
select E.Wrh_ID as `Warehouse ID`, P.Title,
	concat_ws(' ', Emp_first_name, Emp_last_name) as `Employee Name`,
	year(curdate())-year(E.Emp_start_date) as `Years in service`
from vw_current_employees as `E`, tblposition as `P`
where P.PositionID = E.PositionID
order by E.Wrh_ID, `Years in service` desc;
