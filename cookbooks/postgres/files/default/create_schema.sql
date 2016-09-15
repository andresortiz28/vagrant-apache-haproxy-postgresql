create user pi with password 'security++';
alter role pi with createdb;
create database swn owner pi;
\connect swn

CREATE TABLE devices(
       id     integer NOT NULL PRIMARY KEY,
       device_name  varchar(50) NOT NULL UNIQUE
);

CREATE TABLE consumption(
       id   integer NOT NULL PRIMARY KEY,
       dates date  NOT NULL,
       device_id integer references devices(id)
);

grant all privileges on table devices to pi;
grant all privileges on table consumption to pi;

INSERT INTO devices (id, device_name) VALUES (1 , 'Samsung Galaxy s7 edge');
INSERT INTO devices (id, device_name) VALUES (2 , 'Samsung Galaxy s7');
INSERT INTO devices (id, device_name) VALUES (3 , 'HTC 10');
INSERT INTO devices (id, device_name) VALUES (4 , 'Huawei P9');
INSERT INTO devices (id, device_name) VALUES (5 , 'Samsung Galaxy s6');
INSERT INTO devices (id, device_name) VALUES (6 , 'Sony Xperia Z5');
INSERT INTO devices (id, device_name) VALUES (7 , 'Xiaomi Mi 5');
INSERT INTO devices (id, device_name) VALUES (8 , 'Huawei Mate');
INSERT INTO devices (id, device_name) VALUES (9 , 'iPhone 6s plus');
INSERT INTO devices (id, device_name) VALUES (10 , 'iPhone 6s');