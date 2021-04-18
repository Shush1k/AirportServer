drop table if exists airlines cascade;
drop table if exists flights cascade;
drop table if exists routes cascade;
drop table if exists users cascade;

create table airlines
(
    airline_id   bigint auto_increment
        primary key,
    company_name varchar(255) not null,
    email        varchar(255) null,
    phone        varchar(255) null,
    company_code varchar(255) not null,
    website      varchar(255) null,
    constraint UK_2uuo95r5ryvc4pc90e39u5i5i
        unique (company_code),
    constraint UK_9d9dlobx4a2cm2s8c7yiq9f6f
        unique (company_name)
);

create table routes
(
    route_id       bigint auto_increment
        primary key,
    arrival_city   varchar(255) not null,
    departure_city varchar(255) not null
);

create table flights
(
    flight_id      bigint auto_increment
        primary key,
    arrival_date   datetime(6)  not null,
    departure_date datetime(6)  not null,
    flight_number  varchar(255) not null,
    status         varchar(255) null,
    plane_model    varchar(255) null,
    route_id       bigint          not null,
    constraint UK_aucisqx7arn3fi6eyjmsvqdb3
        unique (flight_number),
    foreign key (route_id) references routes (route_id)
);

create table users
(
    user_id    bigint auto_increment
        primary key,
    email      varchar(40)  not null,
    first_name varchar(40)  not null,
    last_name  varchar(40)  not null,
    login      varchar(40)  not null,
    password   varchar(255) null,
    constraint UK_ew1hvam8uwaknuaellwhqchhb
        unique (login),
    constraint UK_ob8kqyqqgmefl0aco34akdtpe
        unique (email)
);

# users
insert into users(email, first_name, last_name, login, password)
values ('aleksandr@mail.ru', 'aleksandr', 'aleksandrov', 'aleksandr@mail.ru', '000');
insert into users(email, first_name, last_name, login, password)
values ('ivan12@mail.ru', 'ivan', 'ivanov', 'ivan12@mail.ru', '111');
insert into users(email, first_name, last_name, login, password)
values ('ivan@mail.ru', 'ivan', 'ivanov', 'ivan@mail.ru', 'admin');

# routes
insert into routes (route_id, arrival_city, departure_city) values (1, 'Москва', 'Казань');
insert into routes (route_id, arrival_city, departure_city) values (2, 'Москва', 'Самара');
insert into routes (route_id, arrival_city, departure_city) values (3, 'Москва', 'Екатерингбург');
insert into routes (route_id, arrival_city, departure_city) values (4, 'Москва', 'Омск');
insert into routes (route_id, arrival_city, departure_city) values (5, 'Москва', 'Бишкек');
insert into routes (route_id, arrival_city, departure_city) values (6, 'Москва', 'Симферополь');
insert into routes (route_id, arrival_city, departure_city) values (7, 'Москва', 'Новый Уренгой');
insert into routes (route_id, arrival_city, departure_city) values (8, 'Москва', 'Сочи');
insert into routes (route_id, arrival_city, departure_city) values (9, 'Москва', 'Екатерингбург');
insert into routes (route_id, arrival_city, departure_city) values (10, 'Москва', 'Салехард');
insert into routes (route_id, arrival_city, departure_city) values (11, 'Москва', 'Новосибирск');
insert into routes (route_id, arrival_city, departure_city) values (12, 'Москва', 'Уфа');
insert into routes (route_id, arrival_city, departure_city) values (13, 'Москва', 'Анапа');
insert into routes (route_id, arrival_city, departure_city) values (14, 'Москва', 'Геленджик');
insert into routes (route_id, arrival_city, departure_city) values (15, 'Москва', 'Санкт-Петербург');
insert into routes (route_id, arrival_city, departure_city) values (16, 'Москва', 'Калининград');
insert into routes (route_id, arrival_city, departure_city) values (17, 'Москва', 'Астрахань');
insert into routes (route_id, arrival_city, departure_city) values (18, 'Москва', 'Белгород');
insert into routes (route_id, arrival_city, departure_city) values (19, 'Москва', 'Махачкала');
insert into routes (route_id, arrival_city, departure_city) values (20, 'Москва', 'Краснодар');
insert into routes (route_id, arrival_city, departure_city) values (21, 'Москва', 'Брянск');
insert into routes (route_id, arrival_city, departure_city) values (22, 'Якутск', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (23, 'Чита', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (24, 'Уфа', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (25, 'Улан-Удэ', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (26, 'Сочи', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (27, 'Стамбул', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (28, 'Симферополь', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (29, 'Санкт-Петербург', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (30, 'Самара', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (31, 'Салехард', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (32, 'Пенза', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (33, 'Новый Уренгой', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (34, 'Новосибирск', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (35, 'Минск', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (36, 'Краснодар', 'Москва');

# flights
insert into flights(arrival_date, departure_date, flight_number, status, plane_model, route_id)
values ('2021-04-17 17:10:24.557000', '2021-04-17 15:10:32.323000', 'RF821', 'ожидает', 'Boeing-737', 1);
insert into flights(arrival_date, departure_date, flight_number, status, plane_model, route_id)
values ('2021-04-18 16:10:24.557000', '2021-04-18 14:30:32.323000', 'RF822', 'ожидает', 'Boeing-737', 2);

# airlines
insert into airlines(company_name, email, phone, company_code, website)
values ('S7', 'S7@mail.ru', '+79853239844', 'S7', 'https://www.s7.com');
insert into airlines(company_name, email, phone, company_code, website)
values ('Aegean', 'aegean@gmail.com', '+79853219144', 'A3', 'https://www.aegean.com');