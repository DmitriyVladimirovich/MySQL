drop database if exists vk_15;
create database vk_15;
use vk_15;
create table users (id int primary key auto_increment,
					username varchar(30),
                    password_hash varchar(300),
                    last_seen datetime);

create table chats (id int primary key auto_increment,
					title varchar(50),
                    descr varchar(200),
                    owner_id int,
                    foreign key (owner_id) references users(id));
                    
create table users_to_chats (user_id int,
							 chat_id int,
                             primary key (user_id, chat_id),
                             enter_datetime datetime,
                             foreign key (user_id) references users(id),
                             foreign key (chat_id) references chats(id));

insert into users (username) values ('user 1 '), ('user 2'), ('user 3 '), ('user 4');
insert into chats (title, descr, owner_id) values ('chat 1','for car l', 1), ('chat 2','anime',2), ('chat 3','',3);
insert into users_to_chats values (1,1,'2022-01-01 00:00:15'),
								  (1,2,'2022-01-01 00:03:07'),
                                  (1,3,'2022-01-05 10:03:47'),
                                  (2,1,'2022-01-01 00:00:15'),
                                  (2,3,'2022-01-03 17:56:37'),
                                  (3,1,'2022-01-06 18:19:43'),
                                  (3,2,'2022-01-05 12:19:57');
-- Строковые
select length(concat(id, ' ', trim(username))) from users;
select substring(trim('   Вася у моря   '), 6);
select reverse('   Вася у моря   ');
select length(concat(id, ' ', upper(username))) from users;
select reverse(trim('   Вася у моря   '));
select lower('Вася');
select reverse(concat(title, ' ', descr)) from chats where chats.id=1;
select concat(substring((select lower(username) from users where id=1), 5),'Фыр-Фыр-Фыр');
-- Числовые
select round(truncate(323.2323,3)); -- бессмысленная комбинация )))
select abs(floor(-2364.7373));
select power(abs(ceiling(-34.99)), 2);
select (sqrt(225)*power(4,2))*sign(-5);
select power(truncate(rand()*10,1), truncate(rand()*100,0));
select truncate(rand()*10, 0); -- для тестов
-- Дата-Время
select now(), sleep(10), now();
select sysdate()+curdate();
select curtime()-utc_time();
select hour(current_time())-hour(utc_time());
select dayofmonth(now())+quarter(now())+week(now()+1);
select date_add(now(), interval 11 day);
select now()+11; -- Просто добавляет к секундам ))
select date_sub(now(), interval (dayofmonth(last_day(now()))) day);
select last_day(now()); -- для теста
select date_format(enter_datetime, '%d-%M-%Y') from users_to_chats;
-- Прочее
select max(id), avg(id), sum(id), min(id), count(id) from users;
select avg(length(descr)), min(length(descr)), max(length(descr)), count(descr) from chats;
select user_id, sum(chat_id) from users_to_chats group by user_id;
select users.id, avg(chats.owner_id) as a from users join chats on users.id<>chats.owner_id group by users.id order by a;