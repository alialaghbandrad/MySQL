/* load data from external csv file */

use MovinOn;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
into table tblCustomer
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
select * from tblCustomer;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Warehouse.csv'
into table tblWarehouse
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
select * from tblWarehouse;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/StorageUnits.csv'
into table tblStorageUnit
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
select * from tblStorageUnit;

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rental.txt" into table tblUnitRental;
select * from tblUnitRental;

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/position.txt" into table tblPosition;
select * from tblPosition;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employees.csv'
into table tblEmployee
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
select * from tblEmployee;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Drivers.csv'
into table tblDriver
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
select * from tblDriver;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Vehicles.csv'
into table tblVehicle
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
select * from tblVehicle;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/JobOrders.csv'
into table tblJobOrder
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
select * from tblJobOrder;



