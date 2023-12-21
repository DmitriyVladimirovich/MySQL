drop database if exists vkj;
create database vkj;
use vkj;
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

insert into users (username) values ('user 1'), ('user 2'), ('user 3');
insert into chats (title, descr, owner_id) values ('chat 1','for car l', 1), ('chat 2','anime',2), ('chat 3','',3);
insert into users_to_chats values (1,1,'2022-01-01 00:00:15'),
								  (1,2,'2022-01-01 00:03:07'),
                                  (1,3,'2022-01-05 10:03:47'),
                                  (2,1,'2022-01-01 00:00:15'),
                                  (2,3,'2022-01-03 17:56:37'),
                                  (3,1,'2022-01-06 18:19:43'),
                                  (3,2,'2022-01-05 12:19:57');
-- 1
-- select title, descr from chats join users on username='user 1' order by title desc;
-- 2
-- select title, enter_datetime from chats join users_to_chats on chats.id=users_to_chats.chat_id join users on users.username='user 2' and users.id=users_to_chats.user_id order by enter_datetime;
-- 3
select title, enter_datetime from chats join users_to_chats on chats.title='chat 1' and chats.owner_id=users_to_chats.user_id and users_to_chats.chat_id=chats.id;
-- Согласно users_to_chats, 'user 2' ни разу не заходил в 'chat 2', владельцем которого является ))))