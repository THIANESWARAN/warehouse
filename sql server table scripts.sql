create database demo;

create table items (
	id bigint not null IDENTITY(1,1) PRIMARY KEY,
    name varchar(100) not null unique,
    description varchar (250) null default null,
    price real not null default 0,
    created_time DATETIME not null default current_timestamp,
    created_by bigint not null default 0,
    updated_time DATETIME null default null,
    updated_by bigint null default 0,
);