DROP DATABASE IF EXISTS student_passwords;
CREATE DATABASE student_passwords DEFAULT CHARACTER SET utf8mb4;

DROP USER IF EXISTS 'passwords_user'@'localhost';
CREATE USER 'passwords_user'@'localhost' IDENTIFIED BY '';
GRANT ALL ON student_passwords.* TO 'passwords_user'@'localhost';

USE student_passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('assignment 3', 256));
SET @init_vector = RANDOM_BYTES(16);

CREATE TABLE IF NOT EXISTS user (
    user_id SMALLINT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,

    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS website (
    website_id SMALLINT NOT NULL AUTO_INCREMENT,
    website_name VARCHAR(128) NOT NULL,
    url VARCHAR(128) NOT NULL UNIQUE,

    PRIMARY KEY (website_id)
);
