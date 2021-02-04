/* The number of jobs types offered at MonivOne */

use MovinOn;

select count(PositionID) as `Number of job types`
	from tblPosition;

