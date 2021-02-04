/* Number and name of employed people in each type of job */

use MovinOn;

-- Number
select P.Title, count(P.Title) as `Number of employees`
	from tblposition as `P`
    inner join vw_current_employees as `E` on P.PositionID = E.PositionID
    group by P.Title;

-- Name
select P.PositionID, P.Title, Emp_first_name `First Name`, Emp_last_name as `Last Name`
	from tblposition as `P`
    inner join vw_current_employees as `E` on P.PositionID = E.PositionID
    ;
