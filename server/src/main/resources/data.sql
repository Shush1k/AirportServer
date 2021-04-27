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

# на Май
-- A3 890
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 18:43:00', '2021-05-1 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 18:43:00', '2021-05-2 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 18:43:00', '2021-05-3 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 18:43:00', '2021-05-4 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 18:43:00', '2021-05-5 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 18:43:00', '2021-05-6 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 18:43:00', '2021-05-7 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 18:43:00', '2021-05-8 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 18:43:00', '2021-05-9 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 18:43:00', '2021-05-10 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 18:43:00', '2021-05-11 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 18:43:00', '2021-05-12 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 18:43:00', '2021-05-13 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 18:43:00', '2021-05-14 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 18:43:00', '2021-05-15 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 18:43:00', '2021-05-16 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 18:43:00', '2021-05-17 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 18:43:00', '2021-05-18 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 18:43:00', '2021-05-19 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 18:43:00', '2021-05-20 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 18:43:00', '2021-05-21 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 18:43:00', '2021-05-22 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 18:43:00', '2021-05-23 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 18:43:00', '2021-05-24 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 18:43:00', '2021-05-25 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 18:43:00', '2021-05-26 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 18:43:00', '2021-05-27 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 18:43:00', '2021-05-28 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 18:43:00', '2021-05-29 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 18:43:00', '2021-05-30 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 18:43:00', '2021-05-31 15:10:00', 'A3 890', 'Boeing 737-800', 'ожидает', 'вылет', 2, 1);

-- A3 822
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 16:10:00', '2021-05-1 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 16:10:00', '2021-05-2 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 16:10:00', '2021-05-3 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 16:10:00', '2021-05-4 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 16:10:00', '2021-05-5 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 16:10:00', '2021-05-6 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 16:10:00', '2021-05-7 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 16:10:00', '2021-05-8 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 16:10:00', '2021-05-9 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 16:10:00', '2021-05-10 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 16:10:00', '2021-05-11 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 16:10:00', '2021-05-12 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 16:10:00', '2021-05-13 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 16:10:00', '2021-05-14 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 16:10:00', '2021-05-15 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 16:10:00', '2021-05-16 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 16:10:00', '2021-05-17 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 16:10:00', '2021-05-18 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 16:10:00', '2021-05-19 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 16:10:00', '2021-05-20 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 16:10:00', '2021-05-21 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 16:10:00', '2021-05-22 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 16:10:00', '2021-05-23 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 16:10:00', '2021-05-24 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 16:10:00', '2021-05-25 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 16:10:00', '2021-05-26 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 16:10:00', '2021-05-27 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 16:10:00', '2021-05-28 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 16:10:00', '2021-05-29 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 16:10:00', '2021-05-30 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 16:10:00', '2021-05-31 14:30:00', 'A3 822', 'Boeing 737-800', 'ожидает', 'вылет', 2, 2);

-- S7 2504
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:10:00', '2021-05-1 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:10:00', '2021-05-2 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:10:00', '2021-05-3 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:10:00', '2021-05-4 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:10:00', '2021-05-5 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:10:00', '2021-05-6 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:10:00', '2021-05-7 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:10:00', '2021-05-8 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:10:00', '2021-05-9 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:10:00', '2021-05-10 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:10:00', '2021-05-11 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:10:00', '2021-05-12 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:10:00', '2021-05-13 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:10:00', '2021-05-14 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:10:00', '2021-05-15 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:10:00', '2021-05-16 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:10:00', '2021-05-17 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:10:00', '2021-05-18 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:10:00', '2021-05-19 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:10:00', '2021-05-20 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:10:00', '2021-05-21 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:10:00', '2021-05-22 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:10:00', '2021-05-23 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:10:00', '2021-05-24 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:10:00', '2021-05-25 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:10:00', '2021-05-26 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:10:00', '2021-05-27 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:10:00', '2021-05-28 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:10:00', '2021-05-29 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:10:00', '2021-05-30 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:10:00', '2021-05-31 08:00:00', 'S7 2504', 'Boeing-787', 'ожидает', 'вылет', 1, 3);

-- EY 8651
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:52:00', '2021-05-1 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:52:00', '2021-05-2 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:52:00', '2021-05-3 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:52:00', '2021-05-4 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:52:00', '2021-05-5 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:52:00', '2021-05-6 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:52:00', '2021-05-7 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:52:00', '2021-05-8 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:52:00', '2021-05-9 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:52:00', '2021-05-10 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:52:00', '2021-05-11 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:52:00', '2021-05-12 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:52:00', '2021-05-13 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:52:00', '2021-05-14 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:52:00', '2021-05-15 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:52:00', '2021-05-16 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:52:00', '2021-05-17 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:52:00', '2021-05-18 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:52:00', '2021-05-19 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:52:00', '2021-05-20 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:52:00', '2021-05-21 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:52:00', '2021-05-22 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:52:00', '2021-05-23 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:52:00', '2021-05-24 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:52:00', '2021-05-25 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:52:00', '2021-05-26 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:52:00', '2021-05-27 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:52:00', '2021-05-28 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:52:00', '2021-05-29 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:52:00', '2021-05-30 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:52:00', '2021-05-31 07:16:00', 'EY 8651', 'Airbus 321', 'Прибыл', 'вылет', 15, 11);

-- S7 3751
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 13:52:00', '2021-05-1 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 13:52:00', '2021-05-2 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 13:52:00', '2021-05-3 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 13:52:00', '2021-05-4 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 13:52:00', '2021-05-5 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 13:52:00', '2021-05-6 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 13:52:00', '2021-05-7 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 13:52:00', '2021-05-8 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 13:52:00', '2021-05-9 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 13:52:00', '2021-05-10 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 13:52:00', '2021-05-11 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 13:52:00', '2021-05-12 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 13:52:00', '2021-05-13 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 13:52:00', '2021-05-14 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 13:52:00', '2021-05-15 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 13:52:00', '2021-05-16 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 13:52:00', '2021-05-17 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 13:52:00', '2021-05-18 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 13:52:00', '2021-05-19 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 13:52:00', '2021-05-20 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 13:52:00', '2021-05-21 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 13:52:00', '2021-05-22 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 13:52:00', '2021-05-23 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 13:52:00', '2021-05-24 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 13:52:00', '2021-05-25 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 13:52:00', '2021-05-26 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 13:52:00', '2021-05-27 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 13:52:00', '2021-05-28 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 13:52:00', '2021-05-29 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 13:52:00', '2021-05-30 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 13:52:00', '2021-05-31 11:35:00', 'S7 3751', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);

-- S7 3251
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 11:12:00', '2021-05-1 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 11:12:00', '2021-05-2 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 11:12:00', '2021-05-3 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 11:12:00', '2021-05-4 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 11:12:00', '2021-05-5 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 11:12:00', '2021-05-6 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 11:12:00', '2021-05-7 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 11:12:00', '2021-05-8 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 11:12:00', '2021-05-9 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 11:12:00', '2021-05-10 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 11:12:00', '2021-05-11 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 11:12:00', '2021-05-12 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 11:12:00', '2021-05-13 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 11:12:00', '2021-05-14 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 11:12:00', '2021-05-15 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 11:12:00', '2021-05-16 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 11:12:00', '2021-05-17 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 11:12:00', '2021-05-18 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 11:12:00', '2021-05-19 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 11:12:00', '2021-05-20 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 11:12:00', '2021-05-21 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 11:12:00', '2021-05-22 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 11:12:00', '2021-05-23 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 11:12:00', '2021-05-24 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 11:12:00', '2021-05-25 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 11:12:00', '2021-05-26 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 11:12:00', '2021-05-27 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 11:12:00', '2021-05-28 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 11:12:00', '2021-05-29 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 11:12:00', '2021-05-30 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 11:12:00', '2021-05-31 09:35:00', 'S7 3251', 'Airbus 321', 'Прибыл', 'вылет', 1, 8);

-- BA 3411
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 12:10:00', '2021-05-1 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 12:10:00', '2021-05-2 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 12:10:00', '2021-05-3 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 12:10:00', '2021-05-4 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 12:10:00', '2021-05-5 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 12:10:00', '2021-05-6 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 12:10:00', '2021-05-7 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 12:10:00', '2021-05-8 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 12:10:00', '2021-05-9 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 12:10:00', '2021-05-10 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 12:10:00', '2021-05-11 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 12:10:00', '2021-05-12 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 12:10:00', '2021-05-13 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 12:10:00', '2021-05-14 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 12:10:00', '2021-05-15 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 12:10:00', '2021-05-16 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 12:10:00', '2021-05-17 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 12:10:00', '2021-05-18 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 12:10:00', '2021-05-19 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 12:10:00', '2021-05-20 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 12:10:00', '2021-05-21 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 12:10:00', '2021-05-22 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 12:10:00', '2021-05-23 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 12:10:00', '2021-05-24 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 12:10:00', '2021-05-25 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 12:10:00', '2021-05-26 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 12:10:00', '2021-05-27 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 12:10:00', '2021-05-28 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 12:10:00', '2021-05-29 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 12:10:00', '2021-05-30 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 12:10:00', '2021-05-31 10:35:00', 'BA 3411', 'Airbus 321', 'Прибыл', 'вылет', 10, 10);

-- EK 713
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 14:16:00', '2021-05-1 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 14:16:00', '2021-05-2 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 14:16:00', '2021-05-3 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 14:16:00', '2021-05-4 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 14:16:00', '2021-05-5 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 14:16:00', '2021-05-6 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 14:16:00', '2021-05-7 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 14:16:00', '2021-05-8 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 14:16:00', '2021-05-9 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 14:16:00', '2021-05-10 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 14:16:00', '2021-05-11 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 14:16:00', '2021-05-12 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 14:16:00', '2021-05-13 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 14:16:00', '2021-05-14 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 14:16:00', '2021-05-15 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 14:16:00', '2021-05-16 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 14:16:00', '2021-05-17 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 14:16:00', '2021-05-18 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 14:16:00', '2021-05-19 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 14:16:00', '2021-05-20 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 14:16:00', '2021-05-21 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 14:16:00', '2021-05-22 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 14:16:00', '2021-05-23 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 14:16:00', '2021-05-24 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 14:16:00', '2021-05-25 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 14:16:00', '2021-05-26 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 14:16:00', '2021-05-27 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 14:16:00', '2021-05-28 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 14:16:00', '2021-05-29 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 14:16:00', '2021-05-30 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 14:16:00', '2021-05-31 10:22:00', 'EK 713', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);

-- EK 618
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:16:00', '2021-05-1 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:16:00', '2021-05-2 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:16:00', '2021-05-3 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:16:00', '2021-05-4 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:16:00', '2021-05-5 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:16:00', '2021-05-6 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:16:00', '2021-05-7 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:16:00', '2021-05-8 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:16:00', '2021-05-9 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:16:00', '2021-05-10 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:16:00', '2021-05-11 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:16:00', '2021-05-12 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:16:00', '2021-05-13 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:16:00', '2021-05-14 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:16:00', '2021-05-15 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:16:00', '2021-05-16 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:16:00', '2021-05-17 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:16:00', '2021-05-18 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:16:00', '2021-05-19 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:16:00', '2021-05-20 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:16:00', '2021-05-21 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:16:00', '2021-05-22 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:16:00', '2021-05-23 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:16:00', '2021-05-24 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:16:00', '2021-05-25 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:16:00', '2021-05-26 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:16:00', '2021-05-27 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:16:00', '2021-05-28 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:16:00', '2021-05-29 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:16:00', '2021-05-30 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:16:00', '2021-05-31 07:22:00', 'EK 618', 'Boeing-787', 'Прибыл', 'вылет', 13, 4);

-- S7 6182
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 13:56:00', '2021-05-1 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 13:56:00', '2021-05-2 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 13:56:00', '2021-05-3 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 13:56:00', '2021-05-4 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 13:56:00', '2021-05-5 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 13:56:00', '2021-05-6 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 13:56:00', '2021-05-7 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 13:56:00', '2021-05-8 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 13:56:00', '2021-05-9 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 13:56:00', '2021-05-10 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 13:56:00', '2021-05-11 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 13:56:00', '2021-05-12 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 13:56:00', '2021-05-13 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 13:56:00', '2021-05-14 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 13:56:00', '2021-05-15 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 13:56:00', '2021-05-16 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 13:56:00', '2021-05-17 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 13:56:00', '2021-05-18 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 13:56:00', '2021-05-19 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 13:56:00', '2021-05-20 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 13:56:00', '2021-05-21 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 13:56:00', '2021-05-22 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 13:56:00', '2021-05-23 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 13:56:00', '2021-05-24 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 13:56:00', '2021-05-25 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 13:56:00', '2021-05-26 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 13:56:00', '2021-05-27 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 13:56:00', '2021-05-28 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 13:56:00', '2021-05-29 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 13:56:00', '2021-05-30 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 13:56:00', '2021-05-31 11:03:00', 'S7 6182', 'Boeing-787', 'Прибыл', 'вылет', 1, 4);

-- B2 763
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 09:30:00', '2021-05-1 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 09:30:00', '2021-05-2 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 09:30:00', '2021-05-3 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 09:30:00', '2021-05-4 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 09:30:00', '2021-05-5 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 09:30:00', '2021-05-6 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 09:30:00', '2021-05-7 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 09:30:00', '2021-05-8 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 09:30:00', '2021-05-9 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 09:30:00', '2021-05-10 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 09:30:00', '2021-05-11 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 09:30:00', '2021-05-12 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 09:30:00', '2021-05-13 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 09:30:00', '2021-05-14 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 09:30:00', '2021-05-15 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 09:30:00', '2021-05-16 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 09:30:00', '2021-05-17 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 09:30:00', '2021-05-18 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 09:30:00', '2021-05-19 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 09:30:00', '2021-05-20 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 09:30:00', '2021-05-21 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 09:30:00', '2021-05-22 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 09:30:00', '2021-05-23 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 09:30:00', '2021-05-24 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 09:30:00', '2021-05-25 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 09:30:00', '2021-05-26 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 09:30:00', '2021-05-27 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 09:30:00', '2021-05-28 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 09:30:00', '2021-05-29 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 09:30:00', '2021-05-30 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 09:30:00', '2021-05-31 07:03:00', 'B2 763', 'Boeing 737-800', 'ожидает', 'прилет', 9, 1);

-- S7 2502
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 18:00:00', '2021-05-1 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 18:00:00', '2021-05-2 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 18:00:00', '2021-05-3 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 18:00:00', '2021-05-4 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 18:00:00', '2021-05-5 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 18:00:00', '2021-05-6 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 18:00:00', '2021-05-7 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 18:00:00', '2021-05-8 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 18:00:00', '2021-05-9 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 18:00:00', '2021-05-10 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 18:00:00', '2021-05-11 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 18:00:00', '2021-05-12 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 18:00:00', '2021-05-13 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 18:00:00', '2021-05-14 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 18:00:00', '2021-05-15 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 18:00:00', '2021-05-16 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 18:00:00', '2021-05-17 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 18:00:00', '2021-05-18 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 18:00:00', '2021-05-19 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 18:00:00', '2021-05-20 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 18:00:00', '2021-05-21 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 18:00:00', '2021-05-22 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 18:00:00', '2021-05-23 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 18:00:00', '2021-05-24 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 18:00:00', '2021-05-25 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 18:00:00', '2021-05-26 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 18:00:00', '2021-05-27 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 18:00:00', '2021-05-28 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 18:00:00', '2021-05-29 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 18:00:00', '2021-05-30 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 18:00:00', '2021-05-31 15:00:00', 'S7 2502', 'Boeing 737-800', 'ожидает', 'прилет', 1, 4);

-- B2 134
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 08:40:00', '2021-05-1 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 08:40:00', '2021-05-2 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 08:40:00', '2021-05-3 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 08:40:00', '2021-05-4 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 08:40:00', '2021-05-5 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 08:40:00', '2021-05-6 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 08:40:00', '2021-05-7 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 08:40:00', '2021-05-8 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 08:40:00', '2021-05-9 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 08:40:00', '2021-05-10 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 08:40:00', '2021-05-11 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 08:40:00', '2021-05-12 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 08:40:00', '2021-05-13 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 08:40:00', '2021-05-14 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 08:40:00', '2021-05-15 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 08:40:00', '2021-05-16 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 08:40:00', '2021-05-17 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 08:40:00', '2021-05-18 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 08:40:00', '2021-05-19 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 08:40:00', '2021-05-20 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 08:40:00', '2021-05-21 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 08:40:00', '2021-05-22 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 08:40:00', '2021-05-23 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 08:40:00', '2021-05-24 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 08:40:00', '2021-05-25 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 08:40:00', '2021-05-26 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 08:40:00', '2021-05-27 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 08:40:00', '2021-05-28 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 08:40:00', '2021-05-29 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 08:40:00', '2021-05-30 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 08:40:00', '2021-05-31 04:45:00', 'B2 134', 'Boeing 737-800', 'ожидает', 'прилет', 9, 5);

-- S7 3032
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 08:48:00', '2021-05-1 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 08:48:00', '2021-05-2 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 08:48:00', '2021-05-3 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 08:48:00', '2021-05-4 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 08:48:00', '2021-05-5 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 08:48:00', '2021-05-6 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 08:48:00', '2021-05-7 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 08:48:00', '2021-05-8 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 08:48:00', '2021-05-9 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 08:48:00', '2021-05-10 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 08:48:00', '2021-05-11 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 08:48:00', '2021-05-12 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 08:48:00', '2021-05-13 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 08:48:00', '2021-05-14 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 08:48:00', '2021-05-15 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 08:48:00', '2021-05-16 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 08:48:00', '2021-05-17 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 08:48:00', '2021-05-18 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 08:48:00', '2021-05-19 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 08:48:00', '2021-05-20 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 08:48:00', '2021-05-21 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 08:48:00', '2021-05-22 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 08:48:00', '2021-05-23 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 08:48:00', '2021-05-24 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 08:48:00', '2021-05-25 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 08:48:00', '2021-05-26 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 08:48:00', '2021-05-27 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 08:48:00', '2021-05-28 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 08:48:00', '2021-05-29 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 08:48:00', '2021-05-30 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 08:48:00', '2021-05-31 02:36:00', 'S7 3032', '32N', 'Прибыл', 'прилет', 1, 10);

-- Y7 106
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:08:00', '2021-05-1 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:08:00', '2021-05-2 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:08:00', '2021-05-3 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:08:00', '2021-05-4 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:08:00', '2021-05-5 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:08:00', '2021-05-6 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:08:00', '2021-05-7 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:08:00', '2021-05-8 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:08:00', '2021-05-9 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:08:00', '2021-05-10 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:08:00', '2021-05-11 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:08:00', '2021-05-12 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:08:00', '2021-05-13 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:08:00', '2021-05-14 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:08:00', '2021-05-15 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:08:00', '2021-05-16 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:08:00', '2021-05-17 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:08:00', '2021-05-18 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:08:00', '2021-05-19 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:08:00', '2021-05-20 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:08:00', '2021-05-21 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:08:00', '2021-05-22 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:08:00', '2021-05-23 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:08:00', '2021-05-24 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:08:00', '2021-05-25 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:08:00', '2021-05-26 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:08:00', '2021-05-27 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:08:00', '2021-05-28 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:08:00', '2021-05-29 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:08:00', '2021-05-30 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:08:00', '2021-05-31 05:34:00', 'Y7 106', 'Boeing 737-300', 'Прибыл', 'прилет', 19, 10);

-- S7 2618
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:32:00', '2021-05-1 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:32:00', '2021-05-2 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:32:00', '2021-05-3 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:32:00', '2021-05-4 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:32:00', '2021-05-5 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:32:00', '2021-05-6 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:32:00', '2021-05-7 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:32:00', '2021-05-8 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:32:00', '2021-05-9 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:32:00', '2021-05-10 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:32:00', '2021-05-11 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:32:00', '2021-05-12 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:32:00', '2021-05-13 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:32:00', '2021-05-14 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:32:00', '2021-05-15 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:32:00', '2021-05-16 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:32:00', '2021-05-17 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:32:00', '2021-05-18 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:32:00', '2021-05-19 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:32:00', '2021-05-20 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:32:00', '2021-05-21 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:32:00', '2021-05-22 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:32:00', '2021-05-23 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:32:00', '2021-05-24 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:32:00', '2021-05-25 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:32:00', '2021-05-26 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:32:00', '2021-05-27 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:32:00', '2021-05-28 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:32:00', '2021-05-29 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:32:00', '2021-05-30 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:32:00', '2021-05-31 07:02:00', 'S7 2618', 'Airbus 320-200', 'Прибыл', 'прилет', 1, 9);

-- S7 1204
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:02:00', '2021-05-1 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:02:00', '2021-05-2 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:02:00', '2021-05-3 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:02:00', '2021-05-4 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:02:00', '2021-05-5 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:02:00', '2021-05-6 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:02:00', '2021-05-7 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:02:00', '2021-05-8 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:02:00', '2021-05-9 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:02:00', '2021-05-10 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:02:00', '2021-05-11 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:02:00', '2021-05-12 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:02:00', '2021-05-13 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:02:00', '2021-05-14 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:02:00', '2021-05-15 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:02:00', '2021-05-16 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:02:00', '2021-05-17 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:02:00', '2021-05-18 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:02:00', '2021-05-19 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:02:00', '2021-05-20 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:02:00', '2021-05-21 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:02:00', '2021-05-22 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:02:00', '2021-05-23 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:02:00', '2021-05-24 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:02:00', '2021-05-25 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:02:00', '2021-05-26 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:02:00', '2021-05-27 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:02:00', '2021-05-28 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:02:00', '2021-05-29 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:02:00', '2021-05-30 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:02:00', '2021-05-31 09:06:00', 'S7 1204', 'Embraer ERJ-170', 'Прибыл', 'прилет', 1, 9);

-- EY 8659
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:39:00', '2021-05-1 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:39:00', '2021-05-2 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:39:00', '2021-05-3 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:39:00', '2021-05-4 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:39:00', '2021-05-5 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:39:00', '2021-05-6 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:39:00', '2021-05-7 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:39:00', '2021-05-8 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:39:00', '2021-05-9 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:39:00', '2021-05-10 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:39:00', '2021-05-11 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:39:00', '2021-05-12 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:39:00', '2021-05-13 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:39:00', '2021-05-14 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:39:00', '2021-05-15 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:39:00', '2021-05-16 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:39:00', '2021-05-17 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:39:00', '2021-05-18 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:39:00', '2021-05-19 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:39:00', '2021-05-20 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:39:00', '2021-05-21 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:39:00', '2021-05-22 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:39:00', '2021-05-23 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:39:00', '2021-05-24 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:39:00', '2021-05-25 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:39:00', '2021-05-26 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:39:00', '2021-05-27 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:39:00', '2021-05-28 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:39:00', '2021-05-29 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:39:00', '2021-05-30 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:39:00', '2021-05-31 06:06:00', 'EY 8659', 'Boeing 737-800', 'Прибыл', 'прилет', 15, 11);

-- EK 7826
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:33:00', '2021-05-1 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:33:00', '2021-05-2 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:33:00', '2021-05-3 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:33:00', '2021-05-4 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:33:00', '2021-05-5 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:33:00', '2021-05-6 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:33:00', '2021-05-7 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:33:00', '2021-05-8 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:33:00', '2021-05-9 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:33:00', '2021-05-10 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:33:00', '2021-05-11 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:33:00', '2021-05-12 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:33:00', '2021-05-13 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:33:00', '2021-05-14 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:33:00', '2021-05-15 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:33:00', '2021-05-16 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:33:00', '2021-05-17 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:33:00', '2021-05-18 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:33:00', '2021-05-19 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:33:00', '2021-05-20 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:33:00', '2021-05-21 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:33:00', '2021-05-22 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:33:00', '2021-05-23 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:33:00', '2021-05-24 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:33:00', '2021-05-25 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:33:00', '2021-05-26 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:33:00', '2021-05-27 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:33:00', '2021-05-28 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:33:00', '2021-05-29 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:33:00', '2021-05-30 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:33:00', '2021-05-31 07:23:00', 'EK 7826', 'Airbus 321', 'Прибыл', 'прилет', 13, 33);

-- J2 705
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 08:30:00', '2021-05-1 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 08:30:00', '2021-05-2 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 08:30:00', '2021-05-3 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 08:30:00', '2021-05-4 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 08:30:00', '2021-05-5 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 08:30:00', '2021-05-6 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 08:30:00', '2021-05-7 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 08:30:00', '2021-05-8 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 08:30:00', '2021-05-9 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 08:30:00', '2021-05-10 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 08:30:00', '2021-05-11 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 08:30:00', '2021-05-12 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 08:30:00', '2021-05-13 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 08:30:00', '2021-05-14 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 08:30:00', '2021-05-15 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 08:30:00', '2021-05-16 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 08:30:00', '2021-05-17 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 08:30:00', '2021-05-18 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 08:30:00', '2021-05-19 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 08:30:00', '2021-05-20 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 08:30:00', '2021-05-21 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 08:30:00', '2021-05-22 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 08:30:00', '2021-05-23 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 08:30:00', '2021-05-24 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 08:30:00', '2021-05-25 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 08:30:00', '2021-05-26 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 08:30:00', '2021-05-27 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 08:30:00', '2021-05-28 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 08:30:00', '2021-05-29 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 08:30:00', '2021-05-30 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 08:30:00', '2021-05-31 06:30:00', 'J2 705', 'Boeing-787', 'ожидает', 'прилет', 8, 2);

-- G9 891
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 18:13:00', '2021-05-1 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 18:13:00', '2021-05-2 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 18:13:00', '2021-05-3 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 18:13:00', '2021-05-4 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 18:13:00', '2021-05-5 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 18:13:00', '2021-05-6 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 18:13:00', '2021-05-7 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 18:13:00', '2021-05-8 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 18:13:00', '2021-05-9 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 18:13:00', '2021-05-10 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 18:13:00', '2021-05-11 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 18:13:00', '2021-05-12 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 18:13:00', '2021-05-13 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 18:13:00', '2021-05-14 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 18:13:00', '2021-05-15 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 18:13:00', '2021-05-16 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 18:13:00', '2021-05-17 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 18:13:00', '2021-05-18 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 18:13:00', '2021-05-19 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 18:13:00', '2021-05-20 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 18:13:00', '2021-05-21 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 18:13:00', '2021-05-22 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 18:13:00', '2021-05-23 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 18:13:00', '2021-05-24 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 18:13:00', '2021-05-25 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 18:13:00', '2021-05-26 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 18:13:00', '2021-05-27 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 18:13:00', '2021-05-28 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 18:13:00', '2021-05-29 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 18:13:00', '2021-05-30 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 18:13:00', '2021-05-31 15:14:00', 'G9 891', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);

-- G9 823
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 16:10:00', '2021-05-1 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 16:10:00', '2021-05-2 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 16:10:00', '2021-05-3 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 16:10:00', '2021-05-4 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 16:10:00', '2021-05-5 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 16:10:00', '2021-05-6 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 16:10:00', '2021-05-7 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 16:10:00', '2021-05-8 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 16:10:00', '2021-05-9 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 16:10:00', '2021-05-10 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 16:10:00', '2021-05-11 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 16:10:00', '2021-05-12 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 16:10:00', '2021-05-13 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 16:10:00', '2021-05-14 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 16:10:00', '2021-05-15 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 16:10:00', '2021-05-16 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 16:10:00', '2021-05-17 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 16:10:00', '2021-05-18 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 16:10:00', '2021-05-19 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 16:10:00', '2021-05-20 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 16:10:00', '2021-05-21 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 16:10:00', '2021-05-22 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 16:10:00', '2021-05-23 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 16:10:00', '2021-05-24 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 16:10:00', '2021-05-25 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 16:10:00', '2021-05-26 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 16:10:00', '2021-05-27 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 16:10:00', '2021-05-28 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 16:10:00', '2021-05-29 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 16:10:00', '2021-05-30 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 16:10:00', '2021-05-31 14:35:00', 'G9 823', 'Boeing 737-800', 'ожидает', 'вылет', 3, 24);

-- G9 829
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 22:10:00', '2021-05-1 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 22:10:00', '2021-05-2 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 22:10:00', '2021-05-3 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 22:10:00', '2021-05-4 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 22:10:00', '2021-05-5 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 22:10:00', '2021-05-6 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 22:10:00', '2021-05-7 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 22:10:00', '2021-05-8 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 22:10:00', '2021-05-9 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 22:10:00', '2021-05-10 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 22:10:00', '2021-05-11 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 22:10:00', '2021-05-12 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 22:10:00', '2021-05-13 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 22:10:00', '2021-05-14 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 22:10:00', '2021-05-15 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 22:10:00', '2021-05-16 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 22:10:00', '2021-05-17 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 22:10:00', '2021-05-18 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 22:10:00', '2021-05-19 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 22:10:00', '2021-05-20 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 22:10:00', '2021-05-21 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 22:10:00', '2021-05-22 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 22:10:00', '2021-05-23 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 22:10:00', '2021-05-24 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 22:10:00', '2021-05-25 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 22:10:00', '2021-05-26 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 22:10:00', '2021-05-27 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 22:10:00', '2021-05-28 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 22:10:00', '2021-05-29 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 22:10:00', '2021-05-30 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 22:10:00', '2021-05-31 18:35:00', 'G9 829', 'Boeing 737-800', 'ожидает', 'вылет', 3, 17);

-- S7 2514
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:30:00', '2021-05-1 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:30:00', '2021-05-2 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:30:00', '2021-05-3 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:30:00', '2021-05-4 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:30:00', '2021-05-5 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:30:00', '2021-05-6 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:30:00', '2021-05-7 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:30:00', '2021-05-8 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:30:00', '2021-05-9 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:30:00', '2021-05-10 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:30:00', '2021-05-11 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:30:00', '2021-05-12 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:30:00', '2021-05-13 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:30:00', '2021-05-14 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:30:00', '2021-05-15 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:30:00', '2021-05-16 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:30:00', '2021-05-17 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:30:00', '2021-05-18 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:30:00', '2021-05-19 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:30:00', '2021-05-20 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:30:00', '2021-05-21 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:30:00', '2021-05-22 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:30:00', '2021-05-23 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:30:00', '2021-05-24 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:30:00', '2021-05-25 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:30:00', '2021-05-26 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:30:00', '2021-05-27 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:30:00', '2021-05-28 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:30:00', '2021-05-29 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:30:00', '2021-05-30 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:30:00', '2021-05-31 08:10:00', 'S7 2514', 'Boeing-787', 'ожидает', 'вылет', 1, 20);

-- S7 2534
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 17:30:00', '2021-05-1 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 17:30:00', '2021-05-2 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 17:30:00', '2021-05-3 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 17:30:00', '2021-05-4 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 17:30:00', '2021-05-5 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 17:30:00', '2021-05-6 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 17:30:00', '2021-05-7 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 17:30:00', '2021-05-8 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 17:30:00', '2021-05-9 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 17:30:00', '2021-05-10 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 17:30:00', '2021-05-11 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 17:30:00', '2021-05-12 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 17:30:00', '2021-05-13 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 17:30:00', '2021-05-14 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 17:30:00', '2021-05-15 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 17:30:00', '2021-05-16 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 17:30:00', '2021-05-17 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 17:30:00', '2021-05-18 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 17:30:00', '2021-05-19 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 17:30:00', '2021-05-20 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 17:30:00', '2021-05-21 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 17:30:00', '2021-05-22 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 17:30:00', '2021-05-23 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 17:30:00', '2021-05-24 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 17:30:00', '2021-05-25 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 17:30:00', '2021-05-26 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 17:30:00', '2021-05-27 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 17:30:00', '2021-05-28 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 17:30:00', '2021-05-29 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 17:30:00', '2021-05-30 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 17:30:00', '2021-05-31 14:30:00', 'S7 2534', 'Boeing 737-800', 'ожидает', 'вылет', 1, 12);

-- MS 534
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 17:30:00', '2021-05-1 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 17:30:00', '2021-05-2 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 17:30:00', '2021-05-3 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 17:30:00', '2021-05-4 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 17:30:00', '2021-05-5 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 17:30:00', '2021-05-6 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 17:30:00', '2021-05-7 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 17:30:00', '2021-05-8 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 17:30:00', '2021-05-9 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 17:30:00', '2021-05-10 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 17:30:00', '2021-05-11 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 17:30:00', '2021-05-12 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 17:30:00', '2021-05-13 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 17:30:00', '2021-05-14 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 17:30:00', '2021-05-15 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 17:30:00', '2021-05-16 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 17:30:00', '2021-05-17 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 17:30:00', '2021-05-18 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 17:30:00', '2021-05-19 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 17:30:00', '2021-05-20 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 17:30:00', '2021-05-21 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 17:30:00', '2021-05-22 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 17:30:00', '2021-05-23 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 17:30:00', '2021-05-24 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 17:30:00', '2021-05-25 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 17:30:00', '2021-05-26 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 17:30:00', '2021-05-27 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 17:30:00', '2021-05-28 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 17:30:00', '2021-05-29 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 17:30:00', '2021-05-30 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 17:30:00', '2021-05-31 14:30:00', 'MS 534', 'Boeing 737-800', 'ожидает', 'вылет', 11, 6);

-- MS 519
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 19:22:00', '2021-05-1 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 19:22:00', '2021-05-2 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 19:22:00', '2021-05-3 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 19:22:00', '2021-05-4 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 19:22:00', '2021-05-5 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 19:22:00', '2021-05-6 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 19:22:00', '2021-05-7 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 19:22:00', '2021-05-8 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 19:22:00', '2021-05-9 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 19:22:00', '2021-05-10 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 19:22:00', '2021-05-11 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 19:22:00', '2021-05-12 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 19:22:00', '2021-05-13 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 19:22:00', '2021-05-14 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 19:22:00', '2021-05-15 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 19:22:00', '2021-05-16 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 19:22:00', '2021-05-17 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 19:22:00', '2021-05-18 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 19:22:00', '2021-05-19 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 19:22:00', '2021-05-20 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 19:22:00', '2021-05-21 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 19:22:00', '2021-05-22 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 19:22:00', '2021-05-23 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 19:22:00', '2021-05-24 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 19:22:00', '2021-05-25 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 19:22:00', '2021-05-26 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 19:22:00', '2021-05-27 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 19:22:00', '2021-05-28 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 19:22:00', '2021-05-29 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 19:22:00', '2021-05-30 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 19:22:00', '2021-05-31 14:11:00', 'MS 519', 'Boeing 737-800', 'ожидает', 'вылет', 11, 7);

-- GF 5191
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 19:22:00', '2021-05-1 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 19:22:00', '2021-05-2 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 19:22:00', '2021-05-3 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 19:22:00', '2021-05-4 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 19:22:00', '2021-05-5 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 19:22:00', '2021-05-6 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 19:22:00', '2021-05-7 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 19:22:00', '2021-05-8 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 19:22:00', '2021-05-9 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 19:22:00', '2021-05-10 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 19:22:00', '2021-05-11 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 19:22:00', '2021-05-12 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 19:22:00', '2021-05-13 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 19:22:00', '2021-05-14 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 19:22:00', '2021-05-15 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 19:22:00', '2021-05-16 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 19:22:00', '2021-05-17 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 19:22:00', '2021-05-18 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 19:22:00', '2021-05-19 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 19:22:00', '2021-05-20 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 19:22:00', '2021-05-21 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 19:22:00', '2021-05-22 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 19:22:00', '2021-05-23 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 19:22:00', '2021-05-24 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 19:22:00', '2021-05-25 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 19:22:00', '2021-05-26 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 19:22:00', '2021-05-27 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 19:22:00', '2021-05-28 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 19:22:00', '2021-05-29 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 19:22:00', '2021-05-30 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 19:22:00', '2021-05-31 18:00:00', 'GF 5191', 'Airbus 321', 'ожидает', 'вылет', 16, 18);

-- GF 3199
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 10:25:00', '2021-05-1 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 10:25:00', '2021-05-2 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 10:25:00', '2021-05-3 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 10:25:00', '2021-05-4 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 10:25:00', '2021-05-5 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 10:25:00', '2021-05-6 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 10:25:00', '2021-05-7 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 10:25:00', '2021-05-8 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 10:25:00', '2021-05-9 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 10:25:00', '2021-05-10 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 10:25:00', '2021-05-11 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 10:25:00', '2021-05-12 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 10:25:00', '2021-05-13 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 10:25:00', '2021-05-14 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 10:25:00', '2021-05-15 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 10:25:00', '2021-05-16 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 10:25:00', '2021-05-17 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 10:25:00', '2021-05-18 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 10:25:00', '2021-05-19 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 10:25:00', '2021-05-20 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 10:25:00', '2021-05-21 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 10:25:00', '2021-05-22 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 10:25:00', '2021-05-23 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 10:25:00', '2021-05-24 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 10:25:00', '2021-05-25 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 10:25:00', '2021-05-26 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 10:25:00', '2021-05-27 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 10:25:00', '2021-05-28 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 10:25:00', '2021-05-29 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 10:25:00', '2021-05-30 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 10:25:00', '2021-05-31 09:01:00', 'GF 3199', 'Airbus 321', 'ожидает', 'вылет', 16, 18);

-- Y7 287
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 14:37:00', '2021-05-1 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 14:37:00', '2021-05-2 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 14:37:00', '2021-05-3 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 14:37:00', '2021-05-4 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 14:37:00', '2021-05-5 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 14:37:00', '2021-05-6 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 14:37:00', '2021-05-7 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 14:37:00', '2021-05-8 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 14:37:00', '2021-05-9 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 14:37:00', '2021-05-10 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 14:37:00', '2021-05-11 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 14:37:00', '2021-05-12 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 14:37:00', '2021-05-13 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 14:37:00', '2021-05-14 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 14:37:00', '2021-05-15 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 14:37:00', '2021-05-16 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 14:37:00', '2021-05-17 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 14:37:00', '2021-05-18 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 14:37:00', '2021-05-19 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 14:37:00', '2021-05-20 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 14:37:00', '2021-05-21 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 14:37:00', '2021-05-22 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 14:37:00', '2021-05-23 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 14:37:00', '2021-05-24 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 14:37:00', '2021-05-25 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 14:37:00', '2021-05-26 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 14:37:00', '2021-05-27 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 14:37:00', '2021-05-28 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 14:37:00', '2021-05-29 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 14:37:00', '2021-05-30 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 14:37:00', '2021-05-31 1 1:21:00', 'Y7 287', 'Airbus 321', 'ожидает', 'вылет', 16, 21);

-- U6 076
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 00:10:00', '2021-05-1 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 00:10:00', '2021-05-2 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 00:10:00', '2021-05-3 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 00:10:00', '2021-05-4 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 00:10:00', '2021-05-5 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 00:10:00', '2021-05-6 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 00:10:00', '2021-05-7 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 00:10:00', '2021-05-8 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 00:10:00', '2021-05-9 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 00:10:00', '2021-05-10 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 00:10:00', '2021-05-11 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 00:10:00', '2021-05-12 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 00:10:00', '2021-05-13 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 00:10:00', '2021-05-14 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 00:10:00', '2021-05-15 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 00:10:00', '2021-05-16 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 00:10:00', '2021-05-17 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 00:10:00', '2021-05-18 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 00:10:00', '2021-05-19 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 00:10:00', '2021-05-20 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 00:10:00', '2021-05-21 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 00:10:00', '2021-05-22 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 00:10:00', '2021-05-23 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 00:10:00', '2021-05-24 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 00:10:00', '2021-05-25 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 00:10:00', '2021-05-26 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 00:10:00', '2021-05-27 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 00:10:00', '2021-05-28 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 00:10:00', '2021-05-29 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 00:10:00', '2021-05-30 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 00:10:00', '2021-05-31 22:21:00', 'U6 076', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 37);

-- U6 9440
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 04:00:00', '2021-05-1 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 04:00:00', '2021-05-2 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 04:00:00', '2021-05-3 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 04:00:00', '2021-05-4 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 04:00:00', '2021-05-5 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 04:00:00', '2021-05-6 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 04:00:00', '2021-05-7 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 04:00:00', '2021-05-8 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 04:00:00', '2021-05-9 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 04:00:00', '2021-05-10 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 04:00:00', '2021-05-11 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 04:00:00', '2021-05-12 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 04:00:00', '2021-05-13 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 04:00:00', '2021-05-14 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 04:00:00', '2021-05-15 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 04:00:00', '2021-05-16 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 04:00:00', '2021-05-17 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 04:00:00', '2021-05-18 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 04:00:00', '2021-05-19 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 04:00:00', '2021-05-20 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 04:00:00', '2021-05-21 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 04:00:00', '2021-05-22 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 04:00:00', '2021-05-23 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 04:00:00', '2021-05-24 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 04:00:00', '2021-05-25 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 04:00:00', '2021-05-26 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 04:00:00', '2021-05-27 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 04:00:00', '2021-05-28 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 04:00:00', '2021-05-29 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 04:00:00', '2021-05-30 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 04:00:00', '2021-05-31 02:38:00', 'U6 9440', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 36);

-- U6 388
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 07:15:00', '2021-05-1 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 07:15:00', '2021-05-2 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 07:15:00', '2021-05-3 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 07:15:00', '2021-05-4 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 07:15:00', '2021-05-5 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 07:15:00', '2021-05-6 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 07:15:00', '2021-05-7 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 07:15:00', '2021-05-8 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 07:15:00', '2021-05-9 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 07:15:00', '2021-05-10 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 07:15:00', '2021-05-11 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 07:15:00', '2021-05-12 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 07:15:00', '2021-05-13 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 07:15:00', '2021-05-14 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 07:15:00', '2021-05-15 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 07:15:00', '2021-05-16 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 07:15:00', '2021-05-17 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 07:15:00', '2021-05-18 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 07:15:00', '2021-05-19 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 07:15:00', '2021-05-20 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 07:15:00', '2021-05-21 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 07:15:00', '2021-05-22 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 07:15:00', '2021-05-23 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 07:15:00', '2021-05-24 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 07:15:00', '2021-05-25 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 07:15:00', '2021-05-26 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 07:15:00', '2021-05-27 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 07:15:00', '2021-05-28 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 07:15:00', '2021-05-29 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 07:15:00', '2021-05-30 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 07:15:00', '2021-05-31 3:48:00', 'U6 388', '32Q', 'Прибыл', 'прилет', 24, 38);

-- U6 609
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 07:10:00', '2021-05-1 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 07:10:00', '2021-05-2 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 07:10:00', '2021-05-3 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 07:10:00', '2021-05-4 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 07:10:00', '2021-05-5 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 07:10:00', '2021-05-6 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 07:10:00', '2021-05-7 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 07:10:00', '2021-05-8 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 07:10:00', '2021-05-9 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 07:10:00', '2021-05-10 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 07:10:00', '2021-05-11 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 07:10:00', '2021-05-12 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 07:10:00', '2021-05-13 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 07:10:00', '2021-05-14 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 07:10:00', '2021-05-15 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 07:10:00', '2021-05-16 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 07:10:00', '2021-05-17 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 07:10:00', '2021-05-18 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 07:10:00', '2021-05-19 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 07:10:00', '2021-05-20 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 07:10:00', '2021-05-21 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 07:10:00', '2021-05-22 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 07:10:00', '2021-05-23 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 07:10:00', '2021-05-24 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 07:10:00', '2021-05-25 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 07:10:00', '2021-05-26 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 07:10:00', '2021-05-27 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 07:10:00', '2021-05-28 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 07:10:00', '2021-05-29 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 07:10:00', '2021-05-30 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 07:10:00', '2021-05-31 4:42:00', 'U6 609', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 39);

-- U6 264
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 07:19:00', '2021-05-1 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 07:19:00', '2021-05-2 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 07:19:00', '2021-05-3 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 07:19:00', '2021-05-4 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 07:19:00', '2021-05-5 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 07:19:00', '2021-05-6 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 07:19:00', '2021-05-7 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 07:19:00', '2021-05-8 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 07:19:00', '2021-05-9 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 07:19:00', '2021-05-10 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 07:19:00', '2021-05-11 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 07:19:00', '2021-05-12 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 07:19:00', '2021-05-13 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 07:19:00', '2021-05-14 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 07:19:00', '2021-05-15 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 07:19:00', '2021-05-16 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 07:19:00', '2021-05-17 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 07:19:00', '2021-05-18 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 07:19:00', '2021-05-19 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 07:19:00', '2021-05-20 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 07:19:00', '2021-05-21 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 07:19:00', '2021-05-22 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 07:19:00', '2021-05-23 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 07:19:00', '2021-05-24 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 07:19:00', '2021-05-25 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 07:19:00', '2021-05-26 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 07:19:00', '2021-05-27 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 07:19:00', '2021-05-28 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 07:19:00', '2021-05-29 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 07:19:00', '2021-05-30 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 07:19:00', '2021-05-31 4:58:00', 'U6 264', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 40);

-- U6 342
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 07:27:00', '2021-05-1 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 07:27:00', '2021-05-2 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 07:27:00', '2021-05-3 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 07:27:00', '2021-05-4 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 07:27:00', '2021-05-5 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 07:27:00', '2021-05-6 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 07:27:00', '2021-05-7 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 07:27:00', '2021-05-8 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 07:27:00', '2021-05-9 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 07:27:00', '2021-05-10 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 07:27:00', '2021-05-11 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 07:27:00', '2021-05-12 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 07:27:00', '2021-05-13 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 07:27:00', '2021-05-14 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 07:27:00', '2021-05-15 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 07:27:00', '2021-05-16 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 07:27:00', '2021-05-17 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 07:27:00', '2021-05-18 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 07:27:00', '2021-05-19 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 07:27:00', '2021-05-20 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 07:27:00', '2021-05-21 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 07:27:00', '2021-05-22 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 07:27:00', '2021-05-23 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 07:27:00', '2021-05-24 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 07:27:00', '2021-05-25 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 07:27:00', '2021-05-26 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 07:27:00', '2021-05-27 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 07:27:00', '2021-05-28 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 07:27:00', '2021-05-29 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 07:27:00', '2021-05-30 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 07:27:00', '2021-05-31 4:50:00', 'U6 342', 'Airbus 321', 'Прибыл', 'прилет', 24, 41);

-- U6 012
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 07:50:00', '2021-05-1 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 07:50:00', '2021-05-2 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 07:50:00', '2021-05-3 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 07:50:00', '2021-05-4 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 07:50:00', '2021-05-5 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 07:50:00', '2021-05-6 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 07:50:00', '2021-05-7 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 07:50:00', '2021-05-8 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 07:50:00', '2021-05-9 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 07:50:00', '2021-05-10 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 07:50:00', '2021-05-11 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 07:50:00', '2021-05-12 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 07:50:00', '2021-05-13 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 07:50:00', '2021-05-14 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 07:50:00', '2021-05-15 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 07:50:00', '2021-05-16 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 07:50:00', '2021-05-17 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 07:50:00', '2021-05-18 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 07:50:00', '2021-05-19 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 07:50:00', '2021-05-20 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 07:50:00', '2021-05-21 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 07:50:00', '2021-05-22 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 07:50:00', '2021-05-23 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 07:50:00', '2021-05-24 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 07:50:00', '2021-05-25 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 07:50:00', '2021-05-26 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 07:50:00', '2021-05-27 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 07:50:00', '2021-05-28 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 07:50:00', '2021-05-29 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 07:50:00', '2021-05-30 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 07:50:00', '2021-05-31 3:30:00', 'U6 012', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 42);

-- U6 652
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 07:40:00', '2021-05-1 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 07:40:00', '2021-05-2 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 07:40:00', '2021-05-3 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 07:40:00', '2021-05-4 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 07:40:00', '2021-05-5 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 07:40:00', '2021-05-6 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 07:40:00', '2021-05-7 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 07:40:00', '2021-05-8 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 07:40:00', '2021-05-9 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 07:40:00', '2021-05-10 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 07:40:00', '2021-05-11 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 07:40:00', '2021-05-12 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 07:40:00', '2021-05-13 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 07:40:00', '2021-05-14 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 07:40:00', '2021-05-15 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 07:40:00', '2021-05-16 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 07:40:00', '2021-05-17 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 07:40:00', '2021-05-18 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 07:40:00', '2021-05-19 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 07:40:00', '2021-05-20 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 07:40:00', '2021-05-21 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 07:40:00', '2021-05-22 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 07:40:00', '2021-05-23 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 07:40:00', '2021-05-24 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 07:40:00', '2021-05-25 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 07:40:00', '2021-05-26 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 07:40:00', '2021-05-27 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 07:40:00', '2021-05-28 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 07:40:00', '2021-05-29 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 07:40:00', '2021-05-30 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 07:40:00', '2021-05-31 3:28:00', 'U6 652', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 43);

-- U6 099
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 08:30:00', '2021-05-1 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 08:30:00', '2021-05-2 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 08:30:00', '2021-05-3 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 08:30:00', '2021-05-4 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 08:30:00', '2021-05-5 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 08:30:00', '2021-05-6 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 08:30:00', '2021-05-7 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 08:30:00', '2021-05-8 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 08:30:00', '2021-05-9 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 08:30:00', '2021-05-10 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 08:30:00', '2021-05-11 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 08:30:00', '2021-05-12 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 08:30:00', '2021-05-13 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 08:30:00', '2021-05-14 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 08:30:00', '2021-05-15 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 08:30:00', '2021-05-16 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 08:30:00', '2021-05-17 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 08:30:00', '2021-05-18 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 08:30:00', '2021-05-19 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 08:30:00', '2021-05-20 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 08:30:00', '2021-05-21 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 08:30:00', '2021-05-22 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 08:30:00', '2021-05-23 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 08:30:00', '2021-05-24 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 08:30:00', '2021-05-25 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 08:30:00', '2021-05-26 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 08:30:00', '2021-05-27 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 08:30:00', '2021-05-28 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 08:30:00', '2021-05-29 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 08:30:00', '2021-05-30 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 08:30:00', '2021-05-31 4:37:00', 'U6 099', 'Airbus 321', 'Прибыл', 'прилет', 24, 34);

-- U6 130
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 08:10:00', '2021-05-1 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 08:10:00', '2021-05-2 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 08:10:00', '2021-05-3 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 08:10:00', '2021-05-4 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 08:10:00', '2021-05-5 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 08:10:00', '2021-05-6 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 08:10:00', '2021-05-7 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 08:10:00', '2021-05-8 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 08:10:00', '2021-05-9 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 08:10:00', '2021-05-10 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 08:10:00', '2021-05-11 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 08:10:00', '2021-05-12 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 08:10:00', '2021-05-13 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 08:10:00', '2021-05-14 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 08:10:00', '2021-05-15 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 08:10:00', '2021-05-16 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 08:10:00', '2021-05-17 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 08:10:00', '2021-05-18 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 08:10:00', '2021-05-19 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 08:10:00', '2021-05-20 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 08:10:00', '2021-05-21 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 08:10:00', '2021-05-22 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 08:10:00', '2021-05-23 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 08:10:00', '2021-05-24 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 08:10:00', '2021-05-25 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 08:10:00', '2021-05-26 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 08:10:00', '2021-05-27 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 08:10:00', '2021-05-28 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 08:10:00', '2021-05-29 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 08:10:00', '2021-05-30 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 08:10:00', '2021-05-31 7:16:00', 'U6 130', 'Airbus 320-200', 'Прибыл', 'прилет', 24, 44);

-- U6 341
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 02:50:00', '2021-05-1 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 02:50:00', '2021-05-2 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 02:50:00', '2021-05-3 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 02:50:00', '2021-05-4 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 02:50:00', '2021-05-5 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 02:50:00', '2021-05-6 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 02:50:00', '2021-05-7 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 02:50:00', '2021-05-8 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 02:50:00', '2021-05-9 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 02:50:00', '2021-05-10 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 02:50:00', '2021-05-11 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 02:50:00', '2021-05-12 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 02:50:00', '2021-05-13 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 02:50:00', '2021-05-14 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 02:50:00', '2021-05-15 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 02:50:00', '2021-05-16 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 02:50:00', '2021-05-17 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 02:50:00', '2021-05-18 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 02:50:00', '2021-05-19 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 02:50:00', '2021-05-20 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 02:50:00', '2021-05-21 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 02:50:00', '2021-05-22 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 02:50:00', '2021-05-23 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 02:50:00', '2021-05-24 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 02:50:00', '2021-05-25 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 02:50:00', '2021-05-26 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 02:50:00', '2021-05-27 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 02:50:00', '2021-05-28 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 02:50:00', '2021-05-29 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 02:50:00', '2021-05-30 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 02:50:00', '2021-05-31 0:40:00', 'U6 341', 'Airbus 321', 'Прибыл', 'вылет', 24, 45);

-- U6 610
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 02:50:00', '2021-05-1 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 02:50:00', '2021-05-2 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 02:50:00', '2021-05-3 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 02:50:00', '2021-05-4 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 02:50:00', '2021-05-5 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 02:50:00', '2021-05-6 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 02:50:00', '2021-05-7 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 02:50:00', '2021-05-8 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 02:50:00', '2021-05-9 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 02:50:00', '2021-05-10 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 02:50:00', '2021-05-11 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 02:50:00', '2021-05-12 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 02:50:00', '2021-05-13 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 02:50:00', '2021-05-14 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 02:50:00', '2021-05-15 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 02:50:00', '2021-05-16 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 02:50:00', '2021-05-17 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 02:50:00', '2021-05-18 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 02:50:00', '2021-05-19 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 02:50:00', '2021-05-20 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 02:50:00', '2021-05-21 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 02:50:00', '2021-05-22 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 02:50:00', '2021-05-23 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 02:50:00', '2021-05-24 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 02:50:00', '2021-05-25 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 02:50:00', '2021-05-26 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 02:50:00', '2021-05-27 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 02:50:00', '2021-05-28 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 02:50:00', '2021-05-29 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 02:50:00', '2021-05-30 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 02:50:00', '2021-05-31 0:40:00', 'U6 610', 'Airbus 321', 'Прибыл', 'вылет', 24, 46);

-- U6 575
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-1 08:50:00', '2021-05-1 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-2 08:50:00', '2021-05-2 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-3 08:50:00', '2021-05-3 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-4 08:50:00', '2021-05-4 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-5 08:50:00', '2021-05-5 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-6 08:50:00', '2021-05-6 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-7 08:50:00', '2021-05-7 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-8 08:50:00', '2021-05-8 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-9 08:50:00', '2021-05-9 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-10 08:50:00', '2021-05-10 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-11 08:50:00', '2021-05-11 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-12 08:50:00', '2021-05-12 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-13 08:50:00', '2021-05-13 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-14 08:50:00', '2021-05-14 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-15 08:50:00', '2021-05-15 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-16 08:50:00', '2021-05-16 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-17 08:50:00', '2021-05-17 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-18 08:50:00', '2021-05-18 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-19 08:50:00', '2021-05-19 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-20 08:50:00', '2021-05-20 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-21 08:50:00', '2021-05-21 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-22 08:50:00', '2021-05-22 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-23 08:50:00', '2021-05-23 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-24 08:50:00', '2021-05-24 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-25 08:50:00', '2021-05-25 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-26 08:50:00', '2021-05-26 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-27 08:50:00', '2021-05-27 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-28 08:50:00', '2021-05-28 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-29 08:50:00', '2021-05-29 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-30 08:50:00', '2021-05-30 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
insert into flights (arrival_date, departure_date, flight_number, plane_model, status, type, company_code, route_id) values ('2021-05-31 08:50:00', '2021-05-31 6:00:00', 'U6 575', 'Airbus 321', 'Прибыл', 'вылет', 24, 47);
