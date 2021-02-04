/* Listing employee contact by warehouse */

use MovinOn;

select W.Wrh_ID as `Warehouse ID`, W.Wrh_phone as `Warehouse phone`,
		concat_ws(', ', Emp_last_name, Emp_first_name) as `Full Name`,
		E.Emp_phone AS `Employee phone`, E.Emp_cell as `Employee cellphone`
	from tblWarehouse as `W`
	inner join vw_current_employees as `E` on E.Wrh_ID = E.Wrh_ID
    order by W.Wrh_ID
    ;
