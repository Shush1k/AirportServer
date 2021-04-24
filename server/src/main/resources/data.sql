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
    website      varchar(255) not null,
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
    type           varchar(255) not null,
    route_id       bigint       not null,
    constraint UK_aucisqx7arn3fi6eyjmsvqdb3
        unique (flight_number),
    constraint flights_ibfk_1
        foreign key (route_id) references routes (route_id)
);

create index route_id
    on flights (route_id);

create table users
(
    user_id      bigint auto_increment
        primary key,
    email        varchar(40)  not null,
    first_name   varchar(40)  not null,
    last_name    varchar(40)  not null,
    login        varchar(40)  not null,
    password     varchar(255) null,
    birth_date   date         null,
    phone_number varchar(20)  null,
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
insert into flights (arrival_date, departure_date, flight_number, status, plane_model, type, route_id) values ('2021-04-21 18:43:00', '2021-04-21 15:10:00', 'RF821', 'ожидает', 'Boeing-737', 'вылет', 1);
insert into flights (arrival_date, departure_date, flight_number, status, plane_model, type, route_id) values ('2021-04-18 16:10:00', '2021-04-18 14:30:00', 'RF822', 'ожидает', 'Boeing-737', 'вылет', 2);
insert into flights (arrival_date, departure_date, flight_number, status, plane_model, type, route_id) values ('2021-04-24 08:30:00', '2021-04-24 06:30:00', 'RA709', 'в полете', 'Boeing-787', 'прилет', 2);

# airlines
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (1, 'S7', 'S7@mail.ru', '+79853239844', 'S7', 'www.s7.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (2, 'Aegean', 'aegean@gmail.com', '+79853219144', 'A3', 'www.aegean.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (3, 'Air Arabia', 'arabia@gmail.com', '+74959355422', 'G9', 'www.airarabia.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (4, 'Air Astana', 'airastana@gmail.com', '+74953635227', 'KC', 'www.astana.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (5, 'Air Moldova', 'airmoldova@airmoldova.com', null, '9U', 'www.airmoldova.md');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (6, 'Austrian', null, '+74959253955', 'OS', 'www.aua.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (7, 'Avia Traffic Company', 'atc@aero.kg', '+79264192273', 'YK', 'www.aero.kg');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (8, 'Azal', 'moscow@azalavia.ru', '+74952201897', 'J2', 'www.azal.az');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (9, 'Belavia', 'info@belavia.by', '+74956221882', 'B2', 'www.belavia.by');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (10, 'British airways', null, '+74997514713', 'BA', 'www.ba.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (11, 'Egypt Air', 'egyptairmoscow@yahoo.com', '+74959271623', 'MS', 'www.egyptair.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (12, 'EL AL', null, '+74955550959', 'LY', 'www.elal.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (13, 'Emirates', null, '+78005553929', 'EK', 'www.emirates.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (14, 'Ethiopian Airlines', 'ethiopian@airlines.com', null, 'ET', 'www.ethiair.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (15, 'Etihad', null, '+74992223386', 'EY', 'www.etihad.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (16, 'Gulf Air', 'gulfair@discovertheworld.ru', '+74957241470', 'GF', 'www.gulfair.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (17, 'Iberia', null, '+74951315262', 'IB', 'www.iberia.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (18, 'Lufthansa', null, '+74954138424', 'LH', 'www.lufthansa.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (19, 'NordStar', 'info@nordstar.ru', null, 'Y7', 'www.nordstar.su');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (21, 'Pegasus', 'info@flypgs.com', null, 'PC', 'www.flypgs.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (22, 'Qatar', null, '+74959215072', 'QR', 'www.qatarairways.com');
insert into airlines (airline_id, company_name, email, phone, company_code, website) values (23, 'Red Wings', 'info@flyredwings.com', '+74952151358', 'WZ', 'www.flyredwings.com');