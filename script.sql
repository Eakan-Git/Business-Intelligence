CREATE DATABASE stage;
CREATE DATABASE nds;
CREATE DATABASE dds;
CREATE DATABASE metadata;
CREATE DATABASE tcgt_01;
CREATE DATABASE tcgt_02;
CREATE DATABASE tcgt_03;
CREATE DATABASE tcgt_04;

CREATE TABLE IF NOT EXISTS data_flow (
  id SERIAL PRIMARY KEY,
  table_name VARCHAR(50) NULL,
  cet TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  lset TIMESTAMP WITH TIME ZONE DEFAULT NULL
);

INSERT INTO data_flow ("table_name") VALUES ('tcgt_01');
INSERT INTO data_flow ("table_name") VALUES ('tcgt_02');
INSERT INTO data_flow ("table_name") VALUES ('tcgt_03');
INSERT INTO data_flow ("table_name") VALUES ('tcgt_04');
-- 1 2 3 4 & stage
CREATE TABLE IF NOT EXISTS tra_chanh_gia_tay (
  "ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(50) NULL,
  "Gender" VARCHAR(10) NULL,
  "TimeArrived" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  "TimeAway" TIMESTAMP WITH TIME ZONE DEFAULT NULL
);
--CREATE USER airflow WITH PASSWORD 'airflow';
--ALTER USER airflow WITH SUPERUSER;
--select * from tra_chanh_gia_tay tcgt 