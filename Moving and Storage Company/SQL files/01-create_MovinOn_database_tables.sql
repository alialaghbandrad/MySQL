/* Moving and warehouse company (MovinOn) database 
Script Date: February 2021
By: Ali Alaghbandrad
*/

create database MovinOn;

use MovinOn;

create table tblCustomer
(
	Cust_ID smallint auto_increment not null,
    Comp_name varchar(100),
    Contact_first_name varchar(50) not null,
    Contact_last_name varchar(50) not null,
    Cust_Address varchar(200) not null,
    Cust_city varchar(30) not null,
    Cust_state varchar(30) not null,
    Cust_ZIP varchar(20) not null,
    Cust_phone varchar(20) not null,
    Cust_balance decimal(8, 2) not null,
    constraint pk_tblCustomer primary key (Cust_ID asc)
)
;

select * from tblCustomer;

create table tblWarehouse
(
	Wrh_ID char(4) not null,
    Wrh_Address varchar(200) not null,
	Wrh_city varchar(30) not null,
	Wrh_state varchar(30) not null,
	Wrh_ZIP varchar(20) not null,
	Wrh_phone varchar(20) not null,
	Wrh_climate_controlled varchar(3) not null,
	Wrh_secutiy_gate varchar(3) not null,
    constraint pk_tblWarehouse primary key (Wrh_ID asc)
)
;

select * from tblWarehouse;

create table tblStorageUnit
(
	Unit_ID smallint not null,
	Wrh_ID char(4) not null,
	Unit_size varchar(7) not null,
	Unit_rent decimal(6, 2) not null,
	constraint pk_tblStorageUnit primary key (Unit_ID asc, Wrh_ID asc),
	constraint fk_tblStorageUnit_tblWarehouse foreign key (Wrh_ID) references tblWarehouse (Wrh_ID)
)
;

select * from tblStorageUnit;

create table tblUnitRental
(
	Rental_ID int auto_increment not null,
    Cust_ID smallint not null,
	Wrh_ID char(4) not null,
    Unit_ID smallint not null,
    Date_in date not null,
    Date_out date null,
    constraint pk_tblUnitRental primary key (Rental_ID),
    constraint fk_tblUnitRental_tblCustomer foreign key (Cust_ID) references tblCustomer (Cust_ID),
    constraint fk_tblUnitRental_tblStorageUnit foreign key (Unit_ID, Wrh_ID) references tblStorageUnit (Unit_ID, Wrh_ID)
)
;

select * from tblUnitRental;

create table tblPosition
(
	PositionID tinyint auto_increment not null,
    Title varchar(30) not null,
	constraint pk_tblPosition primary key (PositionID)
)
;

select * from tblPosition;

create table tblEmployee
(
	Emp_ID smallint auto_increment not null,
    Emp_first_name varchar(50) not null,
	Emp_last_name varchar(50) not null,
	Wrh_ID char(4) not null,
    Emp_SSN varchar(9) not null,
	Emp_Birthdate date not null,
    Emp_start_date date not null,
	Emp_end_date date null,
    Emp_address varchar(200) not null,
	Emp_city varchar(30) not null,
	Emp_State varchar(30) not null,
	Emp_ZIP varchar(20) not null,
	PositionID tinyint not null,
    Emp_phone varchar(20) not null,
    Emp_cell varchar(20) not null,
    Emp_salary decimal(8, 2),
    Emp_hourly_rate decimal(5, 2),
    Emp_review date,
    Emp_memo varchar(300),
    constraint pk_tblEmployee primary key (Emp_ID),
    constraint fk_tblEmployee_tblPosition foreign key (PositionID) references tblPosition(PositionID),
    constraint fk_tblEmployee_tblWarehouse foreign key (Wrh_ID) references tblWarehouse (Wrh_ID)
)
;
drop table tblEmployee;
select * from tblEmployee;

create table tblVehicle
(
	Vhc_ID char(7) not null,
	Vhc_plate varchar(10) not null,
	Vhc_axl char(1) not null,
	Vhc_col varchar(20) not null,
    constraint pk_tblVehicle primary key (Vhc_ID)
)
;

select * from tblVehicle;

create table tblDriver
(
	Driver_ID smallint auto_increment not null,
    Drv_first_name varchar(50) not null,
	Drv_last_name varchar(50) not null,
    Drv_SSN varchar(9) not null,
	Drv_Birthdate date not null,
	Drv_start_date date not null,
	Drv_end_date date null,
    Drv_address varchar(200) not null,
	Drv_city varchar(30) not null,
	Drv_State varchar(30) not null,
	Drv_ZIP varchar(20) not null,
    Drv_phone varchar(20) not null,
	Drv_cell varchar(20) not null,
    Drv_milage_rate decimal(5, 2) not null,
    Drv_review date,
    Drv_record char(1) not null,
    constraint pk_tblDriver primary key (Driver_ID),
    constraint ck_Drv_record check (binary Drv_record>='A' and Drv_record<='F')
)
;

select * from tblDriver;

create table tblJobOrder
(
	Job_order_ID int auto_increment not null,
	Cust_ID smallint not null,
    Move_date date not null,
    Address_moving_from varchar(300) not null,
	Address_moving_to varchar(300) not null,
	City_moving_from varchar(30) not null,
	City_moving_to varchar(30) not null,
    State_moving_from varchar(30) not null,
	State_moving_to varchar(30) not null,
	Distance_estimated decimal(10,2) not null,
    Weight_estimated decimal(10,2) not null,
	Packing varchar(3) not null, -- need packing, Yes/No? 
    Heavy_item varchar(3) not null, -- heavy item (e.g. Fridge, Piano), Yes/No? 
    Storage_rent varchar(3) not null, -- need storage, Yes/No? 
    Emp_ID smallint not null, -- employee ID of who operated the order
    Order_date_time datetime not null, -- date and time of ordering
	constraint pk_tblJobOrder primary key (Job_order_ID),
    constraint fk_tblJobOrder_tblCustomer foreign key (Cust_ID) references tblCustomer (Cust_ID),
    constraint fk_tblJobOrder_tblEmployee foreign key (Emp_ID) references tblEmployee (Emp_ID)
)
;

select * from tblJobOrder;

create table tblJobDetail
(
	Job_order_ID int not null,
	Vhc_ID char(7) not null,
    Driver_ID smallint auto_increment not null,
    Actual_mileage decimal(10,2) not null,
    Actual_weight decimal(10,2) not null,
    constraint pk_tblJobDetail primary key (Job_order_ID),
    constraint fk_tblJobDetail_tblJobOrder foreign key (Job_order_ID) references tblJobOrder (Job_order_ID),
    constraint fk_tblJobDetail_tblVehicle foreign key (Vhc_ID) references tblVehicle (Vhc_ID),
    constraint fk_tblJobDetail_tblDriver foreign key (Driver_ID) references tblDriver (Driver_ID)
)
;

select * from tblJobOrder;

    