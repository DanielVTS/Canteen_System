drop database catering;
create database catering;
use catering;


create table menu(
menu_id int(5) primary key auto_increment,
menu_name varchar(30) default null,
menu_category varchar(30) default null,
menu_staus int(3) default null,
price int(10) default null,
picture varchar(50) default null
);

create table table_information
(
table_id int(5) primary key auto_increment,
table_name varchar(30) default null,
table_seat varchar(5) default null,
table_staus int(3) default null,
phone varchar(20) default null,
table_time date default null)
;

create table customer
(
customer_id  int(5) primary key auto_increment,
customer_name varchar(30) default null,
phone varchar(15) default null,
email varchar(30) default null,
birthday date default null,
register_time date default null,
login_time date default null,
customer_password varchar(30) default null
);

create table order_list(
order_id int(5) primary key auto_increment,
order_no varchar(20) default null,
customer_id  int(5),
customer_name varchar(30) default null,
phone varchar(15) default null,
table_id int(5),
table_name varchar(30) default null,
order_status int(3) default null,
order_price double(10,2) default null,
table_time date default null,
end_time date default null,
ps varchar(50) default null
);

create table order_item
(
id int(5) primary key auto_increment,
order_no varchar(20) default null,
menu_id int(5),
menu_name varchar(30) default null,
price int(10) default null,
quantity int(5) default null,
total_price double(10,2) default null,
table_time date default null,
end_time date default null
);

create table staff
(
staff_id int(5) primary key auto_increment,
staff_name varchar(30) default null,
staff_password varchar(30) default null
);

