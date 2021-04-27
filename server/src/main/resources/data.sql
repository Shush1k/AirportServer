drop table if exists airlines_flight cascade;
drop table if exists routes_flight cascade;
drop table if exists flights cascade;
drop table if exists airlines cascade;
drop table if exists routes cascade;
drop table if exists users cascade;

create table airlines
(
    airline_id   bigint auto_increment
        primary key,
    company_code varchar(255) not null,
    company_name varchar(255) not null,
    email        varchar(255) null,
    phone        varchar(255) null,
    website      varchar(255) not null,
    constraint UK_7g49xa70lkfq28inwu57m3fam
        unique (company_code),
    constraint UK_9k7mrq5efbudcfvvnpoeqe0a3
        unique (website),
    constraint UK_e4sqx3he4mppxr5vxo0dpuxfc
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
    plane_model    varchar(255) not null,
    status         varchar(255) null,
    type           varchar(255) not null,
    company_code   bigint       null,
    route_id       bigint       null,
    constraint FKggm6k4h1glfes1nsg0wesanvy
        foreign key (route_id) references routes (route_id),
    constraint FKq243ppr3q6r9fi272d57pjbpb
        foreign key (company_code) references airlines (airline_id)
);

create table airlines_flight
(
    airline_entity_airline_id bigint not null,
    flight_flight_id          bigint not null,
    primary key (airline_entity_airline_id, flight_flight_id),
    constraint UK_jhmru1dt8mvx3kfg45vmbxuci
        unique (flight_flight_id),
    constraint FK15m93fkegjdmnl4em2yajv019
        foreign key (airline_entity_airline_id) references airlines (airline_id),
    constraint FK1wkn58ie7bwuisa4gln5jtvlp
        foreign key (flight_flight_id) references flights (flight_id)
);

create table routes_flight
(
    route_entity_route_id bigint not null,
    flight_flight_id      bigint not null,
    primary key (route_entity_route_id, flight_flight_id),
    constraint UK_rtl2agnb5t8xx5vv727cecd9u
        unique (flight_flight_id),
    constraint FKcnslwk4lk80m3vy8e3o1pm98k
        foreign key (flight_flight_id) references flights (flight_id),
    constraint FKtid6s7mryf7e9yry8yhl1lqsa
        foreign key (route_entity_route_id) references routes (route_id)
);

create table users
(
    user_id      bigint auto_increment
        primary key,
    birth_date   date         null,
    email        varchar(40)  not null,
    first_name   varchar(40)  not null,
    last_name    varchar(40)  not null,
    login        varchar(40)  not null,
    password     varchar(255) not null,
    phone_number varchar(20)  null,
    constraint UK_6dotkott2kjsp8vw4d0m25fb7
        unique (email),
    constraint UK_ow0gan20590jrb00upg3va2fn
        unique (login)
);



# users
insert into users(email, first_name, last_name, login, password)
values ('aleksandr@mail.ru', 'aleksandr', 'aleksandrov', 'aleksandr@mail.ru', '132855669868590f3e1e9b22f3504d6ba78fda16ae0d003b834c43a47a3c804c');
insert into users(email, first_name, last_name, login, password)
values ('ivan12@mail.ru', 'ivan', 'ivanov', 'ivan12@mail.ru', '132855669868590f3e1e9b22f3504d6ba78fda16ae0d003b834c43a47a3c804c');
insert into users(email, first_name, last_name, login, password, birth_date)
values ('ivan@mail.ru', 'ivan', 'ivanov', 'ivan@mail.ru', '132855669868590f3e1e9b22f3504d6ba78fda16ae0d003b834c43a47a3c804c', '2001-08-18');

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
insert into routes (route_id, arrival_city, departure_city) values (37, 'Калининград', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (38, 'Омск', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (39, 'Челябинск', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (40, 'Екатеринбург', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (41, 'Тюмень', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (42, 'Томск', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (43, 'Барнаул', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (44, 'Нижний Новгород', 'Москва');
insert into routes (route_id, arrival_city, departure_city) values (45, 'Москва', 'Тюмень');
insert into routes (route_id, arrival_city, departure_city) values (46, 'Москва', 'Челябинск');
insert into routes (route_id, arrival_city, departure_city) values (47, 'Москва', 'Пермь');

# airlines
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (1, 'S7', 'S7', 'S7@mail.ru', '+79853239844', 'www.s7.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (2, 'A3', 'Aegean', 'aegean@gmail.com', '+79853219144', 'www.aegean.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (3, 'G9', 'Air Arabia', 'arabia@gmail.com', '+74959355422', 'www.airarabia.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (4, 'KC', 'Air Astana', 'airastana@gmail.com', '+74953635227', 'www.astana.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (5, '9U', 'Air Moldova', 'airmoldova@airmoldova.com', null, 'www.airmoldova.md');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (6, 'OS', 'Austrian', null, '+74959253955', 'www.aua.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (7, 'YK', 'Avia Traffic Company', 'atc@aero.kg', '+79264192273', 'www.aero.kg');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (8, 'J2', 'Azal', 'moscow@azalavia.ru', '+74952201897', 'www.azal.az');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (9, 'B2', 'Belavia', 'info@belavia.by', '+74956221882', 'www.belavia.by');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (10, 'BA', 'British airways', null, '+74997514713', 'www.ba.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (11, 'MS', 'Egypt Air', 'egyptairmoscow@yahoo.com', '+74959271623', 'www.egyptair.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (12, 'LY', 'EL AL', null, '+74955550959', 'www.elal.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (13, 'EK', 'Emirates', null, '+78005553929', 'www.emirates.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (14, 'ET', 'Ethiopian Airlines', 'ethiopian@airlines.com', null, 'www.ethiair.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (15, 'EY', 'Etihad', null, '+74992223386', 'www.etihad.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (16, 'GF', 'Gulf Air', 'gulfair@discovertheworld.ru', '+74957241470', 'www.gulfair.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (17, 'IB', 'Iberia', null, '+74951315262', 'www.iberia.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (18, 'LH', 'Lufthansa', null, '+74954138424', 'www.lufthansa.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (19, 'Y7', 'NordStar', 'info@nordstar.ru', null, 'www.nordstar.su');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (21, 'PC', 'Pegasus', 'info@flypgs.com', null, 'www.flypgs.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (22, 'QR', 'Qatar', null, '+74959215072', 'www.qatarairways.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (23, 'WZ', 'Red Wings', 'info@flyredwings.com', '+74952151358', 'www.flyredwings.com');
insert into airlines (airline_id, company_code, company_name, email, phone, website) values (24, 'U6', 'Уральские авиалинии', 'info@uralairlines.ru', '+78007710222', 'www.uralairlines.ru');

# flights
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (1, '2021-04-26 18:43:00', '2021-04-26 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (2, '2021-04-26 16:10:00', '2021-04-26 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (3, '2021-04-26 10:10:00', '2021-04-26 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (4, '2021-04-25 10:52:00', '2021-04-25 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (5, '2021-04-25 13:52:00', '2021-04-25 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (6, '2021-04-25 11:12:00', '2021-04-25 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (7, '2021-04-25 12:10:00', '2021-04-25 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (8, '2021-04-25 14:16:00', '2021-04-25 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (9, '2021-04-25 10:16:00', '2021-04-25 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (10, '2021-04-25 13:56:00', '2021-04-25 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (11, '2021-04-26 09:30:00', '2021-04-26 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (12, '2021-04-26 18:00:00', '2021-04-26 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (13, '2021-04-26 08:40:00', '2021-04-26 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (14, '2021-04-25 08:48:00', '2021-04-25 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (15, '2021-04-25 10:08:00', '2021-04-25 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (16, '2021-04-25 10:32:00', '2021-04-25 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (17, '2021-04-25 10:02:00', '2021-04-25 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (18, '2021-04-25 10:39:00', '2021-04-25 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (19, '2021-04-25 10:33:00', '2021-04-25 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (20, '2021-04-26 08:30:00', '2021-04-26 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (21, '2021-04-26 18:13:00', '2021-04-26 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (22, '2021-04-26 16:10:00', '2021-04-26 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (23, '2021-04-26 22:10:00', '2021-04-26 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (24, '2021-04-26 10:30:00', '2021-04-26 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (25, '2021-04-26 17:30:00', '2021-04-26 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (26, '2021-04-26 17:30:00', '2021-04-26 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (27, '2021-04-26 19:22:00', '2021-04-26 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (28, '2021-04-26 19:22:00', '2021-04-26 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (29, '2021-04-26 10:25:00', '2021-04-26 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (30, '2021-04-26 14:37:00', '2021-04-26 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);

# U6 прилет
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (31, '2021-04-26 00:10:00', '2021-04-25 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (32, '2021-04-26 04:00:00', '2021-04-26 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (33, '2021-04-26 07:15:00', '2021-04-26 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (34, '2021-04-26 07:10:00', '2021-04-26 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (35, '2021-04-26 07:19:00', '2021-04-26 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (36, '2021-04-26 07:27:00', '2021-04-26 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (37, '2021-04-26 07:50:00', '2021-04-26 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (38, '2021-04-26 07:40:00', '2021-04-26 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (39, '2021-04-26 08:30:00', '2021-04-26 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (40, '2021-04-26 08:10:00', '2021-04-26 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
# U6 вылет
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (41, '2021-04-26 02:50:00', '2021-04-26 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (42, '2021-04-26 02:50:00', '2021-04-26 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (flight_id, arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values (43, '2021-04-26 08:50:00', '2021-04-26 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);