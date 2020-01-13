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
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(5,'湛江鸡','荤菜',1,30,'5.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(6,'水果拼盘','水果',1,10,'6.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(7,'北京烤鸭','荤菜',1,48,'7.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(8,'手撕包菜','素菜',1,18,'8.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(4,'紫菜蛋花汤','汤类',1,15,'9.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(9,'罗宋汤','汤类',1,30,'10.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(10,'麻辣香锅','火锅',1,8,'11.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(11,'鸳鸯火锅','火锅',1,8,'12.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(12,'香肠','火锅',1,5,'12.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(13,'墨鱼丸','火锅',1,5,'13.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(14,'牛筋丸','火锅',1,5,'14.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(15,'金针菇','火锅',1,5,'15.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(16,'白菜','火锅',1,5,'16.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(17,'鸭血','火锅',1,5,'17.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(18,'鸡肾','火锅',1,5,'18.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(19,'蟹柳','火锅',1,5,'19.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(20,'鸡胸肉','火锅',1,5,'20.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(21,'可乐(小)','饮品',1,5,'21.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(22,'可乐(大)','饮品',1,10,'22.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(23,'雪碧(小)','饮品',1,5,'23.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(24,'雪碧(大)','饮品',1,10,'24.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(25,'茅台','饮品',1,600,'25.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(26,'小糊涂仙','饮品',1,100,'26.jpg');
insert into menu(menu_id,menu_name,menu_category,menu_status,price,picture) values(27,'椰汁','饮品',1,10,'27.jpg');

create table table_information
(
    table_id int(5) primary key auto_increment,
    table_name varchar(30) default null,
    table_seat varchar(5) default null,
    table_status int(3) default null,
    phone varchar(20) default null,
    table_time datetime default null)
;

insert into table_information(table_id,table_name,table_seat,table_status)values(1,'大厅一号','8',1);
insert into table_information(table_id,table_name,table_seat,table_status,phone,table_time)values(2,'大厅二号','8',2,'18925329820','2019-12-25 00:00:00');
insert into table_information(table_id,table_name,table_seat,table_status)values(3,'大厅三号','8',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(4,'包厢一号','20',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(5,'包厢二号','20',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(6,'包厢三号','20',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(7,'包厢四号','20',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(8,'天台一号','12',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(9,'天台二号','12',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(10,'天台三号','12',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(11,'天台四号','12',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(12,'天台五号','12',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(13,'情侣厢房一','2',1);
insert into table_information(table_id,table_name,table_seat,table_status)values(14,'情侣厢房二','2',1);


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

insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (1,'陈宇彬','18925329817','403644484@qq.com','1999-08-22','2020-1-1 00:00:00','2020-1-1 00:00:00','123456');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (2,'林子旸','18925329818','403644485@qq.com','1999-08-23','2020-1-1 00:00:00','2020-1-1 00:00:00','123456a');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (3,'蔡老板','18925329819','403644486@qq.com','1999-08-24','2020-1-1 00:00:00','2020-1-1 00:00:00','123456b');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (4,'李老板','18925329820','403644487@qq.com','1999-08-25','2020-1-1 00:00:00','2020-1-1 00:00:00','123456c');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (5,'梁老板','18925329821','403644488@qq.com','1999-08-26','2020-1-1 00:00:00','2020-1-1 00:00:00','123456d');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (6,'刘老板','18925329822','403644489@qq.com','1999-08-27','2020-1-1 00:00:00','2020-1-1 00:00:00','123456e');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (7,'周老板','18925329823','403644490@qq.com','1999-08-28','2020-1-1 00:00:00','2020-1-1 00:00:00','123456f');
insert into customer(customer_id, customer_name, phone, email, birthday, register_time, login_time, customer_password) VALUES (8,'吴小姐','18925329824','403644491@qq.com','1999-08-29','2020-1-1 00:00:00','2020-1-1 00:00:00','123456g');

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

insert into order_list(order_id, order_no, customer_id, customer_name, phone, table_id, table_name, order_status, order_price, table_time, end_time, ps) VALUES(1,'NO1',3,'蔡老板','18925329819',1,'大厅一号',2,890,'2019-12-25 00:00:00','2019-12-26 00:00:00','太便宜了');
insert into order_list(order_id, order_no, customer_id, customer_name, phone, table_id, table_name, order_status, order_price, table_time) VALUES(2,'NO2',4,'李老板','18925329820',2,'大厅二号',1,45,'2019-12-25 00:00:00');

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

insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(1,'NO1',1,'龙虾',200,1,200);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(2,'NO1',2,'卤鸭',55,1,55);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(3,'NO1',3,'麻婆豆腐',20,1,20);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(4,'NO1',4,'紫菜蛋花汤',15,1,15);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(5,'NO1',5,'茅台',600,1,600);

insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(6,'NO2',10,'麻辣香锅',5,1,5);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(7,'NO2',12,'香肠',5,1,5);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(9,'NO2',13,'墨鱼丸',5,1,5);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(10,'NO2',14,'牛筋丸',5,1,5);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(11,'NO2',15,'金针菇',5,1,5);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(12,'NO2',16,'白菜',5,1,5);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(13,'NO2',17,'鸭血',5,1,5);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(14,'NO2',18,'鸡肾',5,1,5);
insert into order_item(id, order_no, menu_id, menu_name, price, quantity, total_price) VALUES(15,'NO2',20,'鸡胸肉',5,1,5);

create table staff
(
    staff_id int(5) primary key auto_increment,
    staff_name varchar(30) default null,
    staff_password varchar(30) default null
);
insert into staff(staff_id, staff_name, staff_password) values (1,'小陈','123456');
insert into staff(staff_id, staff_name, staff_password) values (2,'小林','123456');
insert into staff(staff_id, staff_name, staff_password) values (3,'小蔡','123456');
insert into staff(staff_id, staff_name, staff_password) values (4,'admin','admin');
insert into staff(staff_id, staff_name, staff_password) values (5,'小李','123456');
insert into staff(staff_id, staff_name, staff_password) values (6,'小黑','123456');
insert into staff(staff_id, staff_name, staff_password) values (7,'小白','123456');
insert into staff(staff_id, staff_name, staff_password) values (8,'阿猫','123456');
insert into staff(staff_id, staff_name, staff_password) values (9,'阿狗','123456');
insert into staff(staff_id, staff_name, staff_password) values (10,'大王','123456');
insert into staff(staff_id, staff_name, staff_password) values (11,'小王','123456');
insert into staff(staff_id, staff_name, staff_password) values (12,'小凉','123456');
insert into staff(staff_id, staff_name, staff_password) values (13,'小虎','123456');
insert into staff(staff_id, staff_name, staff_password) values (14,'大白','123456');
insert into staff(staff_id, staff_name, staff_password) values (15,'大牛','123456');

