/*  Listing drivers with low records (i.e. D E F) for terminating the contract */

use MovinOn;

select Driver_ID, Drv_first_name, Drv_last_name, Drv_record, Drv_start_date, Drv_end_date
from vw_current_drivers
having Drv_record >= 'D'
order by Drv_record asc;