drop database if exists task11_1;
create database task11_1;
use task11_1;

create table `Паспорт` (id int primary key auto_increment, num_p int, ser_p varchar(10), giv_h varchar(1000), 
						giv_d date, giv_kod smallint, index (num_p, ser_p));  -- Уникальная комбинация номер паспорта+серия паспорта

create table `Гражданин` (id int primary key, f_name varchar(50), l_name varchar(50), m_name varchar(50), d_birth date,
						  foreign key (id) references `Паспорт`(id)
                          ); -- Здесь в качестве индекса (primary) id

create table `Квартира` (id int primary key auto_increment, f_addr varchar(500), 
						 own int, foreign key (own) references `Гражданин`(id) ); -- Здесь в качестве индекса (primary) id
create table `Домашние животные` (id int primary key auto_increment, p_name varchar(100), type1 varchar (50), type2 varchar(50), p_own int, 
								  foreign key (p_own) references `Гражданин`(id) ); -- Здесь тоже в качестве индекса id, чтобы не городить кмбинации Тип+Порода+Кличка+Хозяин