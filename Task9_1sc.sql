drop database if exists task9_1;
create database task9_1;
use task9_1;
create table `Пользователи` (id tinyint not null, u_fname varchar(20) not null, u_lname varchar(20), date_reg date not null, u_gen char(1) default 'm' );
insert into `Пользователи` values (1,'Пользователь1', 'Смирнов', str_to_date('09.09.2009', '%d.%m.%Y'),'f');
insert into `Пользователи` (id,u_fname,date_reg) values (2,'Пользователь2', str_to_date('15.09.2009', '%d.%m.%Y')),
														(3,'Пользователь3', str_to_date('17.09.2009', '%d.%m.%Y')),
                                                        (4,'Пользователь4', str_to_date('01.09.2009', '%d.%m.%Y')),
                                                        (5,'Пользователь5', '2009-09-25');
-- describe `Пользователи`;

create table `Сериалы` (id tinyint, fname varchar(60) not null, s_num tinyint default 1, zhanr varchar(20) default 'Триллер');
create table `Отзывы` (id tinyint, u_name varchar(20) not null, otz varchar(200) default 'Хороший фильм'); -- потому, что тип "text" не может иметь default value
create table `Жанры` (id tinyint not null, zh_name varchar(20) not null);
-- --------------------------------------------------------
insert into `Сериалы` (id, fname) values (1, 'Жизнь замечательных людей'),
										 (2, 'Смерть замечательных людей'),
                                         (3, 'Свадьбы замечательных людей'),
                                         (4, 'Дети замечательных людей'),
                                         (5, 'Дома замечательных людей');
-- --------------------------------------------------------
insert into `Жанры` values (1,'Комедия');
insert into `Жанры` values (2,'Трагедия');
insert into `Жанры` values (3,'Фарс');
insert into `Жанры` values (4,'Боевик');
insert into `Жанры` values (5,'Триллер');
-- --------------------------------------------------------
insert into `Отзывы` (u_name, otz) values ('Смирнофф',' Фильм откровенно не понравился, актеры - деревянные'),
										  ('Зыритель','Неплохо, мало крови'),
                                          ('Баба Яга','Я против современного кинематографа в любом виде!'),
                                          ('Горыныч','66% аудитории понравилось');
insert into `Отзывы` values (7,'Вася','Почему меня не сняли?');                                           
-- --------------------------------------------------------------------------------------------------------------------
-- select * from `Отзывы`;
-- select * from `Жанры`;
-- select * from `Сериалы`;	
-- --------------------------------------------------------------------------------------------------------------------				
-- select * from `Пользователи`;
update `Пользователи` set u_fname	='пользователь';
-- select * from `Пользователи`;
update `Пользователи` set u_lname = 'Сенаторов' where date_reg=str_to_date('09.09.2009', '%d.%m.%Y');
-- select * from `Пользователи`;
-- --------------------------------------------------------------------------------------------------------------------
-- delete from `Жанры` where id=3;
delete from `Жанры` where zh_name='Фарс';
select * from `Жанры`;