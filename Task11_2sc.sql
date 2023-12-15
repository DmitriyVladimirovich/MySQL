drop database if exists task11_2;
create database task11_2;
use task11_2;

create table `Почтовые отделения` (id int primary key auto_increment, o_addr varchar(250), t_work varchar(100));

create table `Работники` (id int primary key, f_name varchar(50), l_name varchar(50), m_name varchar(50), 
						  num_p int not null, ser_p varchar(10) not null, giv_h varchar(1000),
						  l_addr varchar(250), tk_num int not null, po int, foreign key (po) references `Почтовые отделения`(id), index (num_p, ser_p));

create table `Посылки` (id int primary key, weight smallint, cat tinyint, track int, 
						from_ int, where_ int, foreign key (from_) references `Почтовые отделения`(id), 
											   foreign key (where_) references `Почтовые отделения`(id));