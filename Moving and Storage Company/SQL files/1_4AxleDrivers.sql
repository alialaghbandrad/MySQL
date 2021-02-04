/* 1_4AxleDrivers: Listing drivers with records of A and B, who qualify to drive 4 axles vehicles */

use MovinOn;

select Driver_ID, Drv_first_name, Drv_last_name, Drv_phone, Drv_cell, Drv_milage_rate, Drv_record
	from tblDriver
    where Drv_end_date IS NULL 
    having Drv_record IN ('A','B')
    order by Drv_record ASC, Drv_milage_rate ASC;