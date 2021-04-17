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
