drop database if exists task9_2;
create database task9_2;
use task9_2;

create table shops (id tinyint, title varchar(20), address varchar(60), city varchar(20), working_hours varchar(20));
insert into shops values (0,'Пятерочка','ул.Семёнова, 47', 'Москва', '8:00-22:00');
insert into shops values (1,'Перекрёсток','ул.Семёнова, 48', 'Москва', 'круглосуточно');
insert into shops values (2,'Пятерочка','ул.Вовы, 32', 'Санкт-Петербург', '8:30-22:30');
insert into shops values (3,'Перекрёсток','ул.Татьяны Б, 1', 'Ижевск', '9:00-21:00');

-- select * from shops;
update shops set title='Пятерочка2' where title='Пятерочка';
-- select * from shops;
update shops set address='пр-т Орлова, 33' where city='Ижевск';
-- select * from shops;
update shops set title='Всегда открыто', address='Рядом с домом' where working_hours='круглосуточно';
-- select * from shops;
delete from shops where id=2;
select * from shops;