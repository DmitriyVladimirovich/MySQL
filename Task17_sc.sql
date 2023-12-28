drop database if exists task17;
create database task17;
use task17;
create table `Владелец салона` (inn int primary key not null,
					firstname varchar(50),
                    secondname varchar(50),
                    middlename varchar(50));

create table `Салон красоты` (s_inn int primary key not null,
					boss_id int,
                    title varchar(50),
                    addr varchar(200),
                    w_time varchar(20));
                    
create table `Мастер` (m_inn int primary key not null,
						firstname varchar(50),
						secondname varchar(50),
                        w_stage tinyint unsigned);

create table `Мастер-Салоны` (saloonid int, 
							  masterid int, 
                              primary key (saloonid, masterid),
                              constraint saloon_path									-- Создание связи внутри скрипта таблицы
                              foreign key (saloonid) references `Салон красоты`(s_inn));
                              -- on delete cascade on update cascade);			

insert into `Владелец салона` values (771212, 'Иванов','Петр','Сергеевич'), 
									 (771415, 'Смирнов','Илья','Сергеевич'),
                                     (231552, 'Федотов','Семен','Ираклиевич');
                                     
insert into `Салон красоты` values (454542, 771212, 'Осинка','Ростов, ул.Ближняя, д.34','10:00 - 20:00'), 
								   (441459, 771212, 'Березка','Ростов, ул.Дальняя, д.12/2','10:00 - 19:00'),
                                   (123456, 231552, 'Красавишна','Москва, ул.Старый проспект, д.13','06:00 - 23:00');                                     

insert into `Мастер` values (741312, 'Пупкин','Андрей', 3), 
							(761715, 'Ноготков','Алексей', 2),
                            (241152, 'Бровкин','Дмитрий', 1);

insert into `Мастер-Салоны` values (123456,761715),(454542,761715),(441459,241152),(454542,741312);                          

-- ------------------------ Домашка --------------------------------
alter table `Мастер` rename to Master;
describe Master;
-- show tables;
-- select curdate();
-- select date(now());
-- alter table Master add column registered date default curdate(); -- Текущую только дату нельзя вставлять (почему-то)
alter table Master add column registered datetime default now();
select * from Master;
select * from `Мастер-Салоны`;
-- alter table Master change registered reg date not null; -- отрезало время... с ворнингом... НО ОТРЕЗАЛО!!
-- update Master set m_inn=777777 where m_inn=761715;

-- delete from `Салон красоты` where s_inn=454542; -- Не дает потому что констрайнт (об этом в лекции не сказали)
												   -- и значит при constraint конструкция on delete cascade on update cascade не нужна?

-- Создание связи отдельной командой
alter table `Мастер-Салоны` 
add foreign key (masterid) references Master(m_inn)
on delete cascade on update cascade;

alter table `Салон красоты`
add constraint look_at_boss 
foreign key (boss_id) references `Владелец салона`(inn);

-- alter table `Салон красоты` drop foreign key look_at_boss;
