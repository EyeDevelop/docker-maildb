-- Create database for the mail details.
CREATE DATABASE maildb;

-- Create a user with select-only access for the new database.
CREATE USER 'mailadmin'@'%' IDENTIFIED BY '%password%';
GRANT SELECT ON maildb.* TO 'mailadmin'@'%';

-- Switch to the new database for table creation.
USE maildb;

-- Create all the tables.
CREATE TABLE domains (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` TEXT NOT NULL UNIQUE
) DEFAULT CHARSET=utf8;

CREATE TABLE users (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `domain_id` INT ,
    `hash` TEXT NOT NULL,
    `email` VARCHAR(120) NOT NULL UNIQUE,

    FOREIGN KEY (domain_id) REFERENCES domains(id) ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE aliases (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `domain_id` INT NOT NULL,
    `source` VARCHAR(120) NOT NULL,
    `destination` VARCHAR(120) NOT NULL,

    FOREIGN KEY (domain_id) REFERENCES domains(id) ON DELETE CASCADE,
    UNIQUE KEY `src_dst_unique` (`domain_id`, `source`, `destination`)
) DEFAULT CHARSET=utf8;
