/* Listing drivers with low record */

use MovinOn;

select Driver_ID, Drv_first_name, Drv_last_name, Drv_record, Drv_start_date, Drv_end_date
from tblDriver
having Drv_record in ('C','D', 'E', 'F')
order by Drv_record asc;

