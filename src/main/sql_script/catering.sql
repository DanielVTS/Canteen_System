drop database catering;
create database catering;
use catering;

drop table order_item;

drop table customer;

create table menu(
                     menu_id int(5) primary key auto_increment,
                     menu_name varchar(30) default null,
                     menu_category varchar(30) default null,
                     menu_status int(3) default null,
                     price double(10,2) default null,
                     picture varchar(50) default null
);

insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(1,'龙虾','荤菜',1,200,'i.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(2,'卤鸭','荤菜',1,55,'2.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(3,'麻婆豆腐','素菜',1,20,'3.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(4,'紫菜蛋花汤','汤类',1,15,'4.jpg');

create table table_information
(
    table_id int(5) primary key auto_increment,
    table_name varchar(30) default null,
    table_seat varchar(5) default null,
    table_status int(3) default null,
    phone varchar(20) default null,
    table_time datetime default null)
;

insert into table_information(table_id,table_name,table_seat,table_status)values(1,'天字一号','10',1);
insert into table_information(table_id,table_name,table_seat,table_status,phone,table_time)values(2,'天字二号','8',0,'18925329817','1983-11-23 00:00:00');
insert into table_information(table_id,table_name,table_seat,table_status,phone,table_time)values(3,'天字三号','6',0,'18925329818','1983-11-23 00:00:00');


create table customer
(
    customer_id  int(5) primary key auto_increment,
    customer_name varchar(30) default null,
    phone varchar(15) default null,
    email varchar(30) default null,
    birthday date default null,
    register_time datetime default null,
    login_time datetime default null,
    customer_password varchar(30) default null
);

insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (1,'陈宇彬','18925329817','403644484@qq.com','1999-08-22','2020-1-1 00:00:00','2020-1-1 00:00:00','woshinibaba');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (2,'林子旸','18925329818','403644485@qq.com','1999-08-22','2020-1-1 00:00:00','2020-1-1 00:00:00','chenyubinniubi');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (3,'蔡老板','18925329819','403644486@qq.com','1999-08-22','2020-1-1 00:00:00','2020-1-1 00:00:00','youqianrengxing');

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
                           table_time datetime default null,
                           end_time datetime default null,
                           ps varchar(50) default null
);

insert into order_list(order_id, order_no, customer_id, customer_name, phone, table_id, table_name, order_status, order_price, table_time, end_time, ps) VALUES(1,'001',1,'蔡老板','18925329819',1,'天字一号',2,1000000,'2019-12-25 00:00:00','2019-12-26 00:00:00','太便宜了');

create table order_item
(
    id int(5) primary key auto_increment,
    order_no varchar(20) default null,
    menu_id int(5),
    menu_name varchar(30) default null,
    price double(10,2) default null,
    quantity int(5) default null,
    total_price double(10,2) default null
);

insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(1,'001',1,'龙虾',200,5000,100000);

create table staff
(
    staff_id int(5) primary key auto_increment,
    staff_name varchar(30) default null,
    staff_password varchar(30) default null
);
insert into staff(staff_id, staff_name, staff_password) values (1,'卑微小陈','123456');
insert into staff(staff_id, staff_name, staff_password) values (2,'妖艳小林','123456');
insert into staff(staff_id, staff_name, staff_password) values (3,'有钱小蔡','123456');

